import 'package:freezed_annotation/freezed_annotation.dart';

import '../product.dart';
import 'details/sub_product_details.dart';

part 'sub_product.freezed.dart';
part 'sub_product.g.dart';

@freezed
abstract class SubProductModel with _$SubProductModel {
  @JsonSerializable(explicitToJson: true)
  const factory SubProductModel(
      {required String id,
      required ProductModel productModel,
      @Default([]) List<SubProductDetailsModel> subProducts,
      required DateTime createdAt}) = _SubProductModel;

  factory SubProductModel.fromJson(Map<String, dynamic> json) =>
      _$SubProductModelFromJson(json);
}

List<Map<String, dynamic>> getSubProductListJson(List<SubProductModel> list) {
  return list.map((e) => e.toJson()).toList();
}
