import 'package:flutter/material.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';
import 'package:my_lover/presentation/widgets/app_screen.dart';
import 'package:my_lover/presentation/widgets/appbar_widget.dart';

import 'couple_anniversary_constants.dart';

class CoupleAnniversaryPage extends StatelessWidget {
  const CoupleAnniversaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: CoupleAnniversaryConstants.coupleAnniversaryTitle,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: LayoutConstants.appPaddingHorizontal),
      ),
    );
  }
}
