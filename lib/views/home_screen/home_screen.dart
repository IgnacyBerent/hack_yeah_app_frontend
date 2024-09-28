import 'package:hack_yeah_app_frontend/api/auth.dart';
import 'package:hack_yeah_app_frontend/widgets/buttons/my_icon_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.selectPage,
  });

  final Function(int) selectPage;
  final butotnsSpacing = const SizedBox(height: 25);

  @override
  Widget build(BuildContext context) {
    final auth = Authenticate();

    void logout() async {
      await auth.logout();
    }

    return SizedBox(
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
    );
  }
}
