import 'package:context/core/widgets/button_arrow_left_widget.dart';
import 'package:context/core/widgets/button_close_widget.dart';
import 'package:context/core/widgets/button_info_widget.dart';
import 'package:context/core/widgets/nav_title_widget.dart';
import 'package:flutter/cupertino.dart';
import '../../core/widgets/global_page.dart';

class ListWidgetScreen extends StatelessWidget {
  const ListWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalPage(
      title: const NavTitle(title: 'Features Page'),
      leading: ButtonClose(context: context),
      trailing: ButtonInfo(context: context),
      child: Text('AA'),
    );
  }
}
