import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_lover/common/constants/icon_constants.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';
import 'package:my_lover/presentation/widgets/button_widget.dart';

class EmptyMenstrualCycleWidget extends StatelessWidget {
  final Function() onAddMenstrualCycle;
  const EmptyMenstrualCycleWidget({Key? key,required this.onAddMenstrualCycle,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonWidget(
        onPressed: onAddMenstrualCycle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              IconConstants.icAdd,
              width: LayoutConstants.iconsSize18,
              color: AppColor.white,
            ),
            SizedBox(width: LayoutConstants.paddingHorizontal8,),
            Text(
              'Viết nhật ký',
              style: ThemeText.button.copyWith(color: AppColor.white),
            )
          ],
        ),
      ),
    );
  }
}
