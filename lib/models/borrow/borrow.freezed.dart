// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'borrow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BorrowModel _$BorrowModelFromJson(Map<String, dynamic> json) {
  return _BorrowModel.fromJson(json);
}

/// @nodoc
class _$BorrowModelTearOff {
  const _$BorrowModelTearOff();

  _BorrowModel call(String id, String billId) {
    return _BorrowModel(
      id,
      billId,
    );
  }

  BorrowModel fromJson(Map<String, Object?> json) {
    return BorrowModel.fromJson(json);
  }
}

/// @nodoc
const $BorrowModel = _$BorrowModelTearOff();

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
      _$BorrowModelCopyWithImpl<$Res>;
  $Res call({String id, String billId});
}

/// @nodoc
class _$BorrowModelCopyWithImpl<$Res> implements $BorrowModelCopyWith<$Res> {
  _$BorrowModelCopyWithImpl(this._value, this._then);

  final BorrowModel _value;
  // ignore: unused_field
  final $Res Function(BorrowModel) _then;

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
abstract class _$BorrowModelCopyWith<$Res>
    implements $BorrowModelCopyWith<$Res> {
  factory _$BorrowModelCopyWith(
          _BorrowModel value, $Res Function(_BorrowModel) then) =
      __$BorrowModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String billId});
}

/// @nodoc
class __$BorrowModelCopyWithImpl<$Res> extends _$BorrowModelCopyWithImpl<$Res>
    implements _$BorrowModelCopyWith<$Res> {
  __$BorrowModelCopyWithImpl(
      _BorrowModel _value, $Res Function(_BorrowModel) _then)
      : super(_value, (v) => _then(v as _BorrowModel));

  @override
  _BorrowModel get _value => super._value as _BorrowModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? billId = freezed,
  }) {
    return _then(_BorrowModel(
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
class _$_BorrowModel implements _BorrowModel {
  const _$_BorrowModel(this.id, this.billId);

  factory _$_BorrowModel.fromJson(Map<String, dynamic> json) =>
      _$$_BorrowModelFromJson(json);

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
            other is _BorrowModel &&
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
  _$BorrowModelCopyWith<_BorrowModel> get copyWith =>
      __$BorrowModelCopyWithImpl<_BorrowModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BorrowModelToJson(this);
  }
}

abstract class _BorrowModel implements BorrowModel {
  const factory _BorrowModel(String id, String billId) = _$_BorrowModel;

  factory _BorrowModel.fromJson(Map<String, dynamic> json) =
      _$_BorrowModel.fromJson;

  @override
  String get id;
  @override
  String get billId;
  @override
  @JsonKey(ignore: true)
  _$BorrowModelCopyWith<_BorrowModel> get copyWith =>
      throw _privateConstructorUsedError;
}
