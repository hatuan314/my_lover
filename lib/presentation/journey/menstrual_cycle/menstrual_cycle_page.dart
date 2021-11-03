import 'package:flutter/material.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';

import 'menstrual_cycle_constants.dart';

class MenstrualCyclePage extends StatelessWidget {
  const MenstrualCyclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: LayoutConstants.appPaddingHorizontal),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: Text(
                MenstrualCycleConstants.menstrualCycleTitle,
                style: ThemeText.body1Pacifico,
              ),
            ),
          ),
          SizedBox.shrink()
        ],
      ),
    );
  }

}