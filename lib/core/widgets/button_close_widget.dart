import 'package:context/core/constants/app_constants.dart';
import 'package:context/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

class ButtonClose extends StatelessWidget {
  const ButtonClose({
    super.key,
    required this.context,
    this.onPressed,
    this.fontSize = AppConstants.base,
    this.color = AppColors.destructive,
  });

  final BuildContext context;
  final VoidCallback? onPressed;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      onPressed:
          onPressed ??
          () {
            FocusScope.of(context).unfocus();
            Navigator.of(context).maybePop();
          },
      child: Text(
        'Close',
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
