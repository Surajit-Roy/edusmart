import 'package:edusmart/config/app_strings.dart';
import 'package:flutter/material.dart';

void showForgotPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(AppStrings.getText(context, "forgot_pass")),
        content: Text(AppStrings.getText(context, "forgot_desc")),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
