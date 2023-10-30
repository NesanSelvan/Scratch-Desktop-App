// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockModelImpl _$$StockModelImplFromJson(Map<String, dynamic> json) =>
    _$StockModelImpl(
      json['id'] as String,
      json['productId'] as String,
      json['productCode'] as String,
      (json['qty'] as num).toDouble(),
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$StockModelImplToJson(_$StockModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'productCode': instance.productCode,
      'qty': instance.qty,
      'createdAt': instance.createdAt.toIso8601String(),
    };
