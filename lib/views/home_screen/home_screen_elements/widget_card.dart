import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:provider/provider.dart';

class WidgetCard extends StatelessWidget {
  const WidgetCard({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return SizedBox(
      width: double.infinity,
      child: Card(
        color: themeNotifier.currentTheme['secondaryColor'],
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: child,
        ),
      ),
    );
  }
}
