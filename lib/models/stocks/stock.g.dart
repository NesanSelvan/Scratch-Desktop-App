// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StockModel _$$_StockModelFromJson(Map<String, dynamic> json) =>
    _$_StockModel(
      json['id'] as String,
      json['productId'] as String,
      json['productCode'] as String,
      (json['qty'] as num).toDouble(),
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_StockModelToJson(_$_StockModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'productCode': instance.productCode,
      'qty': instance.qty,
      'createdAt': instance.createdAt.toIso8601String(),
    };
