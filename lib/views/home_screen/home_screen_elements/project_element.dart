import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hack_yeah_app_frontend/models/project.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/category_widget.dart';
import 'package:hack_yeah_app_frontend/views/project_screen/project_screen.dart';

class ProjectElement extends StatelessWidget {
  const ProjectElement({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProjectScreen(project: project),
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(160, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(
                project.photo,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: TextStyles.widgetTitleTextStyle(context).fontSize! * 5.5,
              child: Text(
                '${project.title} #${project.projectId}',
                style: TextStyles.widgetTitleTextStyle(context),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height:
                  TextStyles.secondaryDescriptionTextStyle(context).fontSize! *
                      5.5,
              child: Text(
                project.abstract,
                style: TextStyles.secondaryDescriptionTextStyle(context),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Transform.rotate(
                  angle: pi / 2,
                  child: const Icon(Icons.compare_arrows),
                ),
                Text(
                  project.votes.toString(),
                  style: TextStyles.numberTextStyle(context),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CategoryWidget(
                    text: project.category,
                    textStyle: TextStyles.numberTextStyle(context),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
