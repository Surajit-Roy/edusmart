import 'package:edusmart/config/app_strings.dart';
import 'package:edusmart/core/utils/validators.dart';
import 'package:edusmart/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:edusmart/routes/app_routes.dart';
import 'package:edusmart/widgets/custom_button.dart';
import 'package:edusmart/widgets/custom_textfield.dart';
import 'package:edusmart/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    final fullName = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String userRole = arguments?['role'] ?? 'student';

    try {
      setState(() => _isLoading = true);

      await ref
          .read(authViewModelProvider)
          .register(fullName, email, password, userRole);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppStrings.getText(context, "register_success")),
          ),
        );

        // Navigate to Login Screen
        Navigator.pushReplacementNamed(context, AppRoutes.login);
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
              controller: _nameController,
              hintText: AppStrings.getText(context, "full_name"),
              prefixIcon: Icons.person,
              validator: Validators.validateName,
            ),
            const SizedBox(height: 16),
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
            _isLoading
                ? EduSmartLoadingIndicator()
                : EduSmartButton(
                  text: AppStrings.getText(context, "register"),
                  onPressed: _register,
                ),
          ],
        ),
      ),
    );
  }
}
