import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/mocks/project_mock.dart';
import 'package:hack_yeah_app_frontend/models/project.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/balance_widget.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/projects_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  List<Project> projects = [projectMock, projectMock];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BalanceWidget(),
          ProjectsWidget(projects: projects),
        ],
      ),
    );
  }
}
