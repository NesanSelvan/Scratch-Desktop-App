// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubProductModel _$$_SubProductModelFromJson(Map<String, dynamic> json) =>
    _$_SubProductModel(
      id: json['id'] as String,
      productModel:
          ProductModel.fromJson(json['productModel'] as Map<String, dynamic>),
      subProducts: (json['subProducts'] as List<dynamic>?)
              ?.map((e) =>
                  SubProductDetailsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_SubProductModelToJson(_$_SubProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productModel': instance.productModel.toJson(),
      'subProducts': instance.subProducts.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
