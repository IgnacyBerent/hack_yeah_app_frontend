import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';

class TextStyles {
  static TextStyle appBarTextStyle(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return GoogleFonts.lato(
      fontSize: 22,
      fontWeight: FontWeight.w900,
      color: themeNotifier.currentTheme['mainTextColor'],
    );
  }

  static TextStyle buttonTextStyle(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return GoogleFonts.karla(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: themeNotifier.currentTheme['mainTextColor'],
    );
  }

  static TextStyle titleTextStyle(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return GoogleFonts.karla(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: themeNotifier.currentTheme['secondaryTextColor'],
    );
  }

  static TextStyle descriptionTextStyle(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return GoogleFonts.karla(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: themeNotifier.currentTheme['secondaryTextColor'],
    );
  }

  static TextStyle imageDescriptionTextStyle(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return GoogleFonts.karla(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: themeNotifier.currentTheme['secondaryTextColor'],
    );
  }
}
