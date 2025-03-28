import 'package:edusmart/data/models/user_model.dart';
import 'package:edusmart/providers/auth_provider.dart';
import 'package:edusmart/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = Provider((ref) => AuthViewModel(ref));

class AuthViewModel {
  final Ref ref;
  AuthViewModel(this.ref);

  //login
  Future<UserModel?> login(String email, String password) async {
    final userId = await ref.read(
      loginProvider({'email': email, 'password': password}).future,
    );

    if (userId != null) {
      return await ref.read(userProvider(userId).future);
    }
    return null;
  }

  //logout
  Future<void> logout() async {
    await ref.read(logoutProvider.future);
  }

  //register
  Future<void> register(
    String fullName,
    String email,
    String password,
    String role,
  ) async {
    final user = await ref.read(
      registerUserProvider({
        'fullName': fullName,
        'email': email,
        'password': password,
        'role': role,
      }).future,
    );

    if (user != null) {
      final newUser = UserModel(
        id: user.id,
        name: fullName,
        email: email,
        role: role,
      );
      await ref.read(createUserProvider(newUser).future);
    }
  }
}
