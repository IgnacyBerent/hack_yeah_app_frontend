import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/api/database.dart';
import 'package:hack_yeah_app_frontend/mocks/project_mock.dart';
import 'package:hack_yeah_app_frontend/models/benefit.dart';
import 'package:hack_yeah_app_frontend/models/project.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/balance_widget.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/benefits_widget.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/projects_widget.dart';
import 'dart:developer';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseApi db = DatabaseApi();
  List<Project> projects = [projectMock, projectMock];

  List<Benefit> benefits = [];

  Future<void> getBenefits() async {
    log('Getting benefits (home screen)');
    try {
      final value = await db.getBenefits();
      setState(() {
        benefits = value;
      });
    } catch (e) {
      log('Error getting benefits: $e');
    }
  }

  @override
  void initState() {
    log('initState');
    getBenefits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BalanceWidget(),
          ProjectsWidget(projects: projects),
          BenefitsWidget(benefits: benefits),
        ],
      ),
    );
  }
}
