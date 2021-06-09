import 'package:flutter/material.dart';
import 'package:my_app/app/screens/login/wigets/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: LoginForm(),
      ),
    );
  }
}
