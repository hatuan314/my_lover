import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lover/common/app_enum.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/journey/home/home_controller.dart';
import 'package:my_lover/presentation/journey/main/widgets/info_widget.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';
import 'package:my_lover/presentation/widgets/ware_progress/ware_progress_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double loveProgressSize = MediaQuery.of(context).size.width * 0.5;
    double progress = 60;
    return Obx(
      () => Material(
        color: AppColor.transparent,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: LayoutConstants.appPaddingHorizontal),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  WaveProgress(
                    loveProgressSize,
                    AppColor.primaryColor,
                    AppColor.primaryColorOp30,
                    progress,
                  ),
                  Text(controller.dating.value.toString(), style: ThemeText.headline2Pacifico.copyWith(color: AppColor.white),)
                ],
              ),
              SizedBox(height: LayoutConstants.appPaddingVertical,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoWidget(name: 'Hoàng Tuấn', sex: Sex.male, zodiac: Zodiac.pisces, age: controller.myAge.value,),
                  InfoWidget(name: 'Sumi', sex: Sex.female, zodiac: Zodiac.cancer, age: controller.sumiAge.value),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}