import 'package:hive_flutter/hive_flutter.dart';

import 'day_table_model.dart';

class DayTableModelAdapter extends TypeAdapter<DayTableModel> {
  @override
  DayTableModel read(BinaryReader reader) {
    return DayTableModel(
      dayName: reader.readString(),
      interval1: reader.readString(),
      interval2: reader.readString(),
      interval3: reader.readString(),
      interval4: reader.readString(),
      typeInterval1: reader.readString(),
      typeInterval2: reader.readString(),
      typeInterval3: reader.readString(),
      typeInterval4: reader.readString(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, DayTableModel obj) {
    writer.writeString(obj.dayName);
    writer.writeString(obj.interval1);
    writer.writeString(obj.interval2);
    writer.writeString(obj.interval3);
    writer.writeString(obj.interval4);
    writer.writeString(obj.typeInterval1);
    writer.writeString(obj.typeInterval2);
    writer.writeString(obj.typeInterval3);
    writer.writeString(obj.typeInterval4);
  }
}
