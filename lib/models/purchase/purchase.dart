import 'package:freezed_annotation/freezed_annotation.dart';

import '../company/company.dart';
import 'product/purchase_product.dart';

part 'purchase.freezed.dart';
part 'purchase.g.dart';

@freezed
class PurchaseModel with _$PurchaseModel {
  @JsonSerializable(explicitToJson: true)
  factory PurchaseModel(
      {required String id,
      required String billNo,
      required CompanyModel companyModel,
      required bool? isNormalPurchaseBill,
      required double? lorryFright,
      required double? lorryFrightTax,
      required double? lorryFrightTotal,
      required List<PurchaseProductModel> productList,
      @Default([]) List<String> paymentsIdList,
      @Default(true) bool isTax,
      required double grandTotal,
      double? forwardingSales,
      required DateTime dateTime,
      String? note,
      List<String>? imagesPathList,
      required DateTime createdAt}) = _PurchaseModel;
  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);
}

List<Map<String, dynamic>> getPurchaseListJson(List<PurchaseModel> list) {
  return list.map((e) => e.toJson()).toList();
}
