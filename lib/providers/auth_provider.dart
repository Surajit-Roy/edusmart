import 'package:edusmart/data/models/user_model.dart';
import 'package:edusmart/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

// Listen to Firebase Auth State Changes
final authStateProvider = StreamProvider<User?>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return repo.authStateChanges();
});

// Login Provider
final loginProvider = FutureProvider.family<UserModel?, Map<String, String>>((ref, credentials) async {
  final repo = ref.read(authRepositoryProvider);
  return await repo.login(credentials['email']!, credentials['password']!); // Now correctly returns UserModel?
});

// Logout Provider
final logoutProvider = FutureProvider<void>((ref) async {
  final repo = ref.read(authRepositoryProvider);
  await repo.logout();
});

final registerUserProvider = FutureProvider.family<UserModel?, Map<String, String>>((ref, credentials) async {
  final repo = ref.read(authRepositoryProvider);

  final fullName = credentials['fullName'] ?? '';
  final email = credentials['email'] ?? '';
  final password = credentials['password'] ?? '';
  final role = credentials['role'] ?? 'student';

  if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
    throw Exception("Invalid registration details");
  }

  return await repo.register(fullName, email, password, role); // Now returning `UserModel?`
});

