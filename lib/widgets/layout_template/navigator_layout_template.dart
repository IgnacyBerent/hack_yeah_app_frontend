import 'package:hack_yeah_app_frontend/views/home_screen/home_screen.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template_elements/app_drawer.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template_elements/background_container.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template_elements/blur_cover.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template_elements/center_view.dart';
import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/layout_template_elements/navigator_appbar.dart';

class NavigatorLayoutTemplate extends StatefulWidget {
  const NavigatorLayoutTemplate({
    super.key,
  });

  @override
  State<NavigatorLayoutTemplate> createState() =>
      _NavigatorLayoutTemplateState();
}

class _NavigatorLayoutTemplateState extends State<NavigatorLayoutTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F4858),
      extendBodyBehindAppBar: true,
      appBar: NavigatorAppbar(),
      drawer: AppDrawer(),
      body: Stack(
        children: [
          BackgroundContainer(),
          BlurCover(),
          CenterView(
            child: HomeScreen(),
          ),
        ],
      ),
    );
  }
}
