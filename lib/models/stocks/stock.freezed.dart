// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StockModel _$StockModelFromJson(Map<String, dynamic> json) {
  return _StockModel.fromJson(json);
}

/// @nodoc
class _$StockModelTearOff {
  const _$StockModelTearOff();

  _StockModel call(String id, String productId, String productCode, double qty,
      DateTime createdAt) {
    return _StockModel(
      id,
      productId,
      productCode,
      qty,
      createdAt,
    );
  }

  StockModel fromJson(Map<String, Object?> json) {
    return StockModel.fromJson(json);
  }
}

/// @nodoc
const $StockModel = _$StockModelTearOff();

/// @nodoc
mixin _$StockModel {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get productCode => throw _privateConstructorUsedError;
  double get qty => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockModelCopyWith<StockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockModelCopyWith<$Res> {
  factory $StockModelCopyWith(
          StockModel value, $Res Function(StockModel) then) =
      _$StockModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String productId,
      String productCode,
      double qty,
      DateTime createdAt});
}

/// @nodoc
class _$StockModelCopyWithImpl<$Res> implements $StockModelCopyWith<$Res> {
  _$StockModelCopyWithImpl(this._value, this._then);

  final StockModel _value;
  // ignore: unused_field
  final $Res Function(StockModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? productCode = freezed,
    Object? qty = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productCode: productCode == freezed
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$StockModelCopyWith<$Res> implements $StockModelCopyWith<$Res> {
  factory _$StockModelCopyWith(
          _StockModel value, $Res Function(_StockModel) then) =
      __$StockModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String productId,
      String productCode,
      double qty,
      DateTime createdAt});
}

/// @nodoc
class __$StockModelCopyWithImpl<$Res> extends _$StockModelCopyWithImpl<$Res>
    implements _$StockModelCopyWith<$Res> {
  __$StockModelCopyWithImpl(
      _StockModel _value, $Res Function(_StockModel) _then)
      : super(_value, (v) => _then(v as _StockModel));

  @override
  _StockModel get _value => super._value as _StockModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? productCode = freezed,
    Object? qty = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_StockModel(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productCode == freezed
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String,
      qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StockModel implements _StockModel {
  const _$_StockModel(
      this.id, this.productId, this.productCode, this.qty, this.createdAt);

  factory _$_StockModel.fromJson(Map<String, dynamic> json) =>
      _$$_StockModelFromJson(json);

  @override
  final String id;
  @override
  final String productId;
  @override
  final String productCode;
  @override
  final double qty;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'StockModel(id: $id, productId: $productId, productCode: $productCode, qty: $qty, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StockModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.productId, productId) &&
            const DeepCollectionEquality()
                .equals(other.productCode, productCode) &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(productId),
      const DeepCollectionEquality().hash(productCode),
      const DeepCollectionEquality().hash(qty),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$StockModelCopyWith<_StockModel> get copyWith =>
      __$StockModelCopyWithImpl<_StockModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StockModelToJson(this);
  }
}

abstract class _StockModel implements StockModel {
  const factory _StockModel(String id, String productId, String productCode,
      double qty, DateTime createdAt) = _$_StockModel;

  factory _StockModel.fromJson(Map<String, dynamic> json) =
      _$_StockModel.fromJson;

  @override
  String get id;
  @override
  String get productId;
  @override
  String get productCode;
  @override
  double get qty;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$StockModelCopyWith<_StockModel> get copyWith =>
      throw _privateConstructorUsedError;
}
