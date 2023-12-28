import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'estimate.freezed.dart';
part 'estimate.g.dart';

@unfreezed
abstract class EstimateModel with _$EstimateModel {
  @JsonSerializable(explicitToJson: true)
  factory EstimateModel({
    @JsonKey(name: "id") required String id,
    required String estimateNo,
    @Default("") String? billId,
    @Default(true) bool isTax,
    required double price,
    required List<SalesProductModel> productList,
    required CustomerModel customerModel,
    required DateTime dateTime,
    @Default(0) double? givenAmount,
    String? note,
    required DateTime createdAt,
  }) = _EstimateModel;
  factory EstimateModel.fromJson(Map<String, dynamic> json) =>
      _$EstimateModelFromJson(json);
}

List<Map<String, dynamic>> getEstimateListJson(List<EstimateModel> list) {
  return list.map((e) => e.toJson()).toList();
}
