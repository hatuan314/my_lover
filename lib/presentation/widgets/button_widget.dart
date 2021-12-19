import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';

import 'touchable_widget.dart';

class ButtonWidget extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Function() onPressed;

  const ButtonWidget({
    Key? key,
    required this.child,
    this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableWidget(
      onPressed: onPressed,
      child: Container(
        height: 48.h,
        padding: EdgeInsets.symmetric(
            horizontal: LayoutConstants.appPaddingHorizontal),
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColor.primaryColor,
            borderRadius: const BorderRadius.all(
                Radius.circular(LayoutConstants.roundedRadius))),
        child: child,
      ),
    );
  }
}
