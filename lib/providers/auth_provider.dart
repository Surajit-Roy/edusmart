import 'package:edusmart/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authStateProvider = StreamProvider<User?>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return repo.authStateChanges();
});

final loginProvider = FutureProvider.family<User?, Map<String, String>>((ref, credentials) async {
  final repo = ref.read(authRepositoryProvider);
  return await repo.login(credentials['email']!, credentials['password']!);
});

final logoutProvider = FutureProvider<void>((ref) async {
  final repo = ref.read(authRepositoryProvider);
  await repo.logout();
});

final registerUserProvider = FutureProvider.family<User?, Map<String, String>>((ref, credentials) async {
  final repo = ref.read(authRepositoryProvider);
  return await repo.register(credentials['email']!, credentials['password']!);
});
