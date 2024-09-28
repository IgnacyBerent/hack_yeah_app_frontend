import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';

class LayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LayoutAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: TextStyles.appBarTextStyle(context),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
