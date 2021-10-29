import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en.dart';
import 'vi.dart';

class AppTranslation extends Translations {
  static const String localeCodeVi = 'vi_VN';
  static const String localeCodeEn = 'en_US';

  @override
  Map<String, Map<String, String>> get keys => {
        localeCodeVi: vi,
        localeCodeVi: en,
      };

  static const List<Locale> localeList = [Locale('vi', 'VN'), Locale('en', 'US')];

  static const Locale initialLocale = Locale('en', 'US');

  static String? getString(String? key) {
    Map<String, String> selectedLanguage = Get.locale.toString() == localeCodeEn ? en : vi;
    return selectedLanguage.containsKey(key) && selectedLanguage[key] != null
        ? selectedLanguage[key]
        : '--Empty String--';
  }
}
