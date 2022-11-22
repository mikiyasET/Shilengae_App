import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shilingae/resources/langs/am_et.dart';
import 'package:shilingae/resources/langs/en_us.dart';

// C:\Users\mikiy\Downloads\Compressed\Shilengae\resources\langs\am_et.dart
class LocalizationService extends Translations {
  // Default locale
  static final locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('am', 'ET');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Amharic',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('am', 'ET'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
        'am_ET': amET, // lang/am_ET.dart
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String? lang) {
    final locale = _getLocaleFromLanguage(lang)!;
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String? lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
