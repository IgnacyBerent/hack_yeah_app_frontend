import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:provider/provider.dart';

class TextRow extends StatelessWidget {
  const TextRow({
    super.key,
    required this.onPressed,
    required this.text,
    required this.clicText,
  });

  final void Function() onPressed;
  final String text;
  final String clicText;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFonts.karla(
            color: const Color.fromARGB(255, 204, 231, 248),
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: themeNotifier.currentTheme['secondaryColor']!,
                  width: 1.5,
                ),
              ),
            ),
            child: Text(
              clicText,
              style: GoogleFonts.karla(
                color: themeNotifier.currentTheme['secondaryColor'],
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
