import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/widget_card.dart';
import 'package:hack_yeah_app_frontend/widgets/buttons/my_icon_column_button.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetCard(
        child: Column(
      children: [
        const Text(
          'Saldo',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          '1000 PLN',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: MyIconColumnButton(
                onPressed: () {},
                buttonText: 'Wypłać',
                icon: const Icon(Icons.add),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MyIconColumnButton(
                onPressed: () {},
                buttonText: 'Doładuj',
                icon: const Icon(Icons.arrow_circle_down),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MyIconColumnButton(
                onPressed: () {},
                buttonText: 'Tranzakcje',
                icon: const Icon(Icons.list),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
