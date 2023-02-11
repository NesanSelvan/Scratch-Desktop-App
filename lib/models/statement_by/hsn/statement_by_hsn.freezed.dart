// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'statement_by_hsn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatementByHSN _$StatementByHSNFromJson(Map<String, dynamic> json) {
  return _StatementByHSN.fromJson(json);
}

/// @nodoc
class _$StatementByHSNTearOff {
  const _$StatementByHSNTearOff();

  _StatementByHSN call(
      String id,
      BillModel billModel,
      CategoryModel categoryModel,
      double amount,
      double tax,
      double taxableValue,
      DateTime createdAt) {
    return _StatementByHSN(
      id,
      billModel,
      categoryModel,
      amount,
      tax,
      taxableValue,
      createdAt,
    );
  }

  StatementByHSN fromJson(Map<String, Object?> json) {
    return StatementByHSN.fromJson(json);
  }
}

/// @nodoc
const $StatementByHSN = _$StatementByHSNTearOff();

/// @nodoc
mixin _$StatementByHSN {
  String get id => throw _privateConstructorUsedError;
  BillModel get billModel => throw _privateConstructorUsedError;
  CategoryModel get categoryModel => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get taxableValue => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatementByHSNCopyWith<StatementByHSN> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementByHSNCopyWith<$Res> {
  factory $StatementByHSNCopyWith(
          StatementByHSN value, $Res Function(StatementByHSN) then) =
      _$StatementByHSNCopyWithImpl<$Res>;
  $Res call(
      {String id,
      BillModel billModel,
      CategoryModel categoryModel,
      double amount,
      double tax,
      double taxableValue,
      DateTime createdAt});

  $BillModelCopyWith<$Res> get billModel;
  $CategoryModelCopyWith<$Res> get categoryModel;
}

/// @nodoc
class _$StatementByHSNCopyWithImpl<$Res>
    implements $StatementByHSNCopyWith<$Res> {
  _$StatementByHSNCopyWithImpl(this._value, this._then);

  final StatementByHSN _value;
  // ignore: unused_field
  final $Res Function(StatementByHSN) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? billModel = freezed,
    Object? categoryModel = freezed,
    Object? amount = freezed,
    Object? tax = freezed,
    Object? taxableValue = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billModel: billModel == freezed
          ? _value.billModel
          : billModel // ignore: cast_nullable_to_non_nullable
              as BillModel,
      categoryModel: categoryModel == freezed
          ? _value.categoryModel
          : categoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      taxableValue: taxableValue == freezed
          ? _value.taxableValue
          : taxableValue // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $BillModelCopyWith<$Res> get billModel {
    return $BillModelCopyWith<$Res>(_value.billModel, (value) {
      return _then(_value.copyWith(billModel: value));
    });
  }

  @override
  $CategoryModelCopyWith<$Res> get categoryModel {
    return $CategoryModelCopyWith<$Res>(_value.categoryModel, (value) {
      return _then(_value.copyWith(categoryModel: value));
    });
  }
}

/// @nodoc
abstract class _$StatementByHSNCopyWith<$Res>
    implements $StatementByHSNCopyWith<$Res> {
  factory _$StatementByHSNCopyWith(
          _StatementByHSN value, $Res Function(_StatementByHSN) then) =
      __$StatementByHSNCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      BillModel billModel,
      CategoryModel categoryModel,
      double amount,
      double tax,
      double taxableValue,
      DateTime createdAt});

  @override
  $BillModelCopyWith<$Res> get billModel;
  @override
  $CategoryModelCopyWith<$Res> get categoryModel;
}

/// @nodoc
class __$StatementByHSNCopyWithImpl<$Res>
    extends _$StatementByHSNCopyWithImpl<$Res>
    implements _$StatementByHSNCopyWith<$Res> {
  __$StatementByHSNCopyWithImpl(
      _StatementByHSN _value, $Res Function(_StatementByHSN) _then)
      : super(_value, (v) => _then(v as _StatementByHSN));

  @override
  _StatementByHSN get _value => super._value as _StatementByHSN;

  @override
  $Res call({
    Object? id = freezed,
    Object? billModel = freezed,
    Object? categoryModel = freezed,
    Object? amount = freezed,
    Object? tax = freezed,
    Object? taxableValue = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_StatementByHSN(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billModel == freezed
          ? _value.billModel
          : billModel // ignore: cast_nullable_to_non_nullable
              as BillModel,
      categoryModel == freezed
          ? _value.categoryModel
          : categoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      taxableValue == freezed
          ? _value.taxableValue
          : taxableValue // ignore: cast_nullable_to_non_nullable
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
class _$_StatementByHSN implements _StatementByHSN {
  const _$_StatementByHSN(this.id, this.billModel, this.categoryModel,
      this.amount, this.tax, this.taxableValue, this.createdAt);

  factory _$_StatementByHSN.fromJson(Map<String, dynamic> json) =>
      _$$_StatementByHSNFromJson(json);

  @override
  final String id;
  @override
  final BillModel billModel;
  @override
  final CategoryModel categoryModel;
  @override
  final double amount;
  @override
  final double tax;
  @override
  final double taxableValue;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'StatementByHSN(id: $id, billModel: $billModel, categoryModel: $categoryModel, amount: $amount, tax: $tax, taxableValue: $taxableValue, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatementByHSN &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.billModel, billModel) &&
            const DeepCollectionEquality()
                .equals(other.categoryModel, categoryModel) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.tax, tax) &&
            const DeepCollectionEquality()
                .equals(other.taxableValue, taxableValue) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(billModel),
      const DeepCollectionEquality().hash(categoryModel),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(tax),
      const DeepCollectionEquality().hash(taxableValue),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$StatementByHSNCopyWith<_StatementByHSN> get copyWith =>
      __$StatementByHSNCopyWithImpl<_StatementByHSN>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatementByHSNToJson(this);
  }
}

abstract class _StatementByHSN implements StatementByHSN {
  const factory _StatementByHSN(
      String id,
      BillModel billModel,
      CategoryModel categoryModel,
      double amount,
      double tax,
      double taxableValue,
      DateTime createdAt) = _$_StatementByHSN;

  factory _StatementByHSN.fromJson(Map<String, dynamic> json) =
      _$_StatementByHSN.fromJson;

  @override
  String get id;
  @override
  BillModel get billModel;
  @override
  CategoryModel get categoryModel;
  @override
  double get amount;
  @override
  double get tax;
  @override
  double get taxableValue;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$StatementByHSNCopyWith<_StatementByHSN> get copyWith =>
      throw _privateConstructorUsedError;
}
