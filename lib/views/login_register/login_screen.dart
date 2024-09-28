import 'package:hack_yeah_app_frontend/api/auth.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:hack_yeah_app_frontend/widgets/forms/text_form_container.dart';
import 'package:hack_yeah_app_frontend/widgets/forms/form_elements/form_validators.dart';
import 'package:hack_yeah_app_frontend/widgets/forms/form_elements/form_view_container.dart';
import 'package:hack_yeah_app_frontend/widgets/forms/form_elements/text_row.dart';
import 'package:hack_yeah_app_frontend/views/login_register/register_screen.dart';
import 'package:hack_yeah_app_frontend/widgets/buttons/my_icon_button.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/form_layout_template.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final kTextColor = const Color.fromARGB(255, 204, 231, 248);

  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _isLoading = false;
  String? errorMessage = '';
  bool _obscureText = true;
  final auth = Authenticate();

  Future<void> _signIn() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await auth.login(_enteredEmail, _enteredPassword);
      } catch (e) {
        setState(() {
          _isLoading = false;
          errorMessage = e.toString();
        });

        if (!context.mounted) {
          return;
        }
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Login Failed'),
            content: Text(errorMessage!),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return FormLayoutTemplate(
      child: FormViewContainer(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'ZALOGUJ SIĘ',
                style: GoogleFonts.lato(
                  color: themeNotifier.currentTheme['secondaryColor'],
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 120),
              TextFormContainer(
                text: 'EMAIL',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => isEmptyValidator(value),
                onSaved: (value) => _enteredEmail = value!,
              ),
              const SizedBox(height: 12),
              TextFormContainer(
                text: 'HASŁO',
                icon: Icons.lock,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: kTextColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                obscureText: _obscureText,
                validator: (value) => isEmptyValidator(value),
                onSaved: (value) => _enteredPassword = value!,
              ),
              const Spacer(),
              MyIconButton(
                buttonText: 'LOGIN',
                icon: Icon(
                  Icons.arrow_forward,
                  color: themeNotifier.currentTheme['thirdaryTextColor'],
                ),
                placement: 'right',
                onPressed: _signIn,
                isLoading: _isLoading,
                width: 180,
              ),
              const SizedBox(
                height: 20,
              ),
              TextRow(
                text: "Nie masz konta?",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const RegisterScreen(),
                    ),
                  );
                },
                clicText: 'Zarejestruj się',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
