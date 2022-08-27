import 'package:freezed_annotation/freezed_annotation.dart';

import '../customer/customer.dart';
import '../sales/product/sales_product.dart';

part 'estimate.freezed.dart';
part 'estimate.g.dart';

@freezed
abstract class EstimateModel with _$EstimateModel {
  @JsonSerializable(explicitToJson: true)
  const factory EstimateModel(
      {@JsonKey(name: "id") required String id,
      required String estimateNo,
      @Default("") String? billId,
      @Default(true) bool isTax,
      required double price,
      required List<SalesProductModel> productList,
      required CustomerModel customerModel,
      required DateTime dateTime,
      String? note,
      required DateTime createdAt}) = _EstimateModel;
  factory EstimateModel.fromJson(Map<String, dynamic> json) =>
      _$EstimateModelFromJson(json);
}

List<Map<String, dynamic>> getEstimateListJson(List<EstimateModel> list) {
  return list.map((e) => e.toJson()).toList();
}
