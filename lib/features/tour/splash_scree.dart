import 'dart:async';

import 'package:edusmart/config/firebase_options.dart';
import 'package:edusmart/core/utils/images.dart';
import 'package:edusmart/providers/auth_provider.dart';
import 'package:edusmart/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../../routes/app_routes.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }
    } catch (e) {
      debugPrint("Firebase Initialization Error: $e");
    }

    final authRepo = ref.read(authRepositoryProvider);
    final user = authRepo.getCurrentUser();

    Future.delayed(const Duration(seconds: 3), () async{
    if (mounted) {
      if (user != null) {
        final userModel = await ref.read(userProvider(user.uid).future);
        if (userModel?.status == 'pending' || userModel?.status == 'rejected') {
          Navigator.pushReplacementNamed(context, AppRoutes.accessStatus);
        } else {
          // Navigate to Home Screen if user is approved
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
      } else {
        // Navigate to Registration Selection Screen
        Navigator.pushReplacementNamed(context, AppRoutes.navigationCard);
      }
    }
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Colors.black, Colors.red, Colors.blue, Colors.black],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                splash,
                width: 250, // Adjust size as needed
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text("EduSmart", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}