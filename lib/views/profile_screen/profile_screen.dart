import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:hack_yeah_app_frontend/api/auth.dart';
import 'package:hack_yeah_app_frontend/models/user.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:hack_yeah_app_frontend/views/profile_screen/profile_screen_elements/profile_detail.dart';
import 'package:hack_yeah_app_frontend/widgets/buttons/my_icon_button.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = Authenticate();
  User? user;

  void logout() async {
    await auth.logout();
  }

  Future<void> getUser() async {
    log('Getting user in profile screen');
    auth.getMe().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    if (user == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return LayoutTemplate(
      screenName: '',
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Profil',
                  style: TextStyles.bigTitleTextStyle(context),
                ),
                const Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: themeNotifier.currentTheme['secondaryColor'],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      '${user?.initials}',
                      textAlign: TextAlign.center,
                      style: TextStyles.titleTextStyle(
                        context,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Dane użytkownika:',
                style: TextStyles.titleTextStyle(context),
              ),
            ),
            const SizedBox(height: 20),
            ProfileDetail(detail: 'Imię', value: user!.fullName),
            const SizedBox(height: 20),
            ProfileDetail(detail: 'Email', value: user!.email),
            const SizedBox(height: 20),
            ProfileDetail(detail: 'Gmina', value: user!.district),
            const Spacer(),
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
