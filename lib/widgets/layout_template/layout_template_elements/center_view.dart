import 'package:flutter/material.dart';

class CenterView extends StatelessWidget {
  const CenterView({
    super.key,
    required this.child,
    this.topPadding = 85,
    this.bottomPadding = 40,
    this.xPadding = 15,
  });

  final Widget child;
  final double topPadding;
  final double bottomPadding;
  final double xPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(xPadding, topPadding, xPadding, bottomPadding),
      child: Center(
        child: child,
      ),
    );
  }
}
