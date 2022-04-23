// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sewing_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SewingService _$$_SewingServiceFromJson(Map<String, dynamic> json) =>
    _$_SewingService(
      id: json['id'] as String,
      billNo: json['billNo'] as String,
      customerModel: json['customerModel'] == null
          ? null
          : CustomerModel.fromJson(
              json['customerModel'] as Map<String, dynamic>,
            ),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$_SewingServiceToJson(_$_SewingService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billNo': instance.billNo,
      'customerModel': instance.customerModel?.toJson(),
      'dateTime': instance.dateTime.toIso8601String(),
    };
