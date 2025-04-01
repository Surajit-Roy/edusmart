import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edusmart/data/models/user_model.dart';
import 'package:edusmart/providers/auth_provider.dart';
import 'package:edusmart/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = Provider((ref) => AuthViewModel(ref));

class AuthViewModel {
  final Ref ref;
  AuthViewModel(this.ref);
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔹 Fetch user status from Firestore
  Stream<String> getUserStatus() {
    final user = _auth.currentUser;
    if (user == null) return const Stream.empty();

    return _firestore.collection('users').doc(user.uid).snapshots().map((doc) {
      if (doc.exists && doc.data() != null) {
        return doc.data()!['status'] as String? ?? 'pending';
      }
      return 'pending';
    });
  }

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
    UserModel userModel,
    String password
  ) async {
    final user = await ref.read(
      registerUserProvider({
        'userModel': userModel,
        'password': password,
      }).future,
    );

    if (user != null) {
      await ref.read(createUserProvider(user).future);
    }
  }

  // 🔹 Get next available roll number for a student in a specific class
  Future<int> getNextRollNumber(String schoolId, String className) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      final querySnapshot = await firestore
          .collection('users')
          .where('schoolId', isEqualTo: schoolId)
          .where('className', isEqualTo: className)
          .orderBy('rollNo', descending: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final highestRollNo = querySnapshot.docs.first['rollNo'] ?? 0;
        return highestRollNo + 1;
      } else {
        return 1; // Start from 1 if no students exist in this class
      }
    } catch (e) {
      print("Error fetching roll number: $e");
      return 1; // Default to 1 in case of an error
    }
  }
}
