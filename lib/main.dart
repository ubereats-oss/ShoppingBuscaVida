import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/home/screens/home_screen.dart';
import 'features/lojas/lojas_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SbvApp());
}

class SbvApp extends StatelessWidget {
  const SbvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Busca Vida',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeScreen(),
      routes: {
        '/lojas': (_) => const LojasScreen(),
      },
    );
  }
}
