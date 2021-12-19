import 'package:get/get.dart';
import 'package:my_lover/presentation/journey/home/home_controller.dart';
import 'package:my_lover/presentation/journey/main/main_controller.dart';
import 'package:my_lover/presentation/journey/menstrual_cycle/menstrual_cycle_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }

}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }

}

class MenstrualCycleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MenstrualCycleController());
  }

}