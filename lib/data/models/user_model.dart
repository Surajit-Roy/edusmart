class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String role;
  final String schoolId;
  final String schoolName;
  final String? subject; // Nullable
  final String? className; // Nullable
  final String status;
  final int? rollNo; // Nullable

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.role,
    required this.schoolId,
    this.schoolName = "",
    this.subject, // Nullable
    this.className, // Nullable
    this.status = "pending",
    this.rollNo, // Nullable
  });

  // 🔹 Only include fields relevant to the user role
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'role': role,
      'schoolId': schoolId,
      'schoolName': schoolName,
      'status': status,
    };

    // 🔹 Add className & rollNo **only if role is student**
    if (role == 'student') {
      json['className'] = className;
      json['rollNo'] = rollNo;
    }

    // 🔹 Add subject **only if role is teacher**
    if (role == 'teacher') {
      json['subject'] = subject;
    }

    return json;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? '',
      schoolId: json['schoolId'] ?? '',
      schoolName: json['schoolName'] ?? '',
      subject: json['subject'], // Nullable
      className: json['className'], // Nullable
      status: json['status'] ?? 'pending',
      rollNo: json['rollNo'], // Nullable
    );
  }
}
