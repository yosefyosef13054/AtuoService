import 'package:flutter/material.dart';
import 'ar.dart';
import 'en.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  // Default locale
  static final locale = Locale('ar');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('en');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Arabic',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en'),
    Locale('ar'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en, // lang/en.dart
        'ar': ar, // lang/ar.dart
      };

  static Map<String, Map<String, String>> get keyss => {
        'en': en, // lang/en.dart
        'ar': ar, // lang/ar.dart
      };
  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
