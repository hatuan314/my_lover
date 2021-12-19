import 'package:flutter/material.dart';
import 'package:my_lover/common/app_utils.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';

import 'bottom_sheet_header_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  final String header;
  final Widget body;

  const BottomSheetWidget({Key? key, required this.header, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(LayoutConstants.roundedRadius)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomSheetHeaderWidget(
              title: header,
            ),
            SafeArea(
                child: !AppUtils.isNullEmpty(body)
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: LayoutConstants.appPaddingHorizontal,
                          vertical: LayoutConstants.paddingVertical8,
                        ),
                        child: body,
                      )
                    : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
