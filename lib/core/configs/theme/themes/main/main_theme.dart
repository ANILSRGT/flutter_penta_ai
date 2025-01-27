import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/theme/app_colors.dart';
import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_core/penta_core.dart';

final class MainTheme extends IAppTheme {
  @override
  AppColors get colors => AppColors(
        primary: OnColor(
          value: const Color(0xFFD91656),
          onColor: const Color(0xFFFBFBFB),
        ),
        secondary: OnColor(
          value: const Color(0xFFEB5B00),
          onColor: const Color(0xFFFBFBFB),
        ),
        background: BrightnessOnColor(
          light: OnColor(
            value: const Color(0xFFFBFBFB),
            onColor: const Color(0xFF1A1A1A),
          ),
          dark: OnColor(
            value: const Color(0xFF1A1A1A),
            onColor: const Color(0xFFFBFBFB),
          ),
        ),
        white: BrightnessOnColor(
          light: OnColor(
            value: const Color(0xFFFBFBFB),
            onColor: const Color(0xFF1A1A1A),
          ),
          dark: OnColor(
            value: const Color(0xFF1A1A1A),
            onColor: const Color(0xFFFBFBFB),
          ),
        ),
        black: BrightnessOnColor(
          light: OnColor(
            value: const Color(0xFF1A1A1A),
            onColor: const Color(0xFFFBFBFB),
          ),
          dark: OnColor(
            value: const Color(0xFFFBFBFB),
            onColor: const Color(0xFF1A1A1A),
          ),
        ),
        grey: OnColor(
          value: const Color(0xFFBDBDBD),
          onColor: const Color(0xFF1A1A1A),
        ),
        lightGrey: OnColor(
          value: const Color(0xFFE0E0E0),
          onColor: const Color(0xFF1A1A1A),
        ),
        darkGrey: OnColor(
          value: const Color(0xFF616161),
          onColor: const Color(0xFFFBFBFB),
        ),
        error: BrightnessOnColor(
          light: OnColor(
            value: const Color(0xFFD32F2F),
            onColor: const Color(0xFFFBFBFB),
          ),
          dark: OnColor(
            value: const Color(0xFFA21F1F),
            onColor: const Color(0xFFFBFBFB),
          ),
        ),
        success: BrightnessOnColor(
          light: OnColor(
            value: const Color(0xFF388E3C),
            onColor: const Color(0xFFFBFBFB),
          ),
          dark: OnColor(
            value: const Color(0xFF2E7D32),
            onColor: const Color(0xFFFBFBFB),
          ),
        ),
        warning: BrightnessOnColor(
          light: OnColor(
            value: const Color(0xFFFBC02D),
            onColor: const Color(0xFF1A1A1A),
          ),
          dark: OnColor(
            value: const Color(0xFFC39C00),
            onColor: const Color(0xFF1A1A1A),
          ),
        ),
        info: BrightnessOnColor(
          light: OnColor(
            value: const Color(0xFF1976D2),
            onColor: const Color(0xFFFBFBFB),
          ),
          dark: OnColor(
            value: const Color(0xFF1257A5),
            onColor: const Color(0xFFFBFBFB),
          ),
        ),
      );

  @override
  ThemeData getThemeData(bool isDark) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: colors.primary,
      scaffoldBackgroundColor: colors.background.byBrightness(isDark),
      fontFamily: 'Montserrat',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
        ),
      ).apply(
        bodyColor: colors.background.byBrightness(isDark).onColor,
        displayColor: colors.background.byBrightness(isDark).onColor,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
