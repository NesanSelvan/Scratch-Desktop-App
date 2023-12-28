import 'package:equatable/equatable.dart';
import 'package:validators/validators.dart';

import '../../category/category.dart';
import '../../price/price.dart';
import '../../product/product.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'sales_product.freezed.dart';
// part 'sales_product.g.dart';

// @unfreezed
// abstract class SalesProductModel with _$SalesProductModel {
//   factory SalesProductModel(
//     CategoryModel categoryModel,
//     ProductModel productModel,
//     int qty,
//     double price,
//     double discountPer,
//   ) = _SalesProductModel;
//   factory SalesProductModel.fromJson(Map<String, dynamic> json) =>
//       _$SalesProductModelFromJson(json);
// }

class SalesProductModel extends Equatable {
  CategoryModel? categoryModel;
  ProductModel? productModel;
  double? rate;
  double? qty;
  double? price;
  double? discountPer;
  PriceModel? priceModel;
  String? qtyMathEqn;
  SalesProductModel({
    this.categoryModel,
    this.discountPer,
    this.rate,
    this.price,
    this.productModel,
    this.priceModel,
    this.qty,
    required this.qtyMathEqn,
  });
  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['categoryModel'] = categoryModel!.toJson();
    json['productModel'] = productModel!.toJson();
    json['qty'] = qty;
    json['rate'] = rate;
    json['price'] = price;
    json['discountPer'] = discountPer;
    json['qtyMathEqn'] = qtyMathEqn;
    json['priceModel'] = priceModel?.toJson();
    return json;
  }

  SalesProductModel.fromJson(Map<String, dynamic> json) {
    categoryModel =
        CategoryModel.fromJson(json['categoryModel'] as Map<String, dynamic>);
    productModel =
        ProductModel.fromJson(json['productModel'] as Map<String, dynamic>);
    if (json.containsKey("priceModel")) {
      if (json['priceModel'] != null) {
        priceModel =
            PriceModel.fromJson(json['priceModel'] as Map<String, dynamic>);
      }
    }
    qty = validateDoubleData("${json['qty']}");
    if (json.containsKey("rate")) {
      rate = validateDoubleData("${json['rate']}");
    }
    price = validateDoubleData("${json['price']}");
    discountPer = validateDoubleData("${json['discountPer']}");
    qtyMathEqn = json["qtyMathEqn"] as String?;
  }

  @override
  List<Object?> get props => [
        productModel,
        qtyMathEqn,
        qty,
        rate,
      ];
}
