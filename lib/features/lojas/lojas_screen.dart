import 'package:flutter/material.dart';
import 'package:sbv_app/core/theme/app_theme.dart';
import 'loja_model.dart';
import 'lojas_data.dart';

class LojasScreen extends StatefulWidget {
  const LojasScreen({super.key});

  @override
  State<LojasScreen> createState() => _LojasScreenState();
}

class _LojasScreenState extends State<LojasScreen> {
  String _andarAtivo = 'Todos';
  String _busca = '';
  final _searchController = TextEditingController();

  static const List<String> _andares = [
    'Todos',
    'Ancoras',
    'Moda',
    'Alimentacao',
    'Saude',
    'Lazer',
  ];

  static const Map<String, String> _andarLabel = {
    'Todos':       'Todos',
    'Ancoras':     'Âncoras',
    'Moda':        'Moda',
    'Alimentacao': 'Alimentação',
    'Saude':       'Saúde',
    'Lazer':       'Lazer',
  };

  List<LojaModel> get _lojasFiltradas {
    List<LojaModel> lista =
        _busca.isEmpty ? List.of(LojasData.todas) : LojasData.buscar(_busca);
    if (_andarAtivo != 'Todos') {
      lista = lista.where((l) => l.andar == _andarAtivo).toList();
    }
    // Lojas com logo primeiro
    lista.sort((a, b) {
      if (a.temLogo && !b.temLogo) return -1;
      if (!a.temLogo && b.temLogo) return 1;
      return a.nome.compareTo(b.nome);
    });
    return lista;
  }

