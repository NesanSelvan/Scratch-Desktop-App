// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VoucherModel _$$_VoucherModelFromJson(Map<String, dynamic> json) =>
    _$_VoucherModel(
      id: json['id'] as String,
      voucherNo: json['voucherNo'] as String,
      givenAmount: (json['givenAmount'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
      description: json['description'] as String,
      givenTo: EmployeeModel.fromJson(json['givenTo'] as Map<String, dynamic>),
      paymentId: json['paymentId'] as String,
      isAdvance: json['isAdvance'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_VoucherModelToJson(_$_VoucherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'voucherNo': instance.voucherNo,
      'givenAmount': instance.givenAmount,
      'paymentMethod': instance.paymentMethod,
      'description': instance.description,
      'givenTo': instance.givenTo.toJson(),
      'paymentId': instance.paymentId,
      'isAdvance': instance.isAdvance,
      'createdAt': instance.createdAt.toIso8601String(),
    };
