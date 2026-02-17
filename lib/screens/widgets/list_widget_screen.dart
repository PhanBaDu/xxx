import 'package:context/core/widgets/button_close_widget.dart';
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
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Text('Close'),
        onPressed: () {
          // Action khi nhấn
          print('Trailing button pressed');
        },
      ),
      child: Text('AA'),
    );
  }
}
