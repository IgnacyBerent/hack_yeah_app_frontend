import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:provider/provider.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({required this.detail, required this.value, super.key});

  final String detail;
  final String value;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: themeNotifier.currentTheme['mainTextColor']!.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detail,
              style: TextStyles.secondaryDescriptionTextStyle(context),
            ),
            Text(
              value,
              style: TextStyles.descriptionTextStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}
