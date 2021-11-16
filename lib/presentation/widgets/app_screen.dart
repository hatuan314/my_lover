import 'package:flutter/material.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';

import 'appbar_widget.dart';

class AppScreen extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget body;

  const AppScreen({Key? key,required this.title, this.actions,required this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.transparent,
      appBar: AppBarWidget(
        title: title,
        actions: actions,
      ),
      body: body,
    );
  }

}