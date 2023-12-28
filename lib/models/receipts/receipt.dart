import 'package:freezed_annotation/freezed_annotation.dart';

import '../customer/customer.dart';

part 'receipt.freezed.dart';
part 'receipt.g.dart';

@unfreezed
abstract class ReceiptModel with _$ReceiptModel {
  @JsonSerializable(explicitToJson: true)
  factory ReceiptModel(
      {required String id,
      required String receiptNo,
      String? billNo,
      required double givenAmount,
      required double pendingAmount,
      @Default(0) double advanceAmount,
      required String paymentMethod,
      String? receivedFrom,
      String? paymentFor,
      required CustomerModel customerModel,
      required String paymentId,
      @Default(false) bool isAdvance,
      required DateTime createdAt}) = _ReceiptModel;
  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);
}

List<Map<String, dynamic>> getReceiptListJson(List<ReceiptModel> list) {
  return list.map((e) => e.toJson()).toList();
}
