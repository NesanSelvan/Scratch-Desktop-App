// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sewing_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SewingService _$SewingServiceFromJson(Map<String, dynamic> json) {
  return _SewingService.fromJson(json);
}

/// @nodoc
mixin _$SewingService {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get billNo => throw _privateConstructorUsedError;
  set billNo(String value) => throw _privateConstructorUsedError;
  CustomerModel? get customerModel => throw _privateConstructorUsedError;
  set customerModel(CustomerModel? value) => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  set dateTime(DateTime value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SewingServiceCopyWith<SewingService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SewingServiceCopyWith<$Res> {
  factory $SewingServiceCopyWith(
          SewingService value, $Res Function(SewingService) then) =
      _$SewingServiceCopyWithImpl<$Res, SewingService>;
  @useResult
  $Res call(
      {String id,
      String billNo,
      CustomerModel? customerModel,
      DateTime dateTime});

  $CustomerModelCopyWith<$Res>? get customerModel;
}

/// @nodoc
class _$SewingServiceCopyWithImpl<$Res, $Val extends SewingService>
    implements $SewingServiceCopyWith<$Res> {
  _$SewingServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billNo = null,
    Object? customerModel = freezed,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: null == billNo
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String,
      customerModel: freezed == customerModel
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerModelCopyWith<$Res>? get customerModel {
    if (_value.customerModel == null) {
      return null;
    }

    return $CustomerModelCopyWith<$Res>(_value.customerModel!, (value) {
      return _then(_value.copyWith(customerModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SewingServiceImplCopyWith<$Res>
    implements $SewingServiceCopyWith<$Res> {
  factory _$$SewingServiceImplCopyWith(
          _$SewingServiceImpl value, $Res Function(_$SewingServiceImpl) then) =
      __$$SewingServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String billNo,
      CustomerModel? customerModel,
      DateTime dateTime});

  @override
  $CustomerModelCopyWith<$Res>? get customerModel;
}

/// @nodoc
class __$$SewingServiceImplCopyWithImpl<$Res>
    extends _$SewingServiceCopyWithImpl<$Res, _$SewingServiceImpl>
    implements _$$SewingServiceImplCopyWith<$Res> {
  __$$SewingServiceImplCopyWithImpl(
      _$SewingServiceImpl _value, $Res Function(_$SewingServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billNo = null,
    Object? customerModel = freezed,
    Object? dateTime = null,
  }) {
    return _then(_$SewingServiceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: null == billNo
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String,
      customerModel: freezed == customerModel
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SewingServiceImpl implements _SewingService {
  _$SewingServiceImpl(
      {required this.id,
      required this.billNo,
      required this.customerModel,
      required this.dateTime});

  factory _$SewingServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SewingServiceImplFromJson(json);

  @override
  String id;
  @override
  String billNo;
  @override
  CustomerModel? customerModel;
  @override
  DateTime dateTime;

  @override
  String toString() {
    return 'SewingService(id: $id, billNo: $billNo, customerModel: $customerModel, dateTime: $dateTime)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SewingServiceImplCopyWith<_$SewingServiceImpl> get copyWith =>
      __$$SewingServiceImplCopyWithImpl<_$SewingServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SewingServiceImplToJson(
      this,
    );
  }
}

abstract class _SewingService implements SewingService {
  factory _SewingService(
      {required String id,
      required String billNo,
      required CustomerModel? customerModel,
      required DateTime dateTime}) = _$SewingServiceImpl;

  factory _SewingService.fromJson(Map<String, dynamic> json) =
      _$SewingServiceImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get billNo;
  set billNo(String value);
  @override
  CustomerModel? get customerModel;
  set customerModel(CustomerModel? value);
  @override
  DateTime get dateTime;
  set dateTime(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$SewingServiceImplCopyWith<_$SewingServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
