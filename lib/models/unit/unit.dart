import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

@freezed
abstract class UnitModel with _$UnitModel {
  const factory UnitModel(String? id, String? symbol, String? formalName,
      int? unitNo, DateTime? dateTime) = _UnitModel;

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);
}

List<Map<String, dynamic>> getUnitListJson(List<UnitModel> unitModelList) {
  return unitModelList.map((e) => e.toJson()).toList();
}
