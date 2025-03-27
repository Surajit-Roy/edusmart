import 'package:edusmart/data/models/user_model.dart';
import 'package:edusmart/data/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final userProvider = FutureProvider.family<UserModel?, String>((ref, userId) async {
  final repo = ref.read(userRepositoryProvider);
  return await repo.getUserById(userId);
});

final createUserProvider = FutureProvider.family<void, UserModel>((ref, user) async {
  final repo = ref.read(userRepositoryProvider);
  await repo.createUser(user);
});

final updateUserProvider = FutureProvider.family<void, UserModel>((ref, user) async {
  final repo = ref.read(userRepositoryProvider);
  await repo.updateUser(user);
});

final deleteUserProvider = FutureProvider.family<void, String>((ref, userId) async {
  final repo = ref.read(userRepositoryProvider);
  await repo.deleteUser(userId);
});
