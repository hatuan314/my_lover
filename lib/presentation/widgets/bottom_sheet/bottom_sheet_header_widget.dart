import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_lover/common/constants/icon_constants.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';
import 'package:my_lover/presentation/widgets/app_image_widget.dart';
import 'package:my_lover/presentation/widgets/touchable_widget.dart';

class BottomSheetHeaderWidget extends StatelessWidget {
  final String title;

  const BottomSheetHeaderWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: AppColor.grey300, width: 1.h),
      )),
      padding: EdgeInsets.symmetric(horizontal: LayoutConstants.appPaddingHorizontal),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: TouchableWidget(
                onPressed: () {
                  Get.back();
                },
                child: AppImageWidget.asset(
                  path: IconConstants.icClose,
                  width: LayoutConstants.iconsSize15,
                  height: LayoutConstants.iconsSize15,
                  color: AppColor.primaryColor,
                ),
              )),
          Center(
            child: Text(
              title,
              style: ThemeText.body1Pacifico.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
