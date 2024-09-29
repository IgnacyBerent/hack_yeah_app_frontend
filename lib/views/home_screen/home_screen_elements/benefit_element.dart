import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/models/benefit.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/views/benefit_screen/benefit_screen.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/category_widget.dart';

class BenefitElement extends StatelessWidget {
  const BenefitElement({required this.benefit, super.key});

  final Benefit benefit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BenefitScreen(benefit: benefit),
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border.fromBorderSide(
              BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(
                benefit.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${benefit.name} #${benefit.price}',
              style: TextStyles.widgetTitleTextStyle(context),
            ),
            const SizedBox(height: 5),
            Text(
              benefit.description,
              style: TextStyles.secondaryDescriptionTextStyle(context),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            CategoryWidget(
              text: benefit.category,
              textStyle: TextStyles.numberTextStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}
