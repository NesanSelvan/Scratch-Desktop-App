// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubProductDetailsModel _$$_SubProductDetailsModelFromJson(
        Map<String, dynamic> json) =>
    _$_SubProductDetailsModel(
      id: json['id'] as String,
      productNumber: json['productNumber'] as String,
      name: json['name'] as String? ?? "",
      stock: json['stock'] as int,
      imagesList: (json['imagesList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_SubProductDetailsModelToJson(
        _$_SubProductDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productNumber': instance.productNumber,
      'name': instance.name,
      'stock': instance.stock,
      'imagesList': instance.imagesList,
      'createdAt': instance.createdAt.toIso8601String(),
    };
