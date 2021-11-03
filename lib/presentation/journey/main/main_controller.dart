import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt selectIndex = 0.obs;

  void onSelectedItem(int index) {
    selectIndex.value = index;
  }
}