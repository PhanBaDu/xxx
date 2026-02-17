import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'core/theme/app_theme.dart';
import 'screens/widgets/list_widget_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Context App',
      theme: _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (pageContext) => CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            backgroundColor: CupertinoColors.white,
            transitionBetweenRoutes: false,
            automaticBackgroundVisibility: false,
            border: null,
            middle: Text('Home'),
          ),
          child: Center(
            child: CupertinoButton.filled(
              onPressed: () {
                CupertinoScaffold.showCupertinoModalBottomSheet(
                  context: pageContext,
                  expand: true,
                  builder: (context) => const ListWidgetScreen(),
                );
              },
              child: const Text('Open Bottom Sheet'),
            ),
          ),
        ),
      ),
    );
  }
}