  Map<String, List<LojaModel>> get _agrupadas {
    final lojas = _lojasFiltradas;
    final Map<String, List<LojaModel>> mapa = {};
    for (final loja in lojas) {
      mapa.putIfAbsent(loja.andar, () => []).add(loja);
    }
    return mapa;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _TopBar(total: _lojasFiltradas.length),
          _SearchBar(
            controller: _searchController,
            onChanged: (v) => setState(() => _busca = v),
          ),
          _FilterBar(
            andares: _andares,
            labels: _andarLabel,
            ativo: _andarAtivo,
            onSelect: (a) => setState(() => _andarAtivo = a),
          ),
          Expanded(
            child: _lojasFiltradas.isEmpty
                ? const _EmptyState()
                : _andarAtivo == 'Todos' && _busca.isEmpty
                    ? _ListaAgrupada(agrupadas: _agrupadas)
                    : _ListaSimples(lojas: _lojasFiltradas),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// TOP BAR
// ─────────────────────────────────────────────────────────────────────────────
class _TopBar extends StatelessWidget {
  const _TopBar({required this.total});
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blue,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                color: AppColors.white, size: 20),
          ),
          const SizedBox(width: 12),
          const Text(
            'Lojas',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          const Spacer(),
          Text(
            '$total lojas',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SEARCH BAR
// ─────────────────────────────────────────────────────────────────────────────
class _SearchBar extends StatelessWidget {
  const _SearchBar({required this.controller, required this.onChanged});
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.orange,
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: AppColors.white, fontSize: 13),
        decoration: InputDecoration(
          hintText: 'Buscar loja...',
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 13,
          ),
          prefixIcon: Icon(Icons.search_rounded,
              color: Colors.white.withValues(alpha: 0.8), size: 18),
          suffixIcon: controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    controller.clear();
                    onChanged('');
                  },
                  child: Icon(Icons.close_rounded,
                      color: Colors.white.withValues(alpha: 0.8), size: 18),
                )
              : null,
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FILTER BAR
// ─────────────────────────────────────────────────────────────────────────────
class _FilterBar extends StatelessWidget {
  const _FilterBar({
    required this.andares,
    required this.labels,
    required this.ativo,
    required this.onSelect,
  });
  final List<String> andares;
  final Map<String, String> labels;
  final String ativo;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.card,
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        itemCount: andares.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final a = andares[i];
          final ativo = this.ativo == a;
          return GestureDetector(
            onTap: () => onSelect(a),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: ativo ? AppColors.blue : AppColors.card,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ativo ? AppColors.blue : const Color(0xFFE0E0E0),
                  width: 0.5,
                ),
              ),
              child: Text(
                labels[a] ?? a,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: ativo ? AppColors.white : AppColors.textSecond,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// LISTA AGRUPADA POR ANDAR
// ─────────────────────────────────────────────────────────────────────────────
class _ListaAgrupada extends StatelessWidget {
  const _ListaAgrupada({required this.agrupadas});
  final Map<String, List<LojaModel>> agrupadas;

  @override
  Widget build(BuildContext context) {
    final ordem = ['Ancoras', 'Moda', 'Alimentacao', 'Saude', 'Lazer'];
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(14),
      children: ordem.where((a) => agrupadas.containsKey(a)).map((andar) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AndarLabel(label: andar),
            const SizedBox(height: 8),
            _GridLojas(lojas: agrupadas[andar]!),
            const SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// LISTA SIMPLES (busca ou filtro por andar)
// ─────────────────────────────────────────────────────────────────────────────
class _ListaSimples extends StatelessWidget {
  const _ListaSimples({required this.lojas});
  final List<LojaModel> lojas;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(14),
      children: [
        _GridLojas(lojas: lojas),
        const SizedBox(height: 16),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// GRID DE LOJAS
// ─────────────────────────────────────────────────────────────────────────────
class _GridLojas extends StatelessWidget {
  const _GridLojas({required this.lojas});
  final List<LojaModel> lojas;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.1,
      ),
      itemCount: lojas.length,
      itemBuilder: (_, i) => _LojaCard(loja: lojas[i]),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CARD DA LOJA
// ─────────────────────────────────────────────────────────────────────────────
class _LojaCard extends StatelessWidget {
  const _LojaCard({required this.loja});
  final LojaModel loja;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _mostrarDetalhe(context, loja),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE0E0E0), width: 0.5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _LogoWidget(loja: loja),
            const SizedBox(height: 8),
            Text(
              loja.nome,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.blue,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              loja.localizacao,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 9, color: AppColors.textHint),
            ),
            if (loja.temWhatsapp) ...[
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'WhatsApp',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2E7D32),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _mostrarDetalhe(BuildContext context, LojaModel loja) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _DetalheBottomSheet(loja: loja),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// LOGO WIDGET
// ─────────────────────────────────────────────────────────────────────────────
class _LogoWidget extends StatelessWidget {
  const _LogoWidget({required this.loja});
  final LojaModel loja;

  @override
  Widget build(BuildContext context) {
    if (loja.temLogo) {
      return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            loja.logoAsset!,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => _Iniciais(loja: loja),
          ),
        ),
      );
    }
    return _Iniciais(loja: loja);
  }
}

class _Iniciais extends StatelessWidget {
  const _Iniciais({required this.loja});
  final LojaModel loja;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFEEF0F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          loja.iniciais,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DETALHE BOTTOM SHEET
// ─────────────────────────────────────────────────────────────────────────────
class _DetalheBottomSheet extends StatelessWidget {
  const _DetalheBottomSheet({required this.loja});
  final LojaModel loja;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFDDDDDD),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          _LogoWidget(loja: loja),
          const SizedBox(height: 12),
          Text(
            loja.nome,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.blue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            loja.localizacao,
            style: const TextStyle(fontSize: 12, color: AppColors.textSecond),
          ),
          const SizedBox(height: 16),
          if (loja.telefone != null) ...[
            _InfoRow(icon: Icons.phone_rounded, label: loja.telefone!),
            const SizedBox(height: 8),
          ],
          if (loja.temWhatsapp) ...[
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chat_rounded, size: 18),
                label: const Text('Abrir WhatsApp'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366),
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textSecond),
        const SizedBox(width: 8),
        Text(label,
            style: const TextStyle(fontSize: 13, color: AppColors.textSecond)),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ANDAR LABEL
// ─────────────────────────────────────────────────────────────────────────────
class _AndarLabel extends StatelessWidget {
  const _AndarLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.orange,
        letterSpacing: 0.8,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// EMPTY STATE
// ─────────────────────────────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off_rounded, size: 48, color: AppColors.textHint),
          SizedBox(height: 12),
          Text(
            'Nenhuma loja encontrada',
            style: TextStyle(fontSize: 14, color: AppColors.textSecond),
          ),
        ],
      ),
    );
  }
}
