import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/purchase/purchase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@unfreezed
class PaymentModel with _$PaymentModel {
  @JsonSerializable(explicitToJson: true)
  factory PaymentModel({
    required String id,
    required String paymentNo,
    required String purchaseId,
    required double givenAmount,
    required String paymentMethod,
    required String paymentID,
    required DateTime createdAt,
    PurchaseModel? purchaseModel,
    CompanyModel? companyModel,
    String? note,
  }) = _PaymentModel;
  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}

List<Map<String, dynamic>> getPaymentListJson(List<PaymentModel> list) {
  return list.map((e) => e.toJson()).toList();
}
