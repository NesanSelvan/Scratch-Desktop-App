// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sewing_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SewingService _$SewingServiceFromJson(Map<String, dynamic> json) {
  return _SewingService.fromJson(json);
}

/// @nodoc
class _$SewingServiceTearOff {
  const _$SewingServiceTearOff();

  _SewingService call(
      {required String id,
      required String billNo,
      required CustomerModel? customerModel,
      required DateTime dateTime}) {
    return _SewingService(
      id: id,
      billNo: billNo,
      customerModel: customerModel,
      dateTime: dateTime,
    );
  }

  SewingService fromJson(Map<String, Object?> json) {
    return SewingService.fromJson(json);
  }
}

/// @nodoc
const $SewingService = _$SewingServiceTearOff();

/// @nodoc
mixin _$SewingService {
  String get id => throw _privateConstructorUsedError;
  String get billNo => throw _privateConstructorUsedError;
  CustomerModel? get customerModel => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SewingServiceCopyWith<SewingService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SewingServiceCopyWith<$Res> {
  factory $SewingServiceCopyWith(
          SewingService value, $Res Function(SewingService) then) =
      _$SewingServiceCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String billNo,
      CustomerModel? customerModel,
      DateTime dateTime});

  $CustomerModelCopyWith<$Res>? get customerModel;
}

/// @nodoc
class _$SewingServiceCopyWithImpl<$Res>
    implements $SewingServiceCopyWith<$Res> {
  _$SewingServiceCopyWithImpl(this._value, this._then);

  final SewingService _value;
  // ignore: unused_field
  final $Res Function(SewingService) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? billNo = freezed,
    Object? customerModel = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: billNo == freezed
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String,
      customerModel: customerModel == freezed
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $CustomerModelCopyWith<$Res>? get customerModel {
    if (_value.customerModel == null) {
      return null;
    }

    return $CustomerModelCopyWith<$Res>(_value.customerModel!, (value) {
      return _then(_value.copyWith(customerModel: value));
    });
  }
}

/// @nodoc
abstract class _$SewingServiceCopyWith<$Res>
    implements $SewingServiceCopyWith<$Res> {
  factory _$SewingServiceCopyWith(
          _SewingService value, $Res Function(_SewingService) then) =
      __$SewingServiceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String billNo,
      CustomerModel? customerModel,
      DateTime dateTime});

  @override
  $CustomerModelCopyWith<$Res>? get customerModel;
}

/// @nodoc
class __$SewingServiceCopyWithImpl<$Res>
    extends _$SewingServiceCopyWithImpl<$Res>
    implements _$SewingServiceCopyWith<$Res> {
  __$SewingServiceCopyWithImpl(
      _SewingService _value, $Res Function(_SewingService) _then)
      : super(_value, (v) => _then(v as _SewingService));

  @override
  _SewingService get _value => super._value as _SewingService;

  @override
  $Res call({
    Object? id = freezed,
    Object? billNo = freezed,
    Object? customerModel = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_SewingService(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: billNo == freezed
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String,
      customerModel: customerModel == freezed
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SewingService implements _SewingService {
  const _$_SewingService(
      {required this.id,
      required this.billNo,
      required this.customerModel,
      required this.dateTime});

  factory _$_SewingService.fromJson(Map<String, dynamic> json) =>
      _$$_SewingServiceFromJson(json);

  @override
  final String id;
  @override
  final String billNo;
  @override
  final CustomerModel? customerModel;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'SewingService(id: $id, billNo: $billNo, customerModel: $customerModel, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SewingService &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.billNo, billNo) &&
            const DeepCollectionEquality()
                .equals(other.customerModel, customerModel) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(billNo),
      const DeepCollectionEquality().hash(customerModel),
      const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$SewingServiceCopyWith<_SewingService> get copyWith =>
      __$SewingServiceCopyWithImpl<_SewingService>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SewingServiceToJson(this);
  }
}

abstract class _SewingService implements SewingService {
  const factory _SewingService(
      {required String id,
      required String billNo,
      required CustomerModel? customerModel,
      required DateTime dateTime}) = _$_SewingService;

  factory _SewingService.fromJson(Map<String, dynamic> json) =
      _$_SewingService.fromJson;

  @override
  String get id;
  @override
  String get billNo;
  @override
  CustomerModel? get customerModel;
  @override
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$SewingServiceCopyWith<_SewingService> get copyWith =>
      throw _privateConstructorUsedError;
}
