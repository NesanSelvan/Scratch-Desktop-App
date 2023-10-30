// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sewing_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SewingServiceImpl _$$SewingServiceImplFromJson(Map<String, dynamic> json) =>
    _$SewingServiceImpl(
      id: json['id'] as String,
      billNo: json['billNo'] as String,
      customerModel: json['customerModel'] == null
          ? null
          : CustomerModel.fromJson(
              json['customerModel'] as Map<String, dynamic>),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$SewingServiceImplToJson(_$SewingServiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billNo': instance.billNo,
      'customerModel': instance.customerModel?.toJson(),
      'dateTime': instance.dateTime.toIso8601String(),
    };
