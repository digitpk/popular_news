// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesStateAdapter extends TypeAdapter<FavoritesState> {
  @override
  FavoritesState read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesState()
      ..news = (fields[0] as Map)?.cast<String, Article>()
      ..refreshHashcode();
  }

  @override
  void write(BinaryWriter writer, FavoritesState obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.news);
  }
}
