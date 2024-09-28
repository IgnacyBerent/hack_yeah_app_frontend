import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:provider/provider.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            themeNotifier.currentTheme['mainColor']!,
            themeNotifier.currentTheme['themeColor']!,
          ],
        ),
      ),
    );
  }
}
