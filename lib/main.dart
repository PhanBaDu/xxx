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
      home: HomePage(
        isDarkMode: _isDarkMode,
        onToggleTheme: () {
          setState(() {
            _isDarkMode = !_isDarkMode;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (pageContext) => CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: CupertinoColors.systemBackground.resolveFrom(
              context,
            ),
            transitionBetweenRoutes: false,
            automaticBackgroundVisibility: false,
            border: null,
            middle: const Text('Home'),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: onToggleTheme,
              child: Icon(
                isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon_fill,
              ),
            ),
          ),
          child: Center(
            child: CupertinoButton.filled(
              onPressed: () {
                CupertinoScaffold.showCupertinoModalBottomSheet(
                  context: pageContext,
                  expand: true,
                  builder: (context) => Navigator(
                    onGenerateRoute: (settings) => CupertinoPageRoute(
                      builder: (context) => const ListWidgetScreen(),
                    ),
                  ),
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
