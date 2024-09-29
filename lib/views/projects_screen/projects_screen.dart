import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/models/project.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/project_element.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({required this.projects, super.key});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: "Projekty",
      child: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectElement(project: projects[index]);
        },
      ),
    );
  }
}
