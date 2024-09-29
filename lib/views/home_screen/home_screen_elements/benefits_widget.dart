import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/models/benefit.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/views/benefits_screen/benefits_screen.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/benefit_element.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/widget_card.dart';

class BenefitsWidget extends StatelessWidget {
  const BenefitsWidget({required this.benefits, super.key});

  final List<Benefit> benefits;

  @override
  Widget build(BuildContext context) {
    return WidgetCard(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Benefity',
              style: TextStyles.titleTextStyle(context),
            ),
          ),
          SizedBox(
            height: 500,
            child: PageView(
              children: [
                for (final benefit in benefits)
                  BenefitElement(benefit: benefit),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
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
                  builder: (context) => const BenefitsScreen(),
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
