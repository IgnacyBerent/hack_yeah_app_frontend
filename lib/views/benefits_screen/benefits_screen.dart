import 'dart:developer';

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
    getBenefits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: "Benefity",
      child: ListView.builder(
        itemCount: benefits.length,
        itemBuilder: (context, index) {
          return BenefitElement(benefit: benefits[index]);
        },
      ),
    );
  }
}
