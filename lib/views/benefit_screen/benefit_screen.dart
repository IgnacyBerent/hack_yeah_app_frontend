import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/models/benefit.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/category_widget.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template.dart';

class BenefitScreen extends StatelessWidget {
  const BenefitScreen({required this.benefit, super.key});

  final Benefit benefit;

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: '',
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                benefit.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              '${benefit.name} \$${benefit.price}',
              style: TextStyles.bigTitleTextStyle(context),
            ),
            const SizedBox(height: 10),
            Text(
              benefit.description,
              style: TextStyles.descriptionTextStyle(context),
            ),
            const SizedBox(height: 20),
            CategoryWidget(
                text: benefit.category,
                textStyle: TextStyles.descriptionTextStyle(context)),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
