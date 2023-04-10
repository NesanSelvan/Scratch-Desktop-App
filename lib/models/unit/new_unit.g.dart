// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_unit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewUnitModelAdapter extends TypeAdapter<NewUnitModel> {
  @override
  final int typeId = 0;

  @override
  NewUnitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewUnitModel(
      id: fields[0] as String,
      symbol: fields[1] as String?,
      formalName: fields[2] as String?,
      unitNo: fields[3] as int?,
      createdAt: fields[4] as DateTime,
      updatedAt: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, NewUnitModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.formalName)
      ..writeByte(3)
      ..write(obj.unitNo)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewUnitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
