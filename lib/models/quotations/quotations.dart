import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotations.freezed.dart';
part 'quotations.g.dart';

@unfreezed
class QuotationModel with _$QuotationModel {
  @JsonSerializable(explicitToJson: true)
  factory QuotationModel({
    required String id,
    required String quotationNo,
    @Default(true) bool isTax,
    required double price,
    required List<SalesProductModel> productList,
    required CustomerModel customerModel,
    required DateTime dateTime,
    String? note,
    required DateTime createdAt,
  }) = _QuotationModel;
  factory QuotationModel.fromJson(Map<String, dynamic> json) =>
      _$QuotationModelFromJson(json);
}

List<Map<String, dynamic>> getQuotationListJson(List<QuotationModel> list) {
  return list.map((e) => e.toJson()).toList();
}
