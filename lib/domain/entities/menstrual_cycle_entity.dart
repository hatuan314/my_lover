import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:my_lover/domain/entities/hive_entity.dart';

part 'menstrual_cycle_entity.g.dart';

@HiveType(typeId: 0)
class MenstrualCycleEntity {
  @HiveField(0)
  int createAt;
  @HiveField(1)
  int startDate;
  @HiveField(2)
  int endDate;
  @HiveField(3)
  String? hiveJson;
  HiveEntity? hive;

  MenstrualCycleEntity(
      {required this.createAt, required this.startDate, required this.endDate, this.hiveJson, this.hive});

  void setHiveJson() {
    hiveJson = jsonEncode(hive?.toJson());
  }

  void setHive() {
    Map<String, dynamic> json = jsonDecode(hiveJson ?? '');
    hive = HiveEntity.fromJson(json);
  }
}