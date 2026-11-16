import 'package:flutter/material.dart';

/// Global locale manager for dynamic language switching.
class LocaleManager {
  static final ValueNotifier<Locale> localeNotifier =
      ValueNotifier<Locale>(const Locale('ar'));

  static void changeLanguage(String languageCode) {
    if (languageCode == 'ar' || languageCode == 'en') {
      localeNotifier.value = Locale(languageCode);
    }
  }

  static void setLocale(Locale locale) {
    localeNotifier.value = locale;
  }

  static bool get isArabic => localeNotifier.value.languageCode == 'ar';
}
