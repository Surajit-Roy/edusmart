import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edusmart/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    await _auth.signOut();
  }


  // Login and Fetch User ID
  Future<String?> login(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = credential.user;

      if (user != null) {
        // Fetch user id from Firestore
        return user.uid;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  // Register User with Dynamic Data
  Future<UserModel?> register(
    UserModel userModel,
    String password
  ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: password,
      );

      User? user = credential.user;
      if (user == null) {
        throw FirebaseAuthException(
          code: "ERROR_UNKNOWN",
          message: "User registration failed.",
        );
      }
      String userId = user.uid; // Get Firebase Authentication UID

      // Step 2: Save user details in Firestore **BEFORE checking**
      UserModel newUser = UserModel(
        id: userId,
        fullName: userModel.fullName,
        email: userModel.email,
        role: userModel.role,
        phone: userModel.phone,
        schoolId: userModel.schoolId,
        className: userModel.className,
        schoolName: userModel.schoolName,
        status: userModel.status,
        subject: userModel.subject,
        rollNo: userModel.rollNo
      );

      await FirebaseFirestore.instance.collection('users').doc(userId).set(newUser.toJson());

      // Step 3: Now check if user exists (THIS SHOULD ALWAYS BE TRUE)
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .get();

      if (!userDoc.exists) {
        throw FirebaseAuthException(
          code: "ERROR_FIRESTORE_WRITE",
          message: "User registration failed in Firestore.",
        );
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