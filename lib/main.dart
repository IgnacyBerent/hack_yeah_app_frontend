import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:hack_yeah_app_frontend/widgets/widget_tree.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          title: 'HackYeah App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: themeNotifier.currentTheme['mainColor']!,
            ),
            useMaterial3: true,
            scaffoldBackgroundColor:
                themeNotifier.currentTheme['mainBackgroundColor'],
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pl', ''), // Polish
          ],
          locale: const Locale('pl', ''), // Set the locale to Polish
          home: const WidgetTree(),
        );
      },
    );
  }
}
