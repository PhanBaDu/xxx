import 'package:context/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonInfo extends StatelessWidget {
  const ButtonInfo({
    super.key,
    required this.context,
    this.onPressed,
    this.width = 24,
    this.height = 24,
    this.color = AppColors.info,
  });

  final BuildContext context;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      onPressed: onPressed,
      child: SvgPicture.asset(
        'assets/icons/info.svg',
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
