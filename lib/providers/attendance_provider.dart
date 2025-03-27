import 'package:edusmart/data/models/attendance_model.dart';
import 'package:edusmart/data/repositories/attendance_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) {
  return AttendanceRepository();
});

final markAttendanceProvider = FutureProvider.family<void, AttendanceModel>((ref, attendance) async {
  final repo = ref.read(attendanceRepositoryProvider);
  await repo.markAttendance(attendance);
});

final updateAttendanceProvider = FutureProvider.family<void, AttendanceModel>((ref, attendance) async {
  final repo = ref.read(attendanceRepositoryProvider);
  await repo.updateAttendance(attendance);
});

final deleteAttendanceProvider = FutureProvider.family<void, String>((ref, attendanceId) async {
  final repo = ref.read(attendanceRepositoryProvider);
  await repo.deleteAttendance(attendanceId);
});

final attendanceRecordsProvider = StreamProvider.family<List<AttendanceModel>, String>((ref, studentId) {
  final repo = ref.read(attendanceRepositoryProvider);
  return repo.getAttendanceRecords(studentId);
});
