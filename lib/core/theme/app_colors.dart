import 'package:flutter/cupertino.dart';
import 'light_colors.dart';
import 'dark_colors.dart';

class AppColors {
  AppColors._();

  // Dynamic Background
  static const CupertinoDynamicColor background =
      CupertinoDynamicColor.withBrightness(
        color: LightColors.backgroundLight,
        darkColor: DarkColors.backgroundDark,
      );

  // Dynamic Foreground
  static const CupertinoDynamicColor foreground =
      CupertinoDynamicColor.withBrightness(
        color: LightColors.foregroundLight,
        darkColor: DarkColors.foregroundDark,
      );

  // Dynamic Card
  static const CupertinoDynamicColor card =
      CupertinoDynamicColor.withBrightness(
        color: LightColors.cardLight,
        darkColor: DarkColors.cardDark,
      );

  // Dynamic Card Foreground
  static const CupertinoDynamicColor cardForeground =
      CupertinoDynamicColor.withBrightness(
        color: LightColors.cardForegroundLight,
        darkColor: DarkColors.cardForegroundDark,
      );

  // Dynamic Primary
  static const CupertinoDynamicColor primary =
      CupertinoDynamicColor.withBrightness(
        color: LightColors.primaryLight,
        darkColor: DarkColors.primaryDark,
      );

  // Dynamic Primary Foreground
  static const CupertinoDynamicColor primaryForeground =
      CupertinoDynamicColor.withBrightness(
        color: LightColors.primaryForegroundLight,
        darkColor: DarkColors.primaryForegroundDark,
      );

  // Dynamic Secondary
  static const CupertinoDynamicColor secondary =
      CupertinoDynamicColor.withBrightness(
        color: LightColors.secondaryLight,
        darkColor: DarkColors.secondaryDark,
      );

  // Dynamic Muted
  static const CupertinoDynamicColor muted =
      CupertinoDynamicColor.withBrightness(
        color: LightColors.mutedLight,
        darkColor: DarkColors.mutedDark,
      );

  // Dynamic Muted Foreground
  static const CupertinoDynamicColor mutedForeground =
      CupertinoDynamicColor.withBrightness(
        color: LightColors.mutedForegroundLight,
        darkColor: DarkColors.mutedForegroundDark,
      );

  // Dynamic Destructive
  static const CupertinoDynamicColor destructive =
      CupertinoDynamicColor.withBrightness(
        color: LightColors.destructiveLight,
        darkColor: DarkColors.destructiveDark,
      );

  // Dynamic Border
  static const CupertinoDynamicColor border =
      CupertinoDynamicColor.withBrightness(
        color: LightColors.borderLight,
        darkColor: DarkColors.borderDark,
      );

  // Dynamic Ring
  static const CupertinoDynamicColor ring =
      CupertinoDynamicColor.withBrightness(
        color: LightColors.ringLight,
        darkColor: DarkColors.ringDark,
      );

  // Backward compatibility aliases (if needed)
  static const CupertinoDynamicColor text = foreground;
}
