import 'package:edusmart/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'config/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (Firebase.apps.isNotEmpty) {
  //   await Firebase.app().delete();
  // }
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppStrings.loadAllLanguages();
  // await NotificationService.initialize();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduSmart',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppStrings.supportedLocales,
      home: const App(),
    );
  }
}
