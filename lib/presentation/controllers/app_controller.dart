import 'dart:async';

import 'package:get/get.dart';
import 'package:my_lover/common/app_enum.dart';
import 'package:my_lover/common/constants/string_constants.dart';
import 'package:my_lover/common/translation/app_translation.dart';
import 'package:my_lover/presentation/widgets/snackbar_widget/snackbar_widget.dart';

class AppController extends GetxController {
  Rx<LoaderType> loaderState = LoaderType.finish.obs;
  final int _defaultTimeOut = 10;
  late StreamSubscription _subscription;

  void startLoading() {
    loaderState.value = LoaderType.start;
    _subscription = Future.delayed(Duration(seconds: _defaultTimeOut)).asStream().listen((event) {
      timeout();
    });
  }

  void finishLoading() {
    loaderState.value = LoaderType.finish;
    _subscription.cancel();
  }

  void timeout() {
    if (loaderState.value == LoaderType.start) {
      loaderState.value = LoaderType.finish;
      Get.showSnackbar(SnackBarWidget(
        title: AppTranslation.getString(StringConstants.msgErrorUnknown),
        type: SnackBarType.error,
      ));
    }
  }

  @override
  void onReady() {
    super.onReady();
    // Get.find<FirebaseConfig>().init();
    // Get.find<HiveConfig>().init();
  }
}
