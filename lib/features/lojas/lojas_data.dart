import 'loja_model.dart';

class LojasData {
  LojasData._();

  static const List<LojaModel> todas = [
    // ── ÂNCORAS E SERVIÇOS ────────────────────────────────────────
    LojaModel(
      nome: 'Total Supermercados',
      localizacao: 'Âncora',
      andar: 'Ancoras',
    ),
    LojaModel(
      nome: 'Caixa Econômica Federal',
      localizacao: 'Serviços',
      andar: 'Ancoras',
    ),
    LojaModel(
      nome: 'SAC Bahia',
      localizacao: 'Serviços',
      andar: 'Ancoras',
    ),
    LojaModel(
      nome: 'Cinelaser',
      localizacao: 'Cinema',
      andar: 'Ancoras',
    ),

    // ── MODA ──────────────────────────────────────────────────────
    LojaModel(
      nome: 'Havaianas',
      localizacao: 'Moda',
      andar: 'Moda',
    ),
    LojaModel(
      nome: 'Barca95',
      localizacao: 'Moda',
      andar: 'Moda',
    ),
    LojaModel(
      nome: 'Linda Liz',
      localizacao: 'Moda Infantil',
      andar: 'Moda',
    ),
    LojaModel(
      nome: 'Constance',
      localizacao: 'Moda',
      andar: 'Moda',
    ),
    LojaModel(
      nome: 'GrandVision',
      localizacao: 'Óticas',
      andar: 'Moda',
    ),

    // ── ALIMENTAÇÃO ───────────────────────────────────────────────
    LojaModel(
      nome: "Bob's",
      localizacao: 'Alimentação',
      andar: 'Alimentacao',
    ),
    LojaModel(
      nome: 'Patroni Restaurante e Pizza',
      localizacao: 'Alimentação',
      andar: 'Alimentacao',
    ),
    LojaModel(
      nome: 'Cacau Show',
      localizacao: 'Alimentação',
      andar: 'Alimentacao',
    ),
    LojaModel(
      nome: 'Oxente Hamburgueria',
      localizacao: 'Alimentação',
      andar: 'Alimentacao',
    ),
    LojaModel(
      nome: 'Carambola',
      localizacao: 'Alimentação',
      andar: 'Alimentacao',
    ),

    // ── SAÚDE & BEM-ESTAR ─────────────────────────────────────────
    LojaModel(
      nome: 'Óticas Carol',
      localizacao: 'Saúde',
      andar: 'Saude',
    ),
    LojaModel(
      nome: 'Clínica São Matheus',
      localizacao: 'Saúde',
      andar: 'Saude',
    ),
    LojaModel(
      nome: 'Pitaya Beauty',
      localizacao: 'Bem-estar',
      andar: 'Saude',
    ),
    LojaModel(
      nome: 'Rede Bem Drogarias',
      localizacao: 'Farmácia',
      andar: 'Saude',
    ),
    LojaModel(
      nome: 'Academia',
      localizacao: 'Fitness',
      andar: 'Saude',
    ),

    // ── LAZER ─────────────────────────────────────────────────────
    LojaModel(
      nome: 'Parque Amazolândia',
      localizacao: 'Espaço Infantil',
      andar: 'Lazer',
    ),
  ];

  static List<String> get andares => todas.map((l) => l.andar).toSet().toList();

  static List<LojaModel> porAndar(String andar) =>
      todas.where((l) => l.andar == andar).toList();

  static List<LojaModel> buscar(String query) {
    final q = query.toLowerCase();
    return todas.where((l) => l.nome.toLowerCase().contains(q)).toList();
  }
}
