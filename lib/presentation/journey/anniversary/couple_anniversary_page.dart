import 'package:flutter/material.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';

import 'couple_anniversary_constants.dart';

class CoupleAnniversaryPage extends StatelessWidget {
  const CoupleAnniversaryPage({Key? key}) : super(key: key);

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
                CoupleAnniversaryConstants.coupleAnniversaryTitle,
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