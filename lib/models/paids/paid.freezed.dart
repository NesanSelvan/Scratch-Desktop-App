// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaidModel _$PaidModelFromJson(Map<String, dynamic> json) {
  return _PaidModel.fromJson(json);
}

/// @nodoc
class _$PaidModelTearOff {
  const _$PaidModelTearOff();

  _PaidModel call(String id, String billId) {
    return _PaidModel(
      id,
      billId,
    );
  }

  PaidModel fromJson(Map<String, Object?> json) {
    return PaidModel.fromJson(json);
  }
}

/// @nodoc
const $PaidModel = _$PaidModelTearOff();

/// @nodoc
mixin _$PaidModel {
  String get id => throw _privateConstructorUsedError;
  String get billId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaidModelCopyWith<PaidModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaidModelCopyWith<$Res> {
  factory $PaidModelCopyWith(PaidModel value, $Res Function(PaidModel) then) =
      _$PaidModelCopyWithImpl<$Res>;
  $Res call({String id, String billId});
}

/// @nodoc
class _$PaidModelCopyWithImpl<$Res> implements $PaidModelCopyWith<$Res> {
  _$PaidModelCopyWithImpl(this._value, this._then);

  final PaidModel _value;
  // ignore: unused_field
  final $Res Function(PaidModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? billId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billId: billId == freezed
          ? _value.billId
          : billId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PaidModelCopyWith<$Res> implements $PaidModelCopyWith<$Res> {
  factory _$PaidModelCopyWith(
          _PaidModel value, $Res Function(_PaidModel) then) =
      __$PaidModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String billId});
}

/// @nodoc
class __$PaidModelCopyWithImpl<$Res> extends _$PaidModelCopyWithImpl<$Res>
    implements _$PaidModelCopyWith<$Res> {
  __$PaidModelCopyWithImpl(_PaidModel _value, $Res Function(_PaidModel) _then)
      : super(_value, (v) => _then(v as _PaidModel));

  @override
  _PaidModel get _value => super._value as _PaidModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? billId = freezed,
  }) {
    return _then(_PaidModel(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billId == freezed
          ? _value.billId
          : billId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaidModel implements _PaidModel {
  const _$_PaidModel(this.id, this.billId);

  factory _$_PaidModel.fromJson(Map<String, dynamic> json) =>
      _$$_PaidModelFromJson(json);

  @override
  final String id;
  @override
  final String billId;

  @override
  String toString() {
    return 'PaidModel(id: $id, billId: $billId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaidModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.billId, billId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(billId));

  @JsonKey(ignore: true)
  @override
  _$PaidModelCopyWith<_PaidModel> get copyWith =>
      __$PaidModelCopyWithImpl<_PaidModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaidModelToJson(this);
  }
}

abstract class _PaidModel implements PaidModel {
  const factory _PaidModel(String id, String billId) = _$_PaidModel;

  factory _PaidModel.fromJson(Map<String, dynamic> json) =
      _$_PaidModel.fromJson;

  @override
  String get id;
  @override
  String get billId;
  @override
  @JsonKey(ignore: true)
  _$PaidModelCopyWith<_PaidModel> get copyWith =>
      throw _privateConstructorUsedError;
}
