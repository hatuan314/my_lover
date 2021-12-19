import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_lover/common/constants/icon_constants.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/journey/main/main_constants.dart';
import 'package:my_lover/presentation/journey/main/main_controller.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/widgets/app_image_widget.dart';
import 'package:my_lover/presentation/widgets/touchable_widget.dart';

class BottomNavigationWidget extends GetWidget<MainController> {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  Widget _buildItemWidget({int? index, String? iconPath, Function()? onPressed}) {
    return Expanded(
        child: TouchableWidget(
      onPressed: onPressed,
      height: double.infinity,
      child: SafeArea(
        child: AppImageWidget.asset(
          path: iconPath!,
          height: LayoutConstants.iconsSize18,
          color: index == controller.selectIndex.value
              ? AppColor.primaryColor
              : AppColor.primaryColorOp50,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: SizedBox(
          height: MainConstants.bottomNavigationHeight,
          child: Row(
            children: [
              _buildItemWidget(
                  index: 0,
                  iconPath: IconConstants.icHome,
                  onPressed: () => controller.onSelectedItem(0)),
              _buildItemWidget(
                  index: 1,
                  iconPath: IconConstants.icCalendar,
                  onPressed: () => controller.onSelectedItem(1)),
              _buildItemWidget(
                  index: 2,
                  iconPath: IconConstants.icMenstrualCycle,
                  onPressed: () => controller.onSelectedItem(2)),
            ],
          ),
        ),
      ),
    );
  }
}
