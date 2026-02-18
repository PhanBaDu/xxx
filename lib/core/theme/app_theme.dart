import 'package:context/core/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static CupertinoThemeData lightTheme = const CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    barBackgroundColor: AppColors.background,
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        color: AppColors.foreground,
        fontSize: 17,
        fontFamily: '.SF Pro Text',
      ),
      actionTextStyle: TextStyle(
        color: AppColors.primary,
        fontSize: AppConstants.base,
      ),
    ),
  );

  static CupertinoThemeData darkTheme = const CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    barBackgroundColor: AppColors.background,
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        color: AppColors.foreground,
        fontSize: 17,
        fontFamily: '.SF Pro Text',
      ),
      actionTextStyle: TextStyle(
        color: AppColors.primary,
        fontSize: AppConstants.base,
      ),
    ),
  );
}
