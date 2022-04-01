import 'package:flutter/material.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';

import 'appbar_widget.dart';

class AppScreen extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget body;
  final Widget? titleWidget;
  final Color? backgroundColor;

  const AppScreen({
    Key? key,
    this.title,
    this.actions,
    required this.body,
    this.titleWidget,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColor.transparent,
      appBar: AppBarWidget(
        title: title,
        actions: actions,
        titleWidget: titleWidget,
      ),
      body: body,
    );
  }
}
