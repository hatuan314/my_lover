import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lover/common/app_utils.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';

import 'app_image_widget.dart';

Future showAppDialog(BuildContext context, {required Widget child}) {
  return showDialog(context: context, builder: (context) => child);
}

class AppDialog extends StatelessWidget {
  final String dearText;
  final String content;
  final String icon;
  final String? lastMessage;

  const AppDialog({
    Key? key,
    required this.dearText,
    required this.content,
    required this.icon,
    this.lastMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: LayoutConstants.appPaddingHorizontal),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          LayoutConstants.space_12,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: Get.width * 0.15),
            padding: EdgeInsets.symmetric(horizontal: LayoutConstants.appPaddingHorizontal)
                .copyWith(top: Get.width * 0.15, bottom: LayoutConstants.space_36),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(LayoutConstants.space_12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dearText,
                  style: ThemeText.subtitle1,
                ),
                SizedBox(
                  height: LayoutConstants.space_12,
                ),
                Text(
                  content,
                  style: ThemeText.body2,
                ),
                !AppUtils.isNullEmpty(lastMessage)
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: LayoutConstants.space_20,
                            width: double.infinity,
                          ),
                          Text(
                            lastMessage!,
                            style: ThemeText.body2.copyWith(color: AppColor.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
          ClipOval(
            child: Container(
              width: Get.width * 0.3,
              height: Get.width * 0.3,
              color: AppColor.white,
              child: AppImageWidget(path: icon),
            ),
          )
        ],
      ),
    );
  }
}
