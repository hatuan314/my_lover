import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lover/common/constants/key_constants.dart';
import 'package:my_lover/presentation/journey/anniversary/couple_anniversary_page.dart';
import 'package:my_lover/presentation/journey/home/home_page.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';

import 'main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  final List<Widget> pages = const [
    HomePage(
      key: KeyConstants.homePage,
    ),
    CoupleAnniversaryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: AppColor.white,
      child: HomePage(
        key: KeyConstants.homePage,
      ),
      // child: Column(
      //   children: [
      //     Expanded(child: pages.elementAt(controller.selectIndex.value)),
      //     BottomNavigationWidget()
      //   ],
      // ),
    );
  }
}
