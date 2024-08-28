// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginEntityAdapter extends TypeAdapter<LoginEntity> {
  @override
  final int typeId = 0;

  @override
  LoginEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginEntity(
      status: fields[0] as bool?,
      token: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
