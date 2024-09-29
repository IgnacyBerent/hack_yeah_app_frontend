import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/widget_card.dart';
import 'package:hack_yeah_app_frontend/widgets/buttons/my_icon_column_button.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({required this.balance, super.key});

  final int balance;

  @override
  Widget build(BuildContext context) {
    return WidgetCard(
        child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Saldo',
            style: TextStyles.titleTextStyle(context),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '$balance PLN',
          style: TextStyles.bigTitleTextStyle(context),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: MyIconColumnButton(
                onPressed: () {},
                buttonText: 'Doładuj',
                icon: const Icon(Icons.add),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MyIconColumnButton(
                onPressed: () {},
                buttonText: 'Wypłać',
                icon: const Icon(Icons.arrow_circle_down),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MyIconColumnButton(
                onPressed: () {},
                buttonText: 'Historia',
                icon: const Icon(Icons.list),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
