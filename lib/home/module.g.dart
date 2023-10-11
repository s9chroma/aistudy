// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModuleAdapter extends TypeAdapter<Module> {
  @override
  final int typeId = 0;

  @override
  Module read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Module(
      moduleName: fields[0] as String,
      moduleId: fields[1] as String,
      components: (fields[2] as List).cast<String>(),
      creditPoints: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Module obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.moduleName)
      ..writeByte(1)
      ..write(obj.moduleId)
      ..writeByte(2)
      ..write(obj.components)
      ..writeByte(3)
      ..write(obj.creditPoints);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModuleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
