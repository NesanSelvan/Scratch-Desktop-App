import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock.freezed.dart';
part 'stock.g.dart';

@unfreezed
abstract class StockModel with _$StockModel {
  factory StockModel(
    String id,
    String productId,
    String productCode,
    double qty,
    DateTime createdAt,
  ) = _StockModel;
  factory StockModel.fromJson(Map<String, dynamic> json) =>
      _$StockModelFromJson(json);
}

List<Map<String, dynamic>> getStockListJson(List<StockModel> stockModelList) {
  return stockModelList.map((e) => e.toJson()).toList();
}
