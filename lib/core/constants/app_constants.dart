class AppConstants {
  AppConstants._();

  // ── Identidade ────────────────────────────────────────────────────
  static const String appName        = 'Shopping Busca Vida';
  static const String appNameShort   = 'SBV';
  static const String appSlogan      = 'Seu caminho para o bem viver';
  static const String appDescription =
      'Restaurantes, moda, saude, servicos e entretenimento em um so lugar. '
      'Localizado na Estrada do Coco, no distrito de Abrantes, Camacari/BA.';

  // ── Números do shopping ───────────────────────────────────────────
  static const int    totalLojas   = 80;
  static const int    totalEspacos = 80;
  static const int    anosDeHistoria = 2025; // ano de inauguração
  static const String dataInauguracao = 'Outubro de 2025';

  // ── Endereço ──────────────────────────────────────────────────────
  static const String enderecoCompleto =
      'Estrada do Coco (BA-099), Km 10 - Vila de Abrantes, Camacari - BA, 42.840-000';
  static const String enderecoRua    = 'Estrada do Coco (BA-099), Km 10';
  static const String enderecoBairro = 'Vila de Abrantes · Camacari - BA';
  static const String enderecoCep    = '42.840-000';
  static const double enderecoLat    = -12.7128; // TODO: confirmar coordenadas exatas
  static const double enderecoLng    = -38.3285;

  // ── Contatos ──────────────────────────────────────────────────────
  static const String whatsapp      = '5571981748088';
  static const String whatsappLabel = '(71) 98174-8088';
  static const String site          = 'https://shoppingbuscavida.com.br';
  static const String email         = 'comercial@shoppingbuscavida.com.br';

  // ── Redes sociais ─────────────────────────────────────────────────
  static const String instagram   = 'https://www.instagram.com/shoppingbuscavidaoficial/';
  static const String youtube     = ''; // TODO: preencher se houver
  static const String facebook    = 'https://www.facebook.com/p/Shopping-Busca-Vida-61568715705553/';
  static const String whatsappUrl = 'https://api.whatsapp.com/send/?phone=5571981748088';

  // ── Horários ──────────────────────────────────────────────────────
  static const String horarioLojasSegSab  = '9h às 21h';
  static const String horarioAlimSegSab   = '11h às 21h';
  static const String horarioLojasDom     = '13h às 20h';
  static const String horarioAlimDom      = '12h às 20h';

  // ── Assets ───────────────────────────────────────────────────────
  static const String logoPath = 'assets/images/logo_sbv.png';
}

class AppCategories {
  AppCategories._();

  static const List<Map<String, String>> items = [
    {
      'label': 'Lojas',
      'emoji': '🛍️',
      'route': '/lojas',
      'cor': 'orange',
    },
    {
      'label': 'Alimentacao',
      'emoji': '🍽️',
      'route': '/alimentacao',
      'cor': 'red',
    },
    {
      'label': 'Saude',
      'emoji': '🏥',
      'route': '/saude',
      'cor': 'blue',
    },
    {
      'label': 'Servicos',
      'emoji': '💼',
      'route': '/servicos',
      'cor': 'purple',
    },
  ];
}
