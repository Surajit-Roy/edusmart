class AppRoutes {
  static const String splash = '/splash';
  static const String navigationCard = '/navigationCard';

  // Authentication
  static const String login = '/login';
  static const String register = '/register';

  // Dashboards
  static const String adminDashboard = '/adminDashboard';
  static const String teacherDashboard = '/teacherDashboard';
  static const String studentDashboard = '/studentDashboard';

  // Common Screens
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';
  static const String settings = '/settings';

  // Admin Screens
  static const String approveUsers = '/approveUsers';
  static const String manageUsers = '/manageUsers';
  static const String schoolNotices = '/schoolNotices';
  static const String attendanceReports = '/attendanceReports';
  static const String classSchedules = '/classSchedules';
  static const String studentReports = '/studentReports';
  static const String sendNotifications = '/sendNotifications';

  // Teacher Screens
  static const String markAttendance = '/markAttendance';
  static const String assignHomework = '/assignHomework';
  static const String viewAnnouncements = '/viewAnnouncements';
  static const String uploadMaterials = '/uploadMaterials';

  // Student Screens
  static const String viewAttendance = '/viewAttendance';
  static const String submitHomework = '/submitHomework';
  static const String viewGrades = '/viewGrades';
  static const String downloadMaterials = '/downloadMaterials';

  static const String initial = splash;
}
