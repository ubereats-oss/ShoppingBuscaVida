import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sbv_app/core/theme/app_theme.dart';
import 'package:sbv_app/core/constants/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF1168A8),
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _HeroSection(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    _CategoriasSection(),
                    const SizedBox(height: 14),
                    _VantagensCard(),
                    const SizedBox(height: 14),
                    _HorarioCard(),
                    const SizedBox(height: 14),
                    _ContatoCard(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const _BottomNav(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HERO
// ─────────────────────────────────────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFF1168A8),
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 18,
            right: 18,
            bottom: 0,
          ),
          height: MediaQuery.of(context).padding.top + 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: double.infinity,
                child: Image.asset(
                  AppConstants.logoPath,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const _LogoFallback(),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.blue,
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Seu caminho para o bem viver',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 0.8,
                  color: AppColors.orange,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    height: 1.25,
                  ),
                  children: [
                    TextSpan(text: 'Moda, saude, lazer e '),
                    TextSpan(
                      text: 'muito mais',
                      style: TextStyle(color: AppColors.orange),
                    ),
                    TextSpan(text: ' em um so lugar'),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.15),
                    width: 0.5,
                  ),
                ),
                child: Row(
                  children: [
                    _StatItem(value: '${AppConstants.totalLojas}',      label: 'Lojas'),
                    _StatDivider(),
                    _StatItem(value: '${AppConstants.totalEspacos}+',   label: 'Espacos'),
                    _StatDivider(),
                    _StatItem(value: '${AppConstants.anosDeHistoria}',  label: 'Abertura'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.orange,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: Colors.white.withValues(alpha: 0.55),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5,
      height: 44,
      color: Colors.white.withValues(alpha: 0.15),
    );
  }
}

class _LogoFallback extends StatelessWidget {
  const _LogoFallback();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.store, color: AppColors.blue, size: 28),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CATEGORIAS
// ─────────────────────────────────────────────────────────────────────────────
class _CategoriasSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cats = [
      _CatData(label: 'Lojas',       emoji: '🛍️', bgColor: const Color(0xFFE3F4FB), route: '/lojas'),
      _CatData(label: 'Alimentacao', emoji: '🍽️', bgColor: const Color(0xFFFFF0E8), route: '/alimentacao'),
      _CatData(label: 'Saude',       emoji: '🏥', bgColor: const Color(0xFFE8EEFF), route: '/saude'),
      _CatData(label: 'Servicos',    emoji: '💼', bgColor: const Color(0xFFF0EAF8), route: '/servicos'),
    ];

    return Column(
      children: [
        _SectionHeader(title: 'O que voce procura?', linkLabel: 'Ver tudo', onTap: () {}),
        const SizedBox(height: 10),
        Row(
          children: List.generate(cats.length, (i) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: i < cats.length - 1 ? 8 : 0),
                child: _CatItem(data: cats[i]),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _CatData {
  const _CatData({
    required this.label,
    required this.emoji,
    required this.bgColor,
    required this.route,
  });
  final String label;
  final String emoji;
  final Color bgColor;
  final String route;
}

class _CatItem extends StatelessWidget {
  const _CatItem({required this.data});
  final _CatData data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, data.route),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE0E0E0), width: 0.5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Column(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: data.bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(data.emoji, style: const TextStyle(fontSize: 19)),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              data.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: Color(0xFF555555),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// VANTAGENS
// ─────────────────────────────────────────────────────────────────────────────
class _VantagensCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const items = [
      _VantagemData(emoji: '🅿️', title: 'Estacionamento amplo',         desc: 'Facil acesso e estacionamento gratuito'),
      _VantagemData(emoji: '📍', title: 'Localizacao privilegiada',      desc: 'Estrada do Coco, Km 10 - Abrantes, Camacari'),
      _VantagemData(emoji: '🛍️', title: 'Variedade completa',           desc: 'Moda, alimentacao, saude e servicos'),
    ];

    return _InfoCard(
      title: 'Por que nos visitar',
      child: Column(
        children: List.generate(items.length, (i) {
          return Column(
            children: [
              _VantagemRow(data: items[i]),
              if (i < items.length - 1) ...[
                const SizedBox(height: 10),
                const Divider(height: 1),
                const SizedBox(height: 10),
              ],
            ],
          );
        }),
      ),
    );
  }
}

class _VantagemData {
  const _VantagemData({required this.emoji, required this.title, required this.desc});
  final String emoji;
  final String title;
  final String desc;
}

class _VantagemRow extends StatelessWidget {
  const _VantagemRow({required this.data});
  final _VantagemData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xFFE3F4FB),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(data.emoji, style: const TextStyle(fontSize: 17)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                data.desc,
                style: const TextStyle(fontSize: 11, color: AppColors.textSecond),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HORARIO
// ─────────────────────────────────────────────────────────────────────────────
class _HorarioCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _InfoCard(
      title: 'Horario de funcionamento',
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: AppColors.openBg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Aberto agora',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: AppColors.openGreen,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Seg a Sab',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.blue),
          ),
          const SizedBox(height: 6),
          _HorarioRow(dia: 'Lojas',       hora: AppConstants.horarioLojasSegSab),
          const SizedBox(height: 4),
          _HorarioRow(dia: 'Alimentacao', hora: AppConstants.horarioAlimSegSab),
          const SizedBox(height: 8),
          const Divider(height: 1),
          const SizedBox(height: 8),
          const Text(
            'Domingo',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.blue),
          ),
          const SizedBox(height: 6),
          _HorarioRow(dia: 'Alimentacao', hora: AppConstants.horarioAlimDom),
          const SizedBox(height: 4),
          _HorarioRow(dia: 'Lojas',       hora: AppConstants.horarioLojasDom),
        ],
      ),
    );
  }
}

