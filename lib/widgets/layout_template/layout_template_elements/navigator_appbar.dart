import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:hack_yeah_app_frontend/views/benefits_screen/benefits_screen.dart';
import 'package:hack_yeah_app_frontend/views/profile_screen/profile_screen.dart';
import 'package:provider/provider.dart';

class NavigatorAppbar extends StatelessWidget implements PreferredSizeWidget {
  const NavigatorAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    const iconsSize = 30.0;
    return AppBar(
      backgroundColor: themeNotifier.currentTheme['mainColor']!,
      iconTheme: IconThemeData(
        size: iconsSize,
        color: themeNotifier.currentTheme['mainTextColor']!,
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (String value) {
            themeNotifier.changeTheme(value);
          },
          icon: Icon(
            Icons.color_lens,
            color: themeNotifier.currentTheme['mainTextColor']!,
          ),
          iconSize: iconsSize,
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: 'Light',
                child: Text('Light'),
              ),
              const PopupMenuItem<String>(
                value: 'Dark',
                child: Text('Dark'),
              ),
              const PopupMenuItem<String>(
                value: 'Contrast',
                child: Text('Contrast'),
              ),
            ];
          },
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BenefitsScreen()));
          },
          icon: const Icon(Icons.shopping_cart),
          iconSize: iconsSize,
          color: themeNotifier.currentTheme['mainTextColor']!,
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
          icon: const Icon(Icons.person),
          iconSize: iconsSize,
          color: themeNotifier.currentTheme['mainTextColor']!,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
