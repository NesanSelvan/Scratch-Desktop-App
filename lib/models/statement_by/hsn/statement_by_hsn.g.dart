// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_by_hsn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatementByHSNImpl _$$StatementByHSNImplFromJson(Map<String, dynamic> json) =>
    _$StatementByHSNImpl(
      json['id'] as String,
      BillModel.fromJson(json['billModel'] as Map<String, dynamic>),
      CategoryModel.fromJson(json['categoryModel'] as Map<String, dynamic>),
      (json['amount'] as num).toDouble(),
      (json['tax'] as num).toDouble(),
      (json['taxableValue'] as num).toDouble(),
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$StatementByHSNImplToJson(
        _$StatementByHSNImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billModel': instance.billModel,
      'categoryModel': instance.categoryModel,
      'amount': instance.amount,
      'tax': instance.tax,
      'taxableValue': instance.taxableValue,
      'createdAt': instance.createdAt.toIso8601String(),
    };
