// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarStatusAdapter extends TypeAdapter<CarStatus> {
  @override
  final int typeId = 0;

  @override
  CarStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarStatus(
      lastKilometers: fields[0] as int,
      oilKilometers: fields[1] as int,
      checkKilometers: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CarStatus obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.lastKilometers)
      ..writeByte(1)
      ..write(obj.oilKilometers)
      ..writeByte(2)
      ..write(obj.checkKilometers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
