import 'package:hack_yeah_app_frontend/api/auth.dart';
import 'package:hack_yeah_app_frontend/styles/theme_notifier.dart';
import 'package:hack_yeah_app_frontend/widgets/forms/text_form_container.dart';
import 'package:hack_yeah_app_frontend/widgets/forms/form_elements/form_validators.dart';
import 'package:hack_yeah_app_frontend/widgets/forms/form_elements/form_view_container.dart';
import 'package:hack_yeah_app_frontend/widgets/forms/form_elements/text_row.dart';
import 'package:hack_yeah_app_frontend/widgets/buttons/my_icon_button.dart';
import 'package:hack_yeah_app_frontend/widgets/layout_template/form_layout_template.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fromSeparator = const SizedBox(height: 16);
  final kTextColor = const Color.fromARGB(255, 204, 231, 248);

  final auth = Authenticate();
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  final _passwordController = TextEditingController();
  var _enteredFName = '';
  var _enteredLName = '';
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredPesel = '';
  var _enteredGmina = '';
  String? errorMessage = '';

  bool _obscureText = true;

  void _signUp() async {
    FocusScope.of(context).unfocus(); // close keyboard

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });

      try {
        await auth.register(
          firstName: _enteredFName,
          lastName: _enteredLName,
          email: _enteredEmail,
          password: _enteredPassword,
          pesel: _enteredPesel,
          gmina: _enteredGmina,
        );
        if (!context.mounted) {
          return;
        }
      } on Exception catch (e) {
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
            title: const Text('Registration Failed'),
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
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return FormLayoutTemplate(
      child: FormViewContainer(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'REJESTRACJA',
                  style: GoogleFonts.lato(
                    color: themeNotifier.currentTheme['secondaryColor'],
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                fromSeparator,
                fromSeparator,
                fromSeparator,
                TextFormContainer(
                  text: 'IMIE',
                  icon: Icons.person,
                  validator: (value) => isEmptyValidator(value),
                  onSaved: (value) => _enteredFName = value!,
                ),
                fromSeparator,
                TextFormContainer(
                  text: 'NAZWISKO',
                  icon: Icons.person,
                  validator: (value) => isEmptyValidator(value),
                  onSaved: (value) => _enteredLName = value!,
                ),
                fromSeparator,
                TextFormContainer(
                  text: 'PESEL',
                  icon: Icons.person,
                  keyboardType: TextInputType.number,
                  validator: (value) => isPeselValidator(value),
                  onSaved: (value) => _enteredPesel = value!,
                ),
                fromSeparator,
                TextFormContainer(
                  text: 'GMINA',
                  icon: Icons.location_city,
                  validator: (value) => isEmptyValidator(value),
                  onSaved: (value) => _enteredGmina = value!,
                ),
                fromSeparator,
                TextFormContainer(
                  text: 'EMAIL',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => isEmailValidator(value),
                  onSaved: (value) => _enteredEmail = value!,
                ),
                fromSeparator,
                TextFormContainer(
                  controller: _passwordController,
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
                  validator: (value) => isValidPasswordValidator(value),
                  onSaved: (value) => _enteredPassword = value!,
                ),
                fromSeparator,
                TextFormContainer(
                  text: 'POTWIERDŹ HASŁO',
                  icon: Icons.lock,
                  obscureText: _obscureText,
                  validator: (value) => doesMatchValidator(
                    value,
                    _passwordController.text,
                  ),
                ),
                fromSeparator,
                fromSeparator,
                fromSeparator,
                MyIconButton(
                  buttonText: 'ZAREJESTRUJ',
                  icon: Icon(
                    Icons.arrow_forward,
                    color: themeNotifier.currentTheme['thirdaryTextColor'],
                  ),
                  placement: 'right',
                  onPressed: _signUp,
                  isLoading: _isLoading,
                  width: 260,
                ),
                const SizedBox(height: 10),
                TextRow(
                  text: 'Masz już konto?',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  clicText: 'Zaloguj się',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
