import 'package:flutter/material.dart';
import '../../../routes/app_routes.dart';

class NavigationCardScreen extends StatelessWidget {
  const NavigationCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Your Role'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRoleCard(
              context,
              title: 'Admin',
              imagePath: 'assets/images/admin_icon.png',
              role: 'admin',
            ),
            const SizedBox(height: 20),
            _buildRoleCard(
              context,
              title: 'Teacher',
              imagePath: 'assets/images/teacher_icon.png',
              role: 'teacher',
            ),
            const SizedBox(height: 20),
            _buildRoleCard(
              context,
              title: 'Student',
              imagePath: 'assets/images/student_icon.png',
              role: 'student',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required String title,
    required String imagePath,
    required String role,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.register,
          arguments: {'role': role},
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Image.asset(imagePath, height: 50, width: 50),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
