// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_country.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelCountryAdapter extends TypeAdapter<ModelCountry> {
  @override
  final int typeId = 2;

  @override
  ModelCountry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelCountry(
      name: fields[0] as String?,
      code: fields[1] as String?,
      flag: fields[2] as String?,
      currencyName: fields[3] as String?,
      currencySymbol: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ModelCountry obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.flag)
      ..writeByte(3)
      ..write(obj.currencyName)
      ..writeByte(4)
      ..write(obj.currencySymbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelCountryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
