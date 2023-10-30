// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThreadProductModelImpl _$$ThreadProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ThreadProductModelImpl(
      id: json['id'] as String,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      threads: (json['threads'] as List<dynamic>?)
              ?.map((e) => ThreadsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ThreadProductModelImplToJson(
        _$ThreadProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product.toJson(),
      'threads': instance.threads.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
