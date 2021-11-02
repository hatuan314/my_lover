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
}