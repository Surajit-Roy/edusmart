import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edusmart/config/app_strings.dart';
import 'package:edusmart/core/utils/validators.dart';
import 'package:edusmart/data/models/user_model.dart';
import 'package:edusmart/providers/auth_provider.dart';
import 'package:edusmart/providers/user_provider.dart';
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

    final authRepo = ref.read(authRepositoryProvider);
    final userRepo = ref.read(userRepositoryProvider);

    final fullName = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String userRole = arguments?['role'] ?? 'student';

    setState(() => _isLoading = true);

    try {
      // Register user in Firebase Auth
      final user = await authRepo.register(fullName, email, password, userRole);
      
      if (user != null) {
        // Step 2: Check if user document already exists in Firestore
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.id) // Directly check the document instead of querying
            .get();

        if (userDoc.exists) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppStrings.getText(context, "emailAlreadyRegister")),
            ),
          );
          setState(() => _isLoading = false);
          return;
        }

        // Step 3: Store user details in Firestore
        final newUser = UserModel(
          id: user.id,
          name: fullName,
          email: email,
          role: userRole,
        );
        await userRepo.createUser(newUser);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppStrings.getText(context, "register_success")),
          ),
        );

        // Step 4: Navigate to Login Screen
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // void _register() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       // Implement your registration logic here
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(AppStrings.getText(context, "register_success")),
  //         ),
  //       );
  //     } catch (e) {
  //       ScaffoldMessenger.of(
  //         context,
  //       ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
  //     }
  //   }
  // }

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
