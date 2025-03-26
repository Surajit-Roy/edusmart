class AttendanceModel {
  final String id;
  final String studentId;
  final DateTime date;
  final bool isPresent;

  AttendanceModel({
    required this.id,
    required this.studentId,
    required this.date,
    required this.isPresent,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      id: json['id'],
      studentId: json['studentId'],
      date: DateTime.parse(json['date']),
      isPresent: json['isPresent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'date': date.toIso8601String(),
      'isPresent': isPresent,
    };
  }
}
