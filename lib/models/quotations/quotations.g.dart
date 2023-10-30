// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuotationModelImpl _$$QuotationModelImplFromJson(Map<String, dynamic> json) =>
    _$QuotationModelImpl(
      id: json['id'] as String,
      quotationNo: json['quotationNo'] as String,
      isTax: json['isTax'] as bool? ?? true,
      price: (json['price'] as num).toDouble(),
      productList: (json['productList'] as List<dynamic>)
          .map((e) => SalesProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerModel:
          CustomerModel.fromJson(json['customerModel'] as Map<String, dynamic>),
      dateTime: DateTime.parse(json['dateTime'] as String),
      note: json['note'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$QuotationModelImplToJson(
        _$QuotationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quotationNo': instance.quotationNo,
      'isTax': instance.isTax,
      'price': instance.price,
      'productList': instance.productList.map((e) => e.toJson()).toList(),
      'customerModel': instance.customerModel.toJson(),
      'dateTime': instance.dateTime.toIso8601String(),
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
    };
