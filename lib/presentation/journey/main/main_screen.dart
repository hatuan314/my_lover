import 'package:flutter/material.dart';
import 'package:my_lover/common/app_enum.dart';
import 'package:my_lover/common/constants/key_constants.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/common/constants/string_constants.dart';
import 'package:my_lover/presentation/journey/home/home_page.dart';
import 'package:my_lover/presentation/journey/main/widgets/info_widget.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';
import 'package:my_lover/presentation/widgets/ware_progress/ware_progress_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double loveProgressSize = MediaQuery.of(context).size.width * 0.5;
    double progress = 60;
    return Material(
      color: AppColor.secondColor,
      child: Column(
        children: [
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                StringConstants.appName,
                style: ThemeText.body1Pacifico,
              ),
            ),
          ),
          const Expanded(child: HomePage(key: KeyConstants.homePage,)),
        ],
      ),
    );
  }
}
