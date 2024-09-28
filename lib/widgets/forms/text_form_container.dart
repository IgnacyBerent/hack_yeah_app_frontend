import 'package:hack_yeah_app_frontend/widgets/forms/form_elements/form_container.dart';
import 'package:flutter/material.dart';

class TextFormContainer extends StatelessWidget {
  const TextFormContainer({
    super.key,
    required this.text,
    required this.icon,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.controller,
  });

  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String text;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final IconButton? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      text: text,
      icon: icon,
      onSaved: onSaved,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      suffixIcon: suffixIcon,
      controller: controller,
    );
  }
}
