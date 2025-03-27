import 'package:edusmart/core/error_handling/network_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> login(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e){
      throw NetworkExceptions.handleException(e);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<User?> register(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      throw NetworkExceptions.handleException(e);
    }
  }

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }
  
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}