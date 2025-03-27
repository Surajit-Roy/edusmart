import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edusmart/core/error_handling/network_exceptions.dart';
import 'package:edusmart/data/models/user_model.dart';
import 'package:edusmart/data/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository _userRepository = UserRepository();

  // Future<User?> login(String email, String password) async {
  //   try {
  //     UserCredential credential = await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return credential.user;
  //   } catch (e){
  //     throw NetworkExceptions.handleException(e);
  //   }
  // }

  Future<void> logout() async {
    await _auth.signOut();
  }

  // Future<User?> register(String email, String password) async {
  //   try {
  //     UserCredential credential = await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return credential.user;
  //   } catch (e) {
  //     throw NetworkExceptions.handleException(e);
  //   }
  // }

   // ✅ Login and Fetch User Data
  Future<UserModel?> login(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = credential.user;
      if (user != null) {
        // ✅ Fetch user data from Firestore
        return await _userRepository.getUserById(user.uid);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  // ✅ Register User with Dynamic Data
  Future<UserModel?> register(String name, String email, String password, String role) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = credential.user;
      if (user == null) {
        throw FirebaseAuthException(
            code: "ERROR_UNKNOWN", message: "User registration failed.");
      }
      String userId = user.uid; // Get Firebase Authentication UID

      // Step 2: Save user details in Firestore **BEFORE checking**
      UserModel newUser = UserModel(
        id: userId,
        name: name,
        email: email,
        role: role,
      );

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        "name": name,
        "email": email,
        "role": role,
      });

      // Step 3: Now check if user exists (THIS SHOULD ALWAYS BE TRUE)
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (!userDoc.exists) {
        throw FirebaseAuthException(
            code: "ERROR_FIRESTORE_WRITE",
            message: "User registration failed in Firestore.");
      }

      return newUser;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }
  
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}