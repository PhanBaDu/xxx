import 'package:flutter/cupertino.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static CupertinoThemeData lightTheme = const CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        color: AppColors.textLight,
        fontSize: 17,
      ),
    ),
  );

  static CupertinoThemeData darkTheme = const CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 17,
      ),
    ),
  );
}
