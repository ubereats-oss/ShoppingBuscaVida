# Shopping Busca Vida — App Oficial

App Flutter para iOS e Android do **Shopping Busca Vida**, localizado na Estrada do Coco (BA-099), Km 10, Vila de Abrantes, Camaçari/BA.

## Funcionalidades

- Home com informações do shopping, horários e contato
- Listagem de lojas por categoria (Âncoras, Moda, Alimentação, Saúde, Lazer)
- Busca de lojas
- Links diretos para WhatsApp, Instagram e Facebook
- Botão "Como chegar" com integração ao mapa

## Tecnologia

- Flutter / Dart
- Suporte: Android e iOS
- CI/CD: Codemagic

## Configuração

```bash
flutter pub get
cd ios && pod install
flutter run
```

## Build App Store

Usar o workflow `ios_app_store` no Codemagic. Requer as variáveis de ambiente:
- `APP_STORE_CONNECT_ISSUER_ID`
- `APP_STORE_CONNECT_KEY_IDENTIFIER`
- `APP_STORE_CONNECT_PRIVATE_KEY`

## Bundle ID

- iOS / Android: `com.shopping.buscavida`
