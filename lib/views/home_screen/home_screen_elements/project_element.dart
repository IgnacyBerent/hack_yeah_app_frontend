import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hack_yeah_app_frontend/models/project.dart';
import 'package:hack_yeah_app_frontend/styles/text_styles.dart';
import 'package:hack_yeah_app_frontend/views/home_screen/home_screen_elements/category_widget.dart';

class ProjectElement extends StatelessWidget {
  const ProjectElement({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        border: Border.fromBorderSide(
            BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.network(
              project.photo,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${project.title} #${project.id}',
            style: TextStyles.titleTextStyle(context),
          ),
          const SizedBox(height: 5),
          Text(
            project.abstract,
            style: TextStyles.descriptionTextStyle(context),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Transform.rotate(
                angle: pi / 2, // Rotate by 90 degrees
                child: const Icon(Icons.compare_arrows),
              ),
              Text(
                project.votes.toString(),
                style: TextStyles.descriptionTextStyle(context),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CategoryWidget(text: project.category),
              ),
            ],
          )
        ],
      ),
    );
  }
}
