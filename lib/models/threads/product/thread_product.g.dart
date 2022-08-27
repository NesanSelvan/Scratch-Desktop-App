// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ThreadProductModel _$$_ThreadProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_ThreadProductModel(
      id: json['id'] as String,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      threads: (json['threads'] as List<dynamic>?)
              ?.map((e) => ThreadsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_ThreadProductModelToJson(
        _$_ThreadProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product.toJson(),
      'threads': instance.threads.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
