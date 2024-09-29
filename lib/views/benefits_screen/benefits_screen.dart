import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/api/database.dart';
import 'package:hack_yeah_app_frontend/models/benefit.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/benefit_element.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template.dart';

class BenefitsScreen extends StatefulWidget {
  const BenefitsScreen({super.key});

  @override
  State<BenefitsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<BenefitsScreen> {
  DatabaseApi db = DatabaseApi();
  late List<Benefit> benefits = [];

  Future<void> getProjects() async {
    benefits = await db.getBenefits();
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
        itemCount: benefits.length,
        itemBuilder: (context, index) {
          return BenefitElement(benefit: benefits[index]);
        },
      ),
    );
  }
}
