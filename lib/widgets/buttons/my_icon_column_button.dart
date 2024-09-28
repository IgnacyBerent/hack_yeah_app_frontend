import 'package:flutter/material.dart';

import 'package:hack_yeah_app_frontend/styles/text_styles.dart';

class MyIconColumnButton extends StatelessWidget {
  final String buttonText;
  final Icon icon;
  final VoidCallback onPressed;

  const MyIconColumnButton({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: icon,
              iconSize: 40,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          buttonText,
          style: TextStyles.descriptionTextStyle(context),
        ),
      ],
    );
  }
}
