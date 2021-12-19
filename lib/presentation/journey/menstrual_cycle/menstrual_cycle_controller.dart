import 'package:get/get.dart';
import 'package:my_lover/domain/entities/menstrual_cycle_entity.dart';

class MenstrualCycleController extends GetxController {
  Rx<DateTime> rxStartDate = DateTime.now().obs;
  Rx<DateTime> rxEndDate = DateTime.now().obs;

  void setStartDate(DateTime value) {
    rxStartDate.value = value;
  }

  void setEndDate(DateTime value) {
    rxEndDate.value = value;
  }

  void addMenstrualCycleController() {
    final menstrualCycle = MenstrualCycleEntity(
        createAt: DateTime.now().millisecondsSinceEpoch,
        startDate: rxStartDate.value.millisecondsSinceEpoch,
        endDate: rxEndDate.value.millisecondsSinceEpoch,);
  }
}
