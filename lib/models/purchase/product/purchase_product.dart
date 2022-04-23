import 'package:freezed_annotation/freezed_annotation.dart';

import '../../category/category.dart';
import '../../product/product.dart';

part 'purchase_product.freezed.dart';
part 'purchase_product.g.dart';

@freezed
class PurchaseProductModel with _$PurchaseProductModel {
  @JsonSerializable(explicitToJson: true)
  factory PurchaseProductModel(
      {required String id,
      required CategoryModel categoryModel,
      required ProductModel productModel,
      required double qty,
      required double rate,
      required double amount,
      required double discount,
      required double lorryFright,
      required double tax,
      required double taxableValue,
      required double totalAmount}) = _PurchaseProductModel;
  factory PurchaseProductModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseProductModelFromJson(json);
}

List<Map<String, dynamic>> getPurchaseListJson(
    List<PurchaseProductModel> list) {
  return list.map((e) => e.toJson()).toList();
}
