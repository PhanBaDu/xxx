import 'package:flutter/cupertino.dart';
import 'app_colors.dart';

extension ThemeExtension on BuildContext {
  bool get isDarkMode {
    return CupertinoTheme.brightnessOf(this) == Brightness.dark;
  }

  Color get background {
    return isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight;
  }
}
