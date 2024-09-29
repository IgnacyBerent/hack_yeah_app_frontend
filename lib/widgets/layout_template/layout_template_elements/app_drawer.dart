import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:hack_yeah_app_frontend/views/benefits_screen/benefits_screen.dart';
import 'package:hack_yeah_app_frontend/views/projects_screen/projects_screen.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template_elements/app_drawer_tile.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: themeNotifier.currentTheme['secondaryColor'],
            ),
            child: Text(
              'Menu',
              style: TextStyles.bigTitleTextStyle(context),
            ),
          ),
          AppDrawerTile(
            icon: Icons.home,
            title: 'Home',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          AppDrawerTile(
            icon: Icons.event_note_sharp,
            title: 'Projects',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProjectsScreen(),
              ));
            },
          ),
          AppDrawerTile(
            icon: Icons.wallet_giftcard,
            title: 'Benefits',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BenefitsScreen(),
              ));
            },
          ),
          AppDrawerTile(
            icon: Icons.wallet,
            title: 'Wallet',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
