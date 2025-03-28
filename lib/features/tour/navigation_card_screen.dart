import 'package:flutter/material.dart';
import '../../../routes/app_routes.dart';

class NavigationCardScreen extends StatelessWidget {
  const NavigationCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Your Role', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),), centerTitle: true, backgroundColor: Colors.lightBlueAccent,),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.white, Colors.lightBlueAccent],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRoleCard(
                context,
                title: 'Admin',
                role: 'admin',
              ),
              const SizedBox(height: 20),
              _buildRoleCard(
                context,
                title: 'Teacher',
                role: 'teacher',
              ),
              const SizedBox(height: 20),
              _buildRoleCard(
                context,
                title: 'Student',
                role: 'student',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(
  BuildContext context, {
  required String title,
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
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.blueAccent.shade200, Colors.blueAccent.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.3),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_outline_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          // Title Text
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Forward Arrow
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 20,
          ),
        ],
      ),
    ),
  );
}
}
