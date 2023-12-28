import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/purchase/product/purchase_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase.freezed.dart';
part 'purchase.g.dart';

@unfreezed
class PurchaseModel with _$PurchaseModel {
  @JsonSerializable(explicitToJson: true)
  factory PurchaseModel({
    required String id,
    required String billNo,
    required CompanyModel companyModel,
    required bool? isNormalPurchaseBill,
    required double? lorryFright,
    required double? lorryFrightTax,
    required double? lorryFrightTotal,
    required double? overallDiscount,
    required List<PurchaseProductModel> productList,
    @Default([]) List<String> paymentsIdList,
    @Default(true) bool isTax,
    required double grandTotal,
    double? forwardingSales,
    @Default(0) double forwardingSalesPercentage,
    required DateTime dateTime,
    String? note,
    List<String>? imagesPathList,
    double? tcsSales,
    required DateTime createdAt,
  }) = _PurchaseModel;
  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);
}

List<Map<String, dynamic>> getPurchaseListJson(List<PurchaseModel> list) {
  return list.map((e) => e.toJson()).toList();
}
