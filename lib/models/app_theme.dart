import 'package:flutter/material.dart';

class AppTheme {
  // ─── Palette ────────────────────────────────────────────────────────────────
  static const Color background   = Color(0xFFF5F5F5);
  static const Color surface      = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFFAFAFA);
  static const Color cardBorder   = Color(0xFFE0E0E0);

  static const Color primary      = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFF9D97FF);
  static const Color accent       = Color(0xFF00BFA5);

  static const Color underweight  = Color(0xFF42A5F5);
  static const Color normal       = Color(0xFF00BFA5);
  static const Color overweight   = Color(0xFFFFB74D);
  static const Color obese        = Color(0xFFEF5350);

  static const Color textPrimary   = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);

  // ─── Gradients ──────────────────────────────────────────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF9D97FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient bgGradient = LinearGradient(
    colors: [Color(0xFFF5F5F5), Color(0xFFEEEEEE)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ─── Theme ──────────────────────────────────────────────────────────────────
  static ThemeData get dark => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.light(
          primary: primary,
          secondary: accent,
          surface: surface,
        ),
        useMaterial3: true,
      );

  // ─── Category helpers ────────────────────────────────────────────────────────
  static Color categoryColor(String category) {
    switch (category) {
      case 'Underweight': return underweight;
      case 'Normal':      return normal;
      case 'Overweight':  return overweight;
      case 'Obese':       return obese;
      default:            return primary;
    }
  }

  static List<Color> categoryGradient(String category) {
    switch (category) {
      case 'Underweight': return [const Color(0xFF42A5F5), const Color(0xFF1976D2)];
      case 'Normal':      return [const Color(0xFF00BFA5), const Color(0xFF00897B)];
      case 'Overweight':  return [const Color(0xFFFFB74D), const Color(0xFFF57C00)];
      case 'Obese':       return [const Color(0xFFEF5350), const Color(0xFFB71C1C)];
      default:            return [primary, primaryLight];
    }
  }

  static String categoryEmoji(String category) {
    switch (category) {
      case 'Underweight': return '🧊';
      case 'Normal':      return '✅';
      case 'Overweight':  return '⚠️';
      case 'Obese':       return '🔴';
      default:            return '📊';
    }
  }
}
