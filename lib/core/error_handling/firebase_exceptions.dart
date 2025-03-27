import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExceptions {
  static String getMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "This email is already registered.";
      case 'wrong-password':
        return "Incorrect password.";
      case 'user-not-found':
        return "User not found.";
      default:
        return "An unknown error occurred.";
    }
  }
}
