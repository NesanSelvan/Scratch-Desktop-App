import 'package:freezed_annotation/freezed_annotation.dart';

import '../unit/unit.dart';

part 'price.freezed.dart';
part 'price.g.dart';

@freezed
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
}

List<Map<String, dynamic>> getPriceListJson(List<PriceModel> list) {
  return list.map((e) => e.toJson()).toList();
}
