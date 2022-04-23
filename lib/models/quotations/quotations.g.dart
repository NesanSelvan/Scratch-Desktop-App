// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuotationModel _$$_QuotationModelFromJson(Map<String, dynamic> json) =>
    _$_QuotationModel(
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

Map<String, dynamic> _$$_QuotationModelToJson(_$_QuotationModel instance) =>
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
