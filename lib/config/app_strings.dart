import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStrings {
  static const supportedLocales = [
    Locale('en', ''),
    Locale('bn', ''),
    Locale('hi', ''),
  ];

  static Future<Map<String, dynamic>> loadLocalizedStrings(
    String languageCode,
  ) async {
    String jsonString = await rootBundle.loadString(
      'lib/assets/lang/$languageCode.json',
    );
    return jsonDecode(jsonString);
  }

  static String getText(BuildContext context, String key) {
    Locale locale = Localizations.localeOf(context);
    String langCode = locale.languageCode;
    return _localizedValues[langCode]?[key] ?? key;
  }

  static Map<String, Map<String, dynamic>> _localizedValues = {};

  static Future<void> loadAllLanguages() async {
    for (var locale in supportedLocales) {
      String langCode = locale.languageCode;
      _localizedValues[langCode] = await loadLocalizedStrings(langCode);
    }
  }
}
