import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/models/project.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/project_element.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/widget_card.dart';
import 'package:hack_yeah_app_frontend/views/projects_screen/projects_screen.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({required this.projects, super.key});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return WidgetCard(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Projekty',
              style: TextStyles.titleTextStyle(context),
            ),
          ),
          SizedBox(
            height: 500,
            child: PageView(
              children: [
                for (final project in projects)
                  ProjectElement(project: project),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 200,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProjectsScreen(),
                ));
              },
              child: Text(
                'Zobacz wszystkie',
                style: TextStyles.descriptionTextStyle(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
