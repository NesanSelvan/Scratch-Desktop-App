// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptModelImpl _$$ReceiptModelImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptModelImpl(
      id: json['id'] as String,
      receiptNo: json['receiptNo'] as String,
      billNo: json['billNo'] as String?,
      givenAmount: (json['givenAmount'] as num).toDouble(),
      pendingAmount: (json['pendingAmount'] as num).toDouble(),
      advanceAmount: (json['advanceAmount'] as num?)?.toDouble() ?? 0,
      paymentMethod: json['paymentMethod'] as String,
      receivedFrom: json['receivedFrom'] as String?,
      paymentFor: json['paymentFor'] as String?,
      customerModel:
          CustomerModel.fromJson(json['customerModel'] as Map<String, dynamic>),
      paymentId: json['paymentId'] as String,
      isAdvance: json['isAdvance'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ReceiptModelImplToJson(_$ReceiptModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receiptNo': instance.receiptNo,
      'billNo': instance.billNo,
      'givenAmount': instance.givenAmount,
      'pendingAmount': instance.pendingAmount,
      'advanceAmount': instance.advanceAmount,
      'paymentMethod': instance.paymentMethod,
      'receivedFrom': instance.receivedFrom,
      'paymentFor': instance.paymentFor,
      'customerModel': instance.customerModel.toJson(),
      'paymentId': instance.paymentId,
      'isAdvance': instance.isAdvance,
      'createdAt': instance.createdAt.toIso8601String(),
    };
