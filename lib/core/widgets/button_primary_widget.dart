import 'package:context/core/constants/app_constants.dart';
import 'package:context/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.title,
    this.onPressed,
    this.height = 56,
    this.color = AppColors.primary,
    this.textColor = CupertinoColors.white,
    this.borderRadius,
  });

  final String title;
  final VoidCallback? onPressed;
  final double height;
  final Color color;
  final Color textColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          color: color,
          disabledColor: color.withOpacity(0.5),
          borderRadius: borderRadius ?? BorderRadius.circular(height),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: AppConstants.base,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
