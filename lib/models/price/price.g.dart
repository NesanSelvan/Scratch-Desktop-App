// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceModelImpl _$$PriceModelImplFromJson(Map<String, dynamic> json) =>
    _$PriceModelImpl(
      id: json['id'] as String,
      code: json['code'] as String?,
      barcodeCode: json['barcodeCode'] as String?,
      unitModel: UnitModel.fromJson(json['unitModel'] as Map<String, dynamic>),
      purchasePrice: (json['purchasePrice'] as num?)?.toDouble(),
      mrp: (json['mrp'] as num).toDouble(),
      unitQty: (json['unitQty'] as num).toDouble(),
      retail: (json['retail'] as num).toDouble(),
      wholesale: (json['wholesale'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PriceModelImplToJson(_$PriceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'barcodeCode': instance.barcodeCode,
      'unitModel': instance.unitModel.toJson(),
      'purchasePrice': instance.purchasePrice,
      'mrp': instance.mrp,
      'unitQty': instance.unitQty,
      'retail': instance.retail,
      'wholesale': instance.wholesale,
      'createdAt': instance.createdAt.toIso8601String(),
    };
