import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_lover/common/app_enum.dart';
import 'package:my_lover/common/constants/image_constants.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/common/constants/string_constants.dart';
import 'package:my_lover/presentation/journey/home/home_controller.dart';
import 'package:my_lover/presentation/journey/main/main_controller.dart';
import 'package:my_lover/presentation/journey/main/widgets/info_widget.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';
import 'package:my_lover/presentation/widgets/app_dialog.dart';
import 'package:my_lover/presentation/widgets/app_image_widget.dart';
import 'package:my_lover/presentation/widgets/app_screen.dart';
import 'package:my_lover/presentation/widgets/button_widget.dart';
import 'package:my_lover/presentation/widgets/carousel_slider/carousel_slider.dart';

import 'widgets/happy_birthday_sumi_dialog.dart';
import 'widgets/one_year_anniversary_lovers_dialog.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildBackgroundImageWidget(String path) {
    return AppImageWidget(
      path: path,
      fit: BoxFit.fitHeight,
    );
  }

  Widget _buildBackground() {
    return CarouselSlider(
      options: CarouselOptions(height: Get.height, viewportFraction: 1, autoPlay: true),
      items: [
        _buildBackgroundImageWidget(ImageConstants.background1),
        _buildBackgroundImageWidget(
          ImageConstants.background2,
        ),
        _buildBackgroundImageWidget(
          ImageConstants.background3,
        ),
        _buildBackgroundImageWidget(
          ImageConstants.background4,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildBackground(),
        Obx(
          () => AppScreen(
            backgroundColor: AppColor.white.withOpacity(0.3),
            title: StringConstants.appName,
            body: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AppImageWidget(
                        path: ImageConstants.heartbeatLove,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        controller.dating.value.toString(),
                        style: ThemeText.headline3Pacifico.copyWith(color: AppColor.primaryColor),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: LayoutConstants.appPaddingHorizontal).copyWith(top: 200.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InfoWidget(
                              name: 'Ho??ng Tu???n',
                              sex: Sex.male,
                              zodiac: Zodiac.pisces,
                              age: controller.myAge.value,
                            ),
                            InfoWidget(
                                name: 'Duy??n Sumi',
                                sex: Sex.female,
                                zodiac: Zodiac.cancer,
                                age: controller.sumiAge.value),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: LayoutConstants.space_36,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
            width: Get.width * 0.8,
            padding: EdgeInsets.only(bottom: LayoutConstants.space_36),
            child: AppImageWidget(path: ImageConstants.kissYou)),
      ],
    );
  }
}
