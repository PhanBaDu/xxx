import 'package:context/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonInfo extends StatelessWidget {
  const ButtonInfo({super.key, required this.context, this.onPressed});

  final BuildContext context;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      onPressed: onPressed,
      child: SvgPicture.asset(
        'assets/icons/info.svg',
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(AppColors.info, BlendMode.srcIn),
      ),
    );
  }
}
