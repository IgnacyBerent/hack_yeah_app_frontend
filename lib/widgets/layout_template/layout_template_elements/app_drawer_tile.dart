import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:provider/provider.dart';

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile(
      {required this.icon,
      required this.title,
      required this.onTap,
      super.key});

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return ListTile(
      leading: Icon(icon,
          size: 35, color: themeNotifier.currentTheme['thirdaryTextColor']),
      title: Text(title, style: TextStyles.widgetTitleTextStyle(context)),
      onTap: onTap,
    );
  }
}
