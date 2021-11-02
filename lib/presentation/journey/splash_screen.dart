import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lover/common/constants/image_constants.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/route_list.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: LayoutConstants.splashTimer)).then((value) {
      Get.offAllNamed(RouteList.mainScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 2 / 3;
    return Material(
      color: AppColor.primaryColor,
      child: Center(
        child: Image.asset(
          ImageConstants.splashImage,
          width: width,
        ),
      ),
    );
  }
}
