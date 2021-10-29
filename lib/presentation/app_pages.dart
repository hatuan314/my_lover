import 'package:get/get.dart';
import 'package:my_lover/common/constants/key_constants.dart';
import 'package:my_lover/presentation/journey/splash_screen.dart';

import 'route_list.dart';

class AppPages {
  static List<GetPage> getPages() {
    // var args = Get.arguments as Map<String, dynamic>;
    return [
      GetPage(
          name: RouteList.splashScreen,
          page: () => const SplashScreen(key: KeyConstants.splashScreen,)),
    ];
  }
}