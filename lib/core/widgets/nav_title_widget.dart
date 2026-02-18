import 'package:context/core/constants/app_constants.dart';
import 'package:context/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

class NavTitle extends StatelessWidget {
  const NavTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: AppConstants.base,
        color: AppColors.text,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
