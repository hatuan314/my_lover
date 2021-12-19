import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';

ThemeData appTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'QS',
      primaryColor: AppColor.primaryColor,
      buttonTheme: ButtonThemeData(
        buttonColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(LayoutConstants.roundedRadius),
        ),
      ),
      scaffoldBackgroundColor: AppColor.primaryColor,
      appBarTheme: const AppBarTheme(
        color: AppColor.primaryColor, elevation: 0.0, backwardsCompatibility: false, // 1
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      toggleableActiveColor: AppColor.primaryColor,
      cursorColor: AppColor.primaryColor);
}
