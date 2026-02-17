import 'package:context/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonArrowLeft extends StatelessWidget {
  const ButtonArrowLeft({super.key, required this.context, this.onPressed});

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
      child: SvgPicture.asset(
        'assets/icons/arrow_left.svg',
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(AppColors.textLight, BlendMode.srcIn),
      ),
    );
  }
}
