import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/api/auth.dart';
import 'package:hack_yeah_app_frontend/widgets/buttons/my_icon_button.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Authenticate();

    void logout() async {
      await auth.logout();
    }

    return LayoutTemplate(
      screenName: 'Profile',
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyIconButton(
              buttonText: "Log Out",
              onPressed: logout,
              icon: const Icon(Icons.logout),
              placement: 'right',
              width: 260,
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
