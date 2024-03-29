import 'package:annai_store/models/unit/new_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

@unfreezed
abstract class UnitModel with _$UnitModel {
  @JsonSerializable(explicitToJson: true)
  factory UnitModel(
    String? id,
    String? symbol,
    String? formalName,
    int? unitNo,
    DateTime? dateTime,
  ) = _UnitModel;

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);

  @override
  String toString() => """
        id: $id,
        symbol: $symbol,
        formalName: $formalName,
        unitNo: $unitNo,
      """;
}

extension Extra on UnitModel {
  Unit get unit => Unit(
        id: id ?? const Uuid().v4(),
        createdAt: dateTime ?? DateTime.now(),
        symbol: symbol,
        formalName: formalName,
        unitNo: unitNo,
      );
}

List<Map<String, dynamic>> getUnitListJson(List<UnitModel> unitModelList) {
  return unitModelList.map((e) => e.toJson()).toList();
}
