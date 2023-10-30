import 'package:annai_store/models/price/price.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  @override
  bool operator ==(dynamic other) {
    return other is _$ProductModel &&
        (const DeepCollectionEquality().equals(other.id, id)) &&
        (const DeepCollectionEquality().equals(other.categoryId, categoryId));
  }
}

List<Map<String, dynamic>> getProductListJson(List<ProductModel> list) {
  return list.map((e) => e.toJson()).toList();
}
