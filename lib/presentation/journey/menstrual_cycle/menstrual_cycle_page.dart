import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_lover/common/constants/icon_constants.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/journey/menstrual_cycle/widgets/add_menstrual_cycle_bottom_sheet_widget.dart';
import 'package:my_lover/presentation/journey/menstrual_cycle/widgets/empty_menstrual_cycle_widget.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';
import 'package:my_lover/presentation/widgets/app_image_widget.dart';
import 'package:my_lover/presentation/widgets/app_screen.dart';
import 'package:my_lover/presentation/widgets/touchable_widget.dart';

import 'menstrual_cycle_constants.dart';

class MenstrualCyclePage extends StatelessWidget {
  const MenstrualCyclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      titleWidget: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            MenstrualCycleConstants.menstrualCycleTitle,
            style: ThemeText.body1Pacifico.copyWith(color: AppColor.primaryColor),
          ),
          SizedBox(
            width: LayoutConstants.width_8,
          ),
          AppImageWidget.asset(
            path: IconConstants.icHeart,
            color: AppColor.primaryColor,
            width: LayoutConstants.space_16,
            height: LayoutConstants.space_16,
          ),
        ],
      ),
      actions: [
        TouchableWidget(
          onPressed: () {},
          child: SvgPicture.asset(
            IconConstants.icAdd,
            width: LayoutConstants.iconsSize18,
            color: AppColor.primaryColor,
          ),
        )
      ],
      body: EmptyMenstrualCycleWidget(
        onAddMenstrualCycle: () => _onAddMenstrualCycle(context),
      ),
    );
  }

  void _onAddMenstrualCycle(BuildContext context) {
    showModalBottomSheet<bool>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(LayoutConstants.roundedRadius),
        ),
        context: context,
        barrierColor: AppColor.blackOpacity50,
        enableDrag: false,
        builder: (BuildContext context) {
          return const AddMenstrualCycleBottomSheetWidget();
        }).then((value) {});
  }
}
