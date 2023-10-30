// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'borrow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BorrowModel _$BorrowModelFromJson(Map<String, dynamic> json) {
  return _BorrowModel.fromJson(json);
}

/// @nodoc
mixin _$BorrowModel {
  String get id => throw _privateConstructorUsedError;
  String get billId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BorrowModelCopyWith<BorrowModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BorrowModelCopyWith<$Res> {
  factory $BorrowModelCopyWith(
          BorrowModel value, $Res Function(BorrowModel) then) =
      _$BorrowModelCopyWithImpl<$Res, BorrowModel>;
  @useResult
  $Res call({String id, String billId});
}

/// @nodoc
class _$BorrowModelCopyWithImpl<$Res, $Val extends BorrowModel>
    implements $BorrowModelCopyWith<$Res> {
  _$BorrowModelCopyWithImpl(this._value, this._then);

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
abstract class _$$BorrowModelImplCopyWith<$Res>
    implements $BorrowModelCopyWith<$Res> {
  factory _$$BorrowModelImplCopyWith(
          _$BorrowModelImpl value, $Res Function(_$BorrowModelImpl) then) =
      __$$BorrowModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String billId});
}

/// @nodoc
class __$$BorrowModelImplCopyWithImpl<$Res>
    extends _$BorrowModelCopyWithImpl<$Res, _$BorrowModelImpl>
    implements _$$BorrowModelImplCopyWith<$Res> {
  __$$BorrowModelImplCopyWithImpl(
      _$BorrowModelImpl _value, $Res Function(_$BorrowModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billId = null,
  }) {
    return _then(_$BorrowModelImpl(
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
class _$BorrowModelImpl implements _BorrowModel {
  const _$BorrowModelImpl(this.id, this.billId);

  factory _$BorrowModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BorrowModelImplFromJson(json);

  @override
  final String id;
  @override
  final String billId;

  @override
  String toString() {
    return 'BorrowModel(id: $id, billId: $billId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BorrowModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.billId, billId) || other.billId == billId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, billId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BorrowModelImplCopyWith<_$BorrowModelImpl> get copyWith =>
      __$$BorrowModelImplCopyWithImpl<_$BorrowModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BorrowModelImplToJson(
      this,
    );
  }
}

abstract class _BorrowModel implements BorrowModel {
  const factory _BorrowModel(final String id, final String billId) =
      _$BorrowModelImpl;

  factory _BorrowModel.fromJson(Map<String, dynamic> json) =
      _$BorrowModelImpl.fromJson;

  @override
  String get id;
  @override
  String get billId;
  @override
  @JsonKey(ignore: true)
  _$$BorrowModelImplCopyWith<_$BorrowModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
