import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../unit/unit.dart';

part 'price.freezed.dart';
part 'price.g.dart';

@unfreezed
class PriceModel with _$PriceModel {
  @JsonSerializable(explicitToJson: true)
  factory PriceModel(
      {required String id,
      String? code,
      String? barcodeCode,
      required UnitModel unitModel,
      double? purchasePrice,
      required double mrp,
      required double unitQty,
      required double retail,
      required double wholesale,
      required DateTime createdAt}) = _PriceModel;
  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);

  @override
  bool operator ==(Object other) {
    return other is _$PriceModel &&
        const DeepCollectionEquality().equals(other.id, id) &&
        (const DeepCollectionEquality()
            .equals(other.unitModel.id, unitModel.id));
  }
}

List<Map<String, dynamic>> getPriceListJson(List<PriceModel> list) {
  return list.map((e) => e.toJson()).toList();
}
