import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/providers/money_notifier.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/views/saldo_history/saldo_history_elements/saldo_element.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template.dart';
import 'package:provider/provider.dart';

class SaldoHistory extends StatelessWidget {
  const SaldoHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final balance = Provider.of<MoneyNotifier>(context);

    return LayoutTemplate(
      screenName: "",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Historia salda:",
              style: TextStyles.bigTitleTextStyle(context),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: balance.saldoRecords.length,
              itemBuilder: (context, index) {
                return SaldoElement(
                  balance.saldoRecords[index].ammount,
                  balance.saldoRecords[index].date,
                  balance.saldoRecords[index].description,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
