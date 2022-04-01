import 'package:flutter/material.dart';
import 'package:my_lover/common/app_enum.dart';
import 'package:my_lover/common/app_utils.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';

class InfoWidget extends StatelessWidget {
  final String name;
  final Zodiac zodiac;
  final Sex sex;
  final int age;

  const InfoWidget({
    Key? key,
    required this.name,
    required this.zodiac,
    required this.sex,
    required this.age,
  }) : super(key: key);

  Widget _elementWidget({required Color color, required String iconPath, required String text}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: color,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: LayoutConstants.paddingHorizontal8,
        vertical: LayoutConstants.paddingVertical3,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: LayoutConstants.iconsSize15,
          ),
          SizedBox(width: LayoutConstants.paddingHorizontal8,),
          Text(
            text,
            style: ThemeText.captionPacifico.copyWith(color: AppColor.white),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          style: ThemeText.body1Pacifico,
        ),
        SizedBox(height: LayoutConstants.space_8,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _elementWidget(
              color: AppColor.black,
              iconPath: AppUtils.convertSexIconPath(sex),
              text: age.toString(),
            ),
            SizedBox(width: LayoutConstants.paddingVertical5,),
            _elementWidget(
              color: AppColor.primaryColor,
              iconPath: AppUtils.convertZodiacIconPath(zodiac),
              text: AppUtils.convertZodiacString(zodiac),
            ),
          ],
        )
      ],
    );
  }
}
