import 'package:flutter/cupertino.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFFF637E);
  static const Color destructive = Color(0xFFDC2626);
  static const Color info = Color(0xFF94A3B8);

  // Dynamic Background
  static const CupertinoDynamicColor background =
      CupertinoDynamicColor.withBrightness(
        color: backgroundLight,
        darkColor: backgroundDark,
      );

  // Dynamic Text
  static const CupertinoDynamicColor text =
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFF0F172A),
        darkColor: Color(0xFFFFFFFF),
      );

  // Dynamic Border
  static const CupertinoDynamicColor border =
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFFE2E8F0),
        darkColor: Color(0xFF1E293B),
      );

  // Dynamic Disabled
  static const CupertinoDynamicColor disabled =
      CupertinoDynamicColor.withBrightness(
        color: Color(0xFFF8FAFC),
        darkColor: Color(0xFF0F172A),
      );

  // Legacy/Reference colors (unmodified for backward compatibility if needed)
  static const Color backgroundLight = Color(0xFFF6F7F9);
  static const Color backgroundDark = Color(0xFF000000);
  static const Color textLight = Color(0xFF0F172A);
  static const Color textDark = Color(0xFFFFFFFF);
}
