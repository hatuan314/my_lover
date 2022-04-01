import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lover/common/constants/image_constants.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/route_list.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/widgets/app_image_widget.dart';

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
    return Material(
      color: AppColor.primaryColor,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
              width: Get.width * 0.5,
              padding: EdgeInsets.only(bottom: LayoutConstants.space_36),
              child: AppImageWidget(path: ImageConstants.iLoveU2)),
          Center(
            child: Container(
              color: AppColor.primaryColor,
              width: double.infinity,
              child: SizedBox(
                height: Get.height * 0.3,
                child: Image.asset(
                  ImageConstants.splashImage,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
