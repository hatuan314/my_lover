import 'package:flutter/material.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: AppColor.primaryColor.withOpacity(0.6),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}