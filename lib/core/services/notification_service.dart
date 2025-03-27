// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/material.dart';

// class NotificationService {
//   static final FirebaseMessaging _firebaseMessaging =
//       FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin
//   _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   /// Initialize Notifications
//   static Future<void> initialize() async {
//     // Request notification permissions
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     // Get the device FCM token (use this for sending notifications)
//     String? token = await _firebaseMessaging.getToken();
//     debugPrint("FCM Token: $token");

//     // Initialize local notifications
//     const AndroidInitializationSettings androidInitSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const InitializationSettings initSettings = InitializationSettings(
//       android: androidInitSettings,
//     );
//     await _flutterLocalNotificationsPlugin.initialize(initSettings);

//     // Handle incoming foreground notifications
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       debugPrint("📩 Received a notification: ${message.notification?.title}");
//       _showNotification(message);
//     });

//     // Handle background & terminated notifications
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       debugPrint(
//         "🔄 App opened from notification: ${message.notification?.title}",
//       );
//       _handleNotificationClick(message);
//     });
//   }

//   /// Show Local Notification
//   static Future<void> _showNotification(RemoteMessage message) async {
//     RemoteNotification? notification = message.notification;
//     AndroidNotificationDetails androidDetails =
//         const AndroidNotificationDetails(
//           'channelId',
//           'channelName',
//           importance: Importance.max,
//           priority: Priority.high,
//         );

//     NotificationDetails details = NotificationDetails(android: androidDetails);
//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       notification?.title,
//       notification?.body,
//       details,
//     );
//   }

//   /// Handle Notification Click
//   static void _handleNotificationClick(RemoteMessage message) {
//     // Navigate to a specific screen when notification is clicked (example)
//     debugPrint("User clicked on notification: ${message.notification?.title}");
//   }
// }
