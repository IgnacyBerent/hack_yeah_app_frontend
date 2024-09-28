import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/balance_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const BalanceWidget(),
        ],
      ),
    );
  }
}
