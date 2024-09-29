import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template_elements/background_container.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template_elements/center_view.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template_elements/layout_app_bar.dart';
import 'package:flutter/material.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({
    super.key,
    required this.screenName,
    required this.child,
  });

  final String screenName;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: LayoutAppBar(
        title: screenName,
      ),
      body: Stack(
        children: [
          const BackgroundContainer(),
          CenterView(
            topPadding: 100,
            bottomPadding: 20,
            child: child,
          ),
        ],
      ),
    );
  }
}
