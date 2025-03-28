import 'package:edusmart/config/firebase_options.dart';
import 'package:edusmart/providers/auth_provider.dart';
import 'package:edusmart/widgets/loading_indicator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    // Navigate after a delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        if (user != null) {
          // Navigate to Login Screen if user is registered
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        } else {
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
              Image.asset('assets/images/school_logo.png', height: 120),
              const SizedBox(height: 20),
              const EduSmartLoadingIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}