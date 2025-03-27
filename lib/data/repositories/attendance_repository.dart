import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edusmart/core/error_handling/network_exceptions.dart';
import '../models/attendance_model.dart';

class AttendanceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> markAttendance(AttendanceModel attendance) async {
    try {
      await _firestore.collection('attendance').doc(attendance.id).set(attendance.toJson());
    } catch (error) {
      throw NetworkExceptions.handleException(error);
    }
  }

  Future<void> updateAttendance(AttendanceModel attendance) async {
    try {
      await _firestore.collection('attendance').doc(attendance.id).update(attendance.toJson());
    } catch (error) {
      throw NetworkExceptions.handleException(error);
    }
  }

  Future<void> deleteAttendance(String attendanceId) async {
    try {
      await _firestore.collection('attendance').doc(attendanceId).delete();
    } catch (error) {
      throw NetworkExceptions.handleException(error);
    }
  }

  Stream<List<AttendanceModel>> getAttendanceRecords(String studentId) {
    try {
      return _firestore.collection('attendance')
        .where('studentId', isEqualTo: studentId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => 
            AttendanceModel.fromJson(doc.data() as Map<String, dynamic>)).toList());
    } catch (error) {
      throw NetworkExceptions.handleException(error);
    }
  }
}