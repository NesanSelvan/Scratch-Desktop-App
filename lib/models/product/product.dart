import 'package:freezed_annotation/freezed_annotation.dart';

import '../price/price.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  @JsonSerializable(explicitToJson: true)
  const factory ProductModel({
    required String id,
    required String code,
    String? productNumber,
    // String? barcodeCode,
    required String productName,
    required String categoryId,
    required String unitId,
    @Default(0) int? unitQty,
    @Default([]) List<PriceModel>? differentPriceList,
    required double purchasePrice,
    required double sellingPrice,
    @Default(false) bool? isHidden,
    required double wholesale,
    required double retail,
    @Default(false) bool? isPending,
    String? companyId,
    List<String>? imagesList,
    required DateTime createdAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

List<Map<String, dynamic>> getProductListJson(List<ProductModel> list) {
  return list.map((e) => e.toJson()).toList();
}
