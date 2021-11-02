import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_lover/common/bindings/app_binding.dart';
import 'package:my_lover/common/constants/key_constants.dart';
import 'package:my_lover/common/translation/app_translation.dart';
import 'package:my_lover/presentation/journey/root_screen.dart';
import 'package:my_lover/presentation/themes/theme_data.dart';

import 'app_pages.dart';
import 'route_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () {
        return GetMaterialApp(
          initialBinding: AppBinding(),
          initialRoute: RouteList.splashScreen,
          getPages: AppPages.getPages(),
          translations: AppTranslation(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppTranslation.localeList,
          locale: AppTranslation.initialLocale,
          fallbackLocale: const Locale('vi', 'VN'),
          theme: appTheme(),
          builder: (context, child) {
            return RootScreen(child!, key: KeyConstants.rootScreen,);
          },
        );
      },
    );
  }

}