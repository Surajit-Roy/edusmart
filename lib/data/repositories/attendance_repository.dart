import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/attendance_model.dart';

class AttendanceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> markAttendance(AttendanceModel attendance) async {
    await _firestore.collection('attendance').doc(attendance.id).set(attendance.toJson());
  }

  Future<void> updateAttendance(AttendanceModel attendance) async {
    await _firestore.collection('attendance').doc(attendance.id).update(attendance.toJson());
  }

  Future<void> deleteAttendance(String attendanceId) async {
    await _firestore.collection('attendance').doc(attendanceId).delete();
  }

  Stream<List<AttendanceModel>> getAttendanceRecords(String studentId) {
    return _firestore.collection('attendance')
        .where('studentId', isEqualTo: studentId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => 
            AttendanceModel.fromJson(doc.data() as Map<String, dynamic>)).toList());
  }
}