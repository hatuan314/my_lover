import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt myAge = 0.obs;
  RxInt sumiAge = 0.obs;
  RxInt dating = 0.obs;

  static const int dayMillisecond = 24 * 60 * 60 * 1000;

  int _setAge(int yearOfBirth) {
    return DateTime.now().year - yearOfBirth;
  }

  void _setCoupeAge() {
    myAge.value = _setAge(1997);
    sumiAge.value = _setAge(1998);
  }

  void _setDating() {
    int startDating = DateTime(2021, 10, 24).millisecondsSinceEpoch;
    int now = DateTime.now().millisecondsSinceEpoch;
    int currentDatingMilliseconds = now - startDating;
    dating.value = (currentDatingMilliseconds / dayMillisecond).floor();
  }

  @override
  void onReady() {
    super.onReady();
    _setCoupeAge();
    _setDating();
  }
}
