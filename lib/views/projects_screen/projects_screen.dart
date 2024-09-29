import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/api/database.dart';
import 'package:hack_yeah_app_frontend/models/project.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/project_element.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  DatabaseApi db = DatabaseApi();
  List<Project> projects = [];

  Future<void> getProjects() async {
    try {
      final value = await db.getProjects();
      setState(() {
        projects = value;
      });
    } catch (e) {
      log('Error getting projects: $e');
    }
  }

  @override
  void initState() {
    getProjects();
    super.initState();
  }

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
