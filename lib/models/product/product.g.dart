// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as String,
      code: json['code'] as String,
      productNumber: json['productNumber'] as String?,
      productName: json['productName'] as String,
      categoryId: json['categoryId'] as String,
      unitId: json['unitId'] as String,
      unitQty: json['unitQty'] as int? ?? 0,
      differentPriceList: (json['differentPriceList'] as List<dynamic>?)
              ?.map((e) => PriceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      sellingPrice: (json['sellingPrice'] as num).toDouble(),
      isHidden: json['isHidden'] as bool? ?? false,
      wholesale: (json['wholesale'] as num).toDouble(),
      retail: (json['retail'] as num).toDouble(),
      isPending: json['isPending'] as bool? ?? false,
      companyId: json['companyId'] as String?,
      imagesList: (json['imagesList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'productNumber': instance.productNumber,
      'productName': instance.productName,
      'categoryId': instance.categoryId,
      'unitId': instance.unitId,
      'unitQty': instance.unitQty,
      'differentPriceList':
          instance.differentPriceList?.map((e) => e.toJson()).toList(),
      'purchasePrice': instance.purchasePrice,
      'sellingPrice': instance.sellingPrice,
      'isHidden': instance.isHidden,
      'wholesale': instance.wholesale,
      'retail': instance.retail,
      'isPending': instance.isPending,
      'companyId': instance.companyId,
      'imagesList': instance.imagesList,
      'createdAt': instance.createdAt.toIso8601String(),
    };
