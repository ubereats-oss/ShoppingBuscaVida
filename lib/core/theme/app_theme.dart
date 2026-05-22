import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  AppColors._();

  static const Color accent      = Color(0xFF29ABE2); // azul claro (anéis da logo)
  static const Color accentDark  = Color(0xFF1B8DBF); // azul médio
  static const Color blue        = Color(0xFF1A2D6B); // navy escuro (contorno da logo)
  static const Color blueMid     = Color(0xFF1479BF); // azul principal (fundo da logo)
  static const Color white       = Color(0xFFFFFFFF);
  static const Color background  = Color(0xFFF4F4F4);
  static const Color card        = Color(0xFFFFFFFF);
  static const Color divider     = Color(0xFFEBEBEB);
  static const Color textPrimary = Color(0xFF1A2D6B);
  static const Color textSecond  = Color(0xFF666666);
  static const Color textHint    = Color(0xFF999999);
  static const Color openGreen   = Color(0xFF2E7D32);
  static const Color openBg      = Color(0xFFE8F5E9);

  // aliases para não quebrar referências existentes a AppColors.orange
  static const Color orange      = accent;
  static const Color orangeDark  = accentDark;
}

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.blueMid,
        secondary: AppColors.blue,
        surface: AppColors.card,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.blueMid,
        foregroundColor: AppColors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.blueMid,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
        titleLarge: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: AppColors.blue,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.blue,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecond,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColors.textHint,
        ),
      ),
      dividerColor: AppColors.divider,
    );
  }
}
