import 'package:flutter/material.dart';
import 'package:my_app/app/modules/auth/data/repository/auth_repository.dart';
import 'package:my_app/app_routes.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateForm = AutovalidateMode.disabled;
  bool isChecked = false;

  AuthRepository _authRepo = AuthRepository();

  Map<String, dynamic> data = {};

  double slideValue = 0;

  @override
  void initState() {
    super.initState();
  }

  navigateToHome(context) {
    Navigator.pushNamedAndRemoveUntil(context, kHomeRoute, (route) => false);
  }

  testFormFields() {
    print(_emailController.text);
    print(_passwordController.text);
  }

  changeSliderValue(value) {
    print(value);
    setState(() {
      slideValue = value;
    });
  }

  onLoginPressed() async {
    if (_formKey.currentState!.validate()) {
      print('login succedded');
      setState(() {
        data['email'] = _emailController.text;
        data['password'] = _passwordController.text;
      });

      // méthode http pour le login / firebase
      // on récupére notre résulat de login :
      //$ la connexion de l'utilisateur dans la clé is_connected

      await _authRepo.saveLogin();
      navigateToHome(context);
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
      _formKey.currentState!.validate();
      setState(() {
        _autovalidateForm = AutovalidateMode.always;
      });
    }
  }

  String? validateEmail(String value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'email non valide';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    autovalidateMode: _autovalidateForm,
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.datetime,
                            controller: _emailController,
                            validator: (value) {
                              String pattern =
                                  r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                              RegExp regex = RegExp(pattern);

                              if (!regex.hasMatch(value!)) {
                                //message à afficher en cas d'erreur
                                return 'email non valid';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: 'E-mail',
                                helperText: 'mettez votre e-mail',
                                hintText: 'email@exemple.com'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Mot de passe',
                              helperText: 'mettez votre mot de passe',
                            ),
                            validator: (value) {
                              print(value);
                              if (value!.length < 2) {
                                return 'Mot de passe trés court';
                              } else {
                                return null;
                              }
                            },
                            obscureText: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                              onPressed: onLoginPressed,
                              child: Text('Se connecter')),
                        ),
                        data['email'] != null
                            ? Text(
                                "email : ${data['email']}, mot de passe : ${data['password']}")
                            : Container()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
