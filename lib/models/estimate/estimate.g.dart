// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstimateModelImpl _$$EstimateModelImplFromJson(Map<String, dynamic> json) =>
    _$EstimateModelImpl(
      id: json['id'] as String,
      estimateNo: json['estimateNo'] as String,
      billId: json['billId'] as String? ?? "",
      isTax: json['isTax'] as bool? ?? true,
      price: (json['price'] as num).toDouble(),
      productList: (json['productList'] as List<dynamic>)
          .map((e) => SalesProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerModel:
          CustomerModel.fromJson(json['customerModel'] as Map<String, dynamic>),
      dateTime: DateTime.parse(json['dateTime'] as String),
      givenAmount: (json['givenAmount'] as num?)?.toDouble() ?? 0,
      note: json['note'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$EstimateModelImplToJson(_$EstimateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estimateNo': instance.estimateNo,
      'billId': instance.billId,
      'isTax': instance.isTax,
      'price': instance.price,
      'productList': instance.productList.map((e) => e.toJson()).toList(),
      'customerModel': instance.customerModel.toJson(),
      'dateTime': instance.dateTime.toIso8601String(),
      'givenAmount': instance.givenAmount,
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
    };
