import 'package:edusmart/data/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = Provider((ref) => AuthViewModel());

class AuthViewModel {
  final AuthRepository _authRepository = AuthRepository();

  Future<void> login(String email, String password) async {
    await _authRepository.login(email, password);
  }

  Future<void> logout() async {
    await _authRepository.logout();
  }
}
