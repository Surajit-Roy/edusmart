import 'package:edusmart/features/auth/view/access_status.dart';
import 'package:edusmart/features/auth/view/login_screen.dart';
import 'package:edusmart/features/auth/view/register_screen.dart';
import 'package:edusmart/features/tour/navigation_card_screen.dart';
import 'package:edusmart/features/tour/splash_scree.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

class AppPages {
  static const String initial = AppRoutes.initial;

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.navigationCard: (context) => const NavigationCardScreen(),

    // Authentication
    AppRoutes.login: (context) => const LoginScreen(),
    AppRoutes.register: (context) => const RegisterScreen(),
    AppRoutes.accessStatus: (context) => const AccessStatusPage(),

    // Dashboards
    // AppRoutes.adminDashboard: (context) => const AdminDashboard(),
    // AppRoutes.teacherDashboard: (context) => const TeacherDashboard(),
    // AppRoutes.studentDashboard: (context) => const StudentDashboard(),

    // Common Screens
    // AppRoutes.profile: (context) => const ProfileScreen(),
    // AppRoutes.editProfile: (context) => const EditProfileScreen(),
    // AppRoutes.settings: (context) => const SettingsScreen(),

    // Admin Screens
    // AppRoutes.approveUsers: (context) => const ApproveUsersScreen(),
    // AppRoutes.manageUsers: (context) => const ManageUsersScreen(),
    // AppRoutes.schoolNotices: (context) => const SchoolNoticesScreen(),
    // AppRoutes.attendanceReports: (context) => const AttendanceReportsScreen(),
    // AppRoutes.classSchedules: (context) => const ClassSchedulesScreen(),
    // AppRoutes.studentReports: (context) => const StudentReportsScreen(),
    // AppRoutes.sendNotifications: (context) => const SendNotificationsScreen(),

    // Teacher Screens
    // AppRoutes.markAttendance: (context) => const MarkAttendanceScreen(),
    // AppRoutes.assignHomework: (context) => const AssignHomeworkScreen(),
    // AppRoutes.viewAnnouncements: (context) => const ViewAnnouncementsScreen(),
    // AppRoutes.uploadMaterials: (context) => const UploadMaterialsScreen(),

    // Student Screens
    // AppRoutes.viewAttendance: (context) => const ViewAttendanceScreen(),
    // AppRoutes.submitHomework: (context) => const SubmitHomeworkScreen(),
    // AppRoutes.viewGrades: (context) => const ViewGradesScreen(),
    // AppRoutes.downloadMaterials: (context) => const DownloadMaterialsScreen(),
  };
}
