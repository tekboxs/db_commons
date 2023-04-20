// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************
part of 'custom_service_test.dart';

class AtletaAdapter extends TypeAdapter<Atleta> {
  @override
  final int typeId = 1;

  @override
  Atleta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Atleta(
      name: fields[0] as String,
      email: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Atleta obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AtletaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
