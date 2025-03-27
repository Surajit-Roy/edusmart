import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(Map<String, dynamic> userData) async {
    try {
      await _firestore.collection('users').doc(userData['id']).set(userData);
    } catch (e) {
      throw Exception("Failed to add user: $e");
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUser(String userId) {
    return _firestore.collection('users').doc(userId).snapshots();
  }

  Future<void> updateUser(String userId, Map<String, dynamic> updates) async {
    try {
      await _firestore.collection('users').doc(userId).update(updates);
    } catch (e) {
      throw Exception("Failed to update user: $e");
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      throw Exception("Failed to delete user: $e");
    }
  }
}