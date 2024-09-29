import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/providers/money_notifier.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:provider/provider.dart';

class PayPopup extends StatelessWidget {
  const PayPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final balance = Provider.of<MoneyNotifier>(context);

    final TextEditingController blikController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

    return AlertDialog(
      backgroundColor: themeNotifier.currentTheme['secondaryColor'],
      title: Text(
        'Doładuj konto',
        style: TextStyles.bigTitleTextStyle(context),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: blikController,
            decoration: const InputDecoration(labelText: 'Kod Blika'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(labelText: 'Kwota'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Anuluj'),
        ),
        ElevatedButton(
          onPressed: () {
            int amount = int.parse(amountController.text);
            balance.addMoney(amount);
            Navigator.of(context).pop();
          },
          child: const Text('Akceptuj'),
        ),
      ],
    );
  }
}
