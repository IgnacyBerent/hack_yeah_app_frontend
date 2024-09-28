import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/views/profile_screen/profile_screen.dart';

class NavigatorAppbar extends StatelessWidget implements PreferredSizeWidget {
  const NavigatorAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    const iconsSize = 30.0;
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 224, 242, 253),
      iconTheme: const IconThemeData(
        size: iconsSize,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
          icon: const Icon(Icons.person),
          iconSize: iconsSize,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
