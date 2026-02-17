import 'package:context/core/constants/app_constants.dart';
import 'package:context/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

class ButtonClose extends StatelessWidget {
  const ButtonClose({super.key, required this.context, this.onPressed});

  final BuildContext context;
  final VoidCallback? onPressed;

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
      child: const Text(
        'Close',
        style: TextStyle(
          fontSize: AppConstants.base,
          color: AppColors.destructive,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
