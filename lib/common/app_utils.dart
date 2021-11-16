import 'package:my_lover/common/constants/icon_constants.dart';

import 'app_enum.dart';

class AppUtils {
  static String convertZodiacString(Zodiac zodiac) {
    switch(zodiac) {
      case Zodiac.pisces:
        return 'Song ngư';
      case Zodiac.cancer:
        return 'Cự giải';
    }
  }

  static String convertZodiacIconPath(Zodiac zodiac) {
    switch(zodiac) {
      case Zodiac.pisces:
        return IconConstants.icPisces;
      case Zodiac.cancer:
        return IconConstants.icCancer;
    }
  }

  static String convertSexIconPath(Sex sex) {
    switch(sex) {
      case Sex.male:
        return IconConstants.icMale;
      case Sex.female:
        return IconConstants.icFemale;
    }
  }

  static bool isNullEmpty(Object? o) => o == null || "" == o;

  static bool isNullEmptyList<T>(List<T> t) => t == null || [] == t || t.isEmpty;

  static bool isNullEmptyOrFalse(Object? o) => o == null || false == o || "" == o;

  static bool isNullEmptyFalseOrZero(Object? o) =>
      o == null || false == o || 0 == o || "" == o || "0" == o;
}