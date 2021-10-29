import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lover/common/app_enum.dart';
import 'package:my_lover/common/constants/key_constants.dart';
import 'package:my_lover/presentation/controllers/app_controller.dart';
import 'package:my_lover/presentation/widgets/loader_widget.dart';

class RootScreen extends GetView<AppController> {
  final Widget child;

  const RootScreen(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          // unFocus text field
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Stack(
          children: [
            child,
            controller.loaderState.value == LoaderType.start
                ? const LoaderWidget(
                    key: KeyConstants.loaderWidget,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      );
    });
  }
}
