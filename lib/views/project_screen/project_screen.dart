import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/models/project.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/category_widget.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template.dart';
import 'package:provider/provider.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return LayoutTemplate(
      screenName: '',
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                project.photo,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              '${project.title} #${project.projectId}',
              style: TextStyles.bigTitleTextStyle(context),
            ),
            const SizedBox(height: 10),
            Text(
              project.detailedDesc,
              style: TextStyles.descriptionTextStyle(context),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Transform.rotate(
                  angle: pi / 2, // Rotate by 90 degrees
                  child: Icon(
                    Icons.compare_arrows,
                    size: 40,
                    color: themeNotifier.currentTheme['mainTextColor'],
                  ),
                ),
                Text(
                  project.votes.toString(),
                  style: TextStyles.bigTitleTextStyle(context),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CategoryWidget(
                      text: project.category,
                      textStyle: TextStyles.descriptionTextStyle(context)),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Comments',
                style: TextStyles.titleTextStyle(context),
              ),
            ),
            const SizedBox(height: 10),
            Container(),
          ],
        ),
      ),
    );
  }
}
