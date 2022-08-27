// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_cal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaxCalModel _$$_TaxCalModelFromJson(Map<String, dynamic> json) =>
    _$_TaxCalModel(
      hsnCode: json['hsnCode'] as int,
      taxableVal: (json['taxableVal'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
      totalTaxAmount: (json['totalTaxAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$_TaxCalModelToJson(_$_TaxCalModel instance) =>
    <String, dynamic>{
      'hsnCode': instance.hsnCode,
      'taxableVal': instance.taxableVal,
      'tax': instance.tax,
      'amount': instance.amount,
      'rate': instance.rate,
      'totalTaxAmount': instance.totalTaxAmount,
    };
