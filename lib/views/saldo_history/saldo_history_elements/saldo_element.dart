import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:provider/provider.dart';

class SaldoElement extends StatelessWidget {
  const SaldoElement(this.value, this.date, this.desc, {super.key});

  final int value;
  final String date;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: themeNotifier.currentTheme['mainTextColor']!.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  value > 0 ? '+$value' : '$value',
                  style: TextStyles.secondaryDescriptionTextStyle(context),
                ),
                const Spacer(),
                Text(
                  date,
                  style: TextStyles.secondaryDescriptionTextStyle(context),
                ),
                const SizedBox(width: 20),
              ],
            ),
            Text(
              desc,
              style: TextStyles.descriptionTextStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}
