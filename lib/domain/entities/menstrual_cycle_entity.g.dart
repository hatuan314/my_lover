// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menstrual_cycle_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenstrualCycleEntityAdapter extends TypeAdapter<MenstrualCycleEntity> {
  @override
  final int typeId = 0;

  @override
  MenstrualCycleEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenstrualCycleEntity(
      createAt: fields[0] as int,
      startDate: fields[1] as int,
      endDate: fields[2] as int,
      hiveJson: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MenstrualCycleEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.createAt)
      ..writeByte(1)
      ..write(obj.startDate)
      ..writeByte(2)
      ..write(obj.endDate)
      ..writeByte(3)
      ..write(obj.hiveJson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenstrualCycleEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
