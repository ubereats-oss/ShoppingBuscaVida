class LojaModel {
  const LojaModel({
    required this.nome,
    required this.localizacao,
    required this.andar,
    this.logoAsset,
    this.telefone,
    this.whatsapp,
  });

  final String nome;
  final String localizacao;
  final String andar;
  final String? logoAsset;
  final String? telefone;
  final String? whatsapp;

  String get iniciais {
    final partes = nome.trim().split(' ');
    if (partes.length == 1) return partes[0].substring(0, 2).toUpperCase();
    return '${partes[0][0]}${partes[1][0]}'.toUpperCase();
  }

  bool get temLogo => logoAsset != null;
  bool get temWhatsapp => whatsapp != null;
}
