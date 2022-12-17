// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentModel _$$_PaymentModelFromJson(Map<String, dynamic> json) =>
    _$_PaymentModel(
      id: json['id'] as String,
      paymentNo: json['paymentNo'] as String,
      purchaseId: json['purchaseId'] as String,
      givenAmount: (json['givenAmount'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
      paymentID: json['paymentID'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      purchaseModel: json['purchaseModel'] == null
          ? null
          : PurchaseModel.fromJson(
              json['purchaseModel'] as Map<String, dynamic>),
      companyModel: json['companyModel'] == null
          ? null
          : CompanyModel.fromJson(json['companyModel'] as Map<String, dynamic>),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_PaymentModelToJson(_$_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentNo': instance.paymentNo,
      'purchaseId': instance.purchaseId,
      'givenAmount': instance.givenAmount,
      'paymentMethod': instance.paymentMethod,
      'paymentID': instance.paymentID,
      'createdAt': instance.createdAt.toIso8601String(),
      'purchaseModel': instance.purchaseModel?.toJson(),
      'companyModel': instance.companyModel?.toJson(),
      'note': instance.note,
    };
