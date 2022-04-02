import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lover/common/constants/key_constants.dart';
import 'package:my_lover/presentation/journey/home/home_page.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';

import 'main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: AppColor.white,
      child: HomePage(
        key: KeyConstants.homePage,
      ),
    );
  }
}
