import 'package:edusmart/config/app_strings.dart';
import 'package:edusmart/core/utils/validators.dart';
import 'package:edusmart/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:edusmart/features/auth/widgets/forgot_password_dialog.dart';
import 'package:edusmart/providers/auth_provider.dart';
import 'package:edusmart/widgets/custom_button.dart';
import 'package:edusmart/widgets/custom_textfield.dart';
import 'package:edusmart/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    if (!_formKey.currentState!.validate()) return;
      try {
        setState(() => _isLoading = true);
        await ref
            .read(authViewModelProvider)
            .login(
              _emailController.text.trim(),
              _passwordController.text.trim(),
            );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppStrings.getText(context, "login_successful")),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
      } finally {
        setState(() => _isLoading = false);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EduSmartField(
              controller: _emailController,
              hintText: AppStrings.getText(context, "email"),
              prefixIcon: Icons.email,
              validator: Validators.validateEmail,
            ),
            const SizedBox(height: 16),
            EduSmartField(
              controller: _passwordController,
              hintText: AppStrings.getText(context, "password"),
              prefixIcon: Icons.lock,
              isPassword: true,
              validator: Validators.validatePassword,
            ),
            const SizedBox(height: 24),
            _isLoading ? EduSmartLoadingIndicator() :
            EduSmartButton(
              text: AppStrings.getText(context, "login"),
              onPressed: _login,
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                showForgotPasswordDialog(context);
              }, // Implement forgot password logic
              child: Text(AppStrings.getText(context, "forgot_pass")),
            ),
          ],
        ),
      ),
    );
  }
}
