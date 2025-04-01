import 'package:edusmart/config/app_strings.dart';
import 'package:edusmart/core/utils/images.dart';
import 'package:edusmart/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:edusmart/routes/app_routes.dart';
import 'package:edusmart/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class AccessStatusPage extends ConsumerWidget {
  const AccessStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(authViewModelProvider);

    return StreamBuilder<String>(
      stream: authViewModel.getUserStatus(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final status = snapshot.data ?? 'pending';

        String animation = pending;
        String message = AppStrings.getText(context, "pendingApproval");
        Color textColor = Colors.orange;
        bool showButton = false;

        if (status == 'approved') {
          animation = approve;
          message = AppStrings.getText(context, "congratsApproval");
          textColor = Colors.green;
          showButton = true;
        } else if (status == 'rejected') {
          animation = reject;
          message = AppStrings.getText(context, "failureApproval");
          textColor = Colors.red;
          showButton = false;
        }

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Lottie Animation
                  Lottie.asset(animation, height: 200),

                  const SizedBox(height: 20),

                  // Status Message
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Navigate to Login if Approved
                  if (showButton)
                    SizedBox(
                      width: double.infinity,
                      child: EduSmartButton(
                        txtColor: Colors.white,
                        bgColor: Colors.lightGreen,
                        text: AppStrings.getText(context, "login"),
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, AppRoutes.login);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
