import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  @JsonSerializable(explicitToJson: true)
  const factory OrderModel({
    @JsonKey(name: "id") required String id,
    required String orderNo,
    @Default(true) bool isTax,
    required double price,
    required List<SalesProductModel> productList,
    required CustomerModel customerModel,
    required DateTime dateTime,
    String? note,
    required DateTime createdAt,
  }) = _OrderModel;
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

List<Map<String, dynamic>> getOrderListJson(List<OrderModel> list) {
  return list.map((e) => e.toJson()).toList();
}