class _HorarioRow extends StatelessWidget {
  const _HorarioRow({required this.dia, required this.hora});
  final String dia;
  final String hora;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(dia,  style: const TextStyle(fontSize: 12, color: AppColors.textSecond)),
        Text(hora, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.blue)),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CONTATO
// ─────────────────────────────────────────────────────────────────────────────
class _ContatoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _InfoCard(
      title: 'Fale com a gente',
      child: Column(
        children: [
          _ContatoRow(
            emoji: '📍',
            label: 'Endereco',
            value: '${AppConstants.enderecoRua}\n${AppConstants.enderecoBairro}',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _ContatoRow(
            emoji: '💬',
            label: 'WhatsApp',
            value: AppConstants.whatsappLabel,
            onTap: () {},
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _RedeBtn(label: 'Instagram', emoji: '📸', onTap: () {}),
              const SizedBox(width: 8),
              _RedeBtn(label: 'YouTube',   emoji: '▶️', onTap: () {}),
              const SizedBox(width: 8),
              _RedeBtn(label: 'Facebook',  emoji: '📘', onTap: () {}),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Text('📍'),
              label: const Text('Como chegar - Ver no mapa'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContatoRow extends StatelessWidget {
  const _ContatoRow({
    required this.emoji,
    required this.label,
    required this.value,
    required this.onTap,
  });
  final String emoji;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFEBEBEB), width: 0.5),
        ),
        child: Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 15)),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textHint)),
            const Spacer(),
            Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.blue,
              ),
            ),
            const SizedBox(width: 6),
            const Text('>', style: TextStyle(color: Color(0xFFBBBBBB), fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class _RedeBtn extends StatelessWidget {
  const _RedeBtn({required this.label, required this.emoji, required this.onTap});
  final String label;
  final String emoji;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFEBEBEB), width: 0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 13)),
              const SizedBox(width: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF555555),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SHARED WIDGETS
// ─────────────────────────────────────────────────────────────────────────────
class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.child, this.trailing});
  final String title;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 0.5),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue,
                ),
              ),
              if (trailing != null) ...[
                const Spacer(),
                trailing!,
              ],
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.linkLabel,
    required this.onTap,
  });
  final String title;
  final String linkLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.blue,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'Ver tudo',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.orangeDark,
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BOTTOM NAV
// ─────────────────────────────────────────────────────────────────────────────
class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(icon: Icons.home_rounded,    label: 'Inicio',    active: true),
      _NavItem(icon: Icons.search_rounded,  label: 'Buscar',    active: false),
      _NavItem(icon: Icons.event_rounded,   label: 'Eventos',   active: false),
      _NavItem(icon: Icons.favorite_rounded,label: 'Favoritos', active: false),
      _NavItem(icon: Icons.person_rounded,  label: 'Perfil',    active: false),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(top: BorderSide(color: Color(0xFFE0E0E0), width: 0.5)),
      ),
      padding: EdgeInsets.only(
        top: 8,
        bottom: MediaQuery.of(context).padding.bottom + 8,
      ),
      child: Row(
        children: items.map((item) => _NavButton(item: item)).toList(),
      ),
    );
  }
}

class _NavItem {
  _NavItem({required this.icon, required this.label, required this.active});
  final IconData icon;
  final String label;
  final bool active;
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.item});
  final _NavItem item;

  @override
  Widget build(BuildContext context) {
    final color = item.active ? AppColors.orangeDark : AppColors.textHint;
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(item.icon, size: 24, color: color),
            if (item.active)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: AppColors.orange,
                  shape: BoxShape.circle,
                ),
              )
            else
              const SizedBox(height: 8),
            Text(
              item.label,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
