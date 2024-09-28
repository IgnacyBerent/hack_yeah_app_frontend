import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/widgets/forms/form_elements/form_decoration.dart';
import 'package:google_fonts/google_fonts.dart';

class FormContainer extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String text;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final Widget Function(BuildContext, TextEditingController, FocusNode?)?
      customFieldBuilder;

  const FormContainer({
    super.key,
    required this.text,
    required this.icon,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.controller,
    this.customFieldBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController effectiveController =
        controller ?? TextEditingController();
    final FocusNode? focusNode =
        customFieldBuilder != null ? FocusNode() : null;

    return Column(
      children: [
        FormDecoration(
          iconData: icon,
          text: text,
        ),
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Stack(
            children: [
              customFieldBuilder != null
                  ? customFieldBuilder!(context, effectiveController, focusNode)
                  : TextFormField(
                      controller: effectiveController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(15, 10, 5, 10),
                        border: InputBorder.none,
                        suffixIcon: suffixIcon,
                      ),
                      keyboardType: keyboardType ?? TextInputType.text,
                      validator: validator,
                      onSaved: onSaved,
                      obscureText: obscureText,
                      style: obscureText
                          ? const TextStyle(
                              color: Color(0xFF2F4858),
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            )
                          : GoogleFonts.karla(
                              color: const Color(0xFF2F4858),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                    ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 3.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 204, 231, 248),
                        Color.fromARGB(255, 14, 0, 203),
                        Color.fromARGB(255, 204, 231, 248),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
