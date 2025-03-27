import 'package:edusmart/config/app_strings.dart';
import 'package:edusmart/features/auth/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.getText(context, "register")),),  
      body: RegisterForm()
    );
  }
}
