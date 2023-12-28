// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaidModel _$PaidModelFromJson(Map<String, dynamic> json) {
  return _PaidModel.fromJson(json);
}

/// @nodoc
mixin _$PaidModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get billId => throw _privateConstructorUsedError;
  set billId(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaidModelCopyWith<PaidModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaidModelCopyWith<$Res> {
  factory $PaidModelCopyWith(PaidModel value, $Res Function(PaidModel) then) =
      _$PaidModelCopyWithImpl<$Res, PaidModel>;
  @useResult
  $Res call({String id, String billId});
}

/// @nodoc
class _$PaidModelCopyWithImpl<$Res, $Val extends PaidModel>
    implements $PaidModelCopyWith<$Res> {
  _$PaidModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billId: null == billId
          ? _value.billId
          : billId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaidModelImplCopyWith<$Res>
    implements $PaidModelCopyWith<$Res> {
  factory _$$PaidModelImplCopyWith(
          _$PaidModelImpl value, $Res Function(_$PaidModelImpl) then) =
      __$$PaidModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String billId});
}

/// @nodoc
class __$$PaidModelImplCopyWithImpl<$Res>
    extends _$PaidModelCopyWithImpl<$Res, _$PaidModelImpl>
    implements _$$PaidModelImplCopyWith<$Res> {
  __$$PaidModelImplCopyWithImpl(
      _$PaidModelImpl _value, $Res Function(_$PaidModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billId = null,
  }) {
    return _then(_$PaidModelImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == billId
          ? _value.billId
          : billId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaidModelImpl implements _PaidModel {
  _$PaidModelImpl(this.id, this.billId);

  factory _$PaidModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaidModelImplFromJson(json);

  @override
  String id;
  @override
  String billId;

  @override
  String toString() {
    return 'PaidModel(id: $id, billId: $billId)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaidModelImplCopyWith<_$PaidModelImpl> get copyWith =>
      __$$PaidModelImplCopyWithImpl<_$PaidModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaidModelImplToJson(
      this,
    );
  }
}

abstract class _PaidModel implements PaidModel {
  factory _PaidModel(String id, String billId) = _$PaidModelImpl;

  factory _PaidModel.fromJson(Map<String, dynamic> json) =
      _$PaidModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get billId;
  set billId(String value);
  @override
  @JsonKey(ignore: true)
  _$$PaidModelImplCopyWith<_$PaidModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
