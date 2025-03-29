import 'package:edusmart/config/app_strings.dart';
import 'package:edusmart/core/utils/images.dart';
import 'package:edusmart/core/utils/validators.dart';
import 'package:edusmart/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:edusmart/routes/app_routes.dart';
import 'package:edusmart/widgets/custom_button.dart';
import 'package:edusmart/widgets/custom_dialog.dart';
import 'package:edusmart/widgets/custom_textfield.dart';
import 'package:edusmart/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

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

  //login
  void _login() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      setState(() => _isLoading = true);
      await ref
          .read(authViewModelProvider)
          .login(_emailController.text.trim(), _passwordController.text.trim());
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

  //logout
  void _logout() async {
    try {
      await ref.read(authViewModelProvider).logout();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.getText(context, "logout_successful")),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFF003366),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(150),
                  ),
                  image: DecorationImage(
                    image: AssetImage(blockchain),
                    fit: BoxFit.cover,
                    opacity: 0.5,
                  ),
                ),
              ),
              // Lottie Animation for Modern Look
              Center(child: SizedBox(height: 350, child: Lottie.asset(login))),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:  16.0, right: 16.0, top: MediaQuery.of(context).size.height * 0.42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.getText(context, "welcomeback"),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
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

                      _isLoading
                          ? EduSmartLoadingIndicator()
                          : SizedBox(
                            width: double.infinity,
                            child: EduSmartButton(
                              bgColor: Colors.lightBlue,
                              txtColor: Colors.white,
                              text: AppStrings.getText(context, "login"),
                              onPressed: _login,
                            ),
                          ),
                      const SizedBox(height: 12),

                      EduSmartTextButton(
                        text: AppStrings.getText(context, "forgot_pass"),
                        color: Colors.lightBlue,
                        onPressed: () {
                          EduSmartDialog(
                            context: context,
                            title: AppStrings.getText(context, "forgot_pass"),
                            message: AppStrings.getText(context, "forgot_desc"),
                            dialogType: DialogType.warning,
                            onConfirm: () {},
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.getText(context, "noAccount")),
                          const SizedBox(width: 2),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.register,
                              );
                            },
                            child: Text(
                              AppStrings.getText(context, "register"),
                              style: TextStyle(color: Colors.lightBlue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
