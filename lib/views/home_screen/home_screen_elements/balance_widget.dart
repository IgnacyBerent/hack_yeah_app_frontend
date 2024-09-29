import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/providers/money_notifier.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/pay_popup.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/widget_card.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/withdraw_popup.dart';
import 'package:hack_yeah_app_frontend/views/saldo_history/saldo_history.dart';
import 'package:hack_yeah_app_frontend/widgets/buttons/my_icon_column_button.dart';
import 'package:provider/provider.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final balance = Provider.of<MoneyNotifier>(context);

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
          '${balance.money} PLN',
          style: TextStyles.bigTitleTextStyle(context),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: MyIconColumnButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const PayPopup();
                    },
                  );
                },
                buttonText: 'Doładuj',
                icon: const Icon(Icons.add),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MyIconColumnButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const WithdrawPopup();
                    },
                  );
                },
                buttonText: 'Wypłać',
                icon: const Icon(Icons.arrow_circle_down),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MyIconColumnButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SaldoHistory(),
                  ));
                },
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
