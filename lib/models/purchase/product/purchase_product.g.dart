// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseProductModelImpl _$$PurchaseProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseProductModelImpl(
      id: json['id'] as String,
      categoryModel:
          CategoryModel.fromJson(json['categoryModel'] as Map<String, dynamic>),
      productModel:
          ProductModel.fromJson(json['productModel'] as Map<String, dynamic>),
      qty: (json['qty'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      lorryFright: (json['lorryFright'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      taxableValue: (json['taxableValue'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$PurchaseProductModelImplToJson(
        _$PurchaseProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryModel': instance.categoryModel.toJson(),
      'productModel': instance.productModel.toJson(),
      'qty': instance.qty,
      'rate': instance.rate,
      'amount': instance.amount,
      'discount': instance.discount,
      'lorryFright': instance.lorryFright,
      'tax': instance.tax,
      'taxableValue': instance.taxableValue,
      'totalAmount': instance.totalAmount,
    };
