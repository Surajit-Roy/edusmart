import 'dart:io';

import 'package:edusmart/config/app_strings.dart';
import 'package:edusmart/features/auth/widgets/login_form.dart';
import 'package:edusmart/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(body: LoginForm());
  // }

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false,
    onPopInvokedWithResult: (didPop, result) {
      if (didPop) return;
      EduSmartDialog(
        context: context,
        dialogType: DialogType.warning,
        title: AppStrings.getText(context, "exit"),
        message: AppStrings.getText(context, "exit_msg"),
        onConfirm: () => exit(0),
        onCancel: () {},
      );
    },
    child: Scaffold(body: LoginForm()),
  );
}
