// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tax_cal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaxCalModel _$TaxCalModelFromJson(Map<String, dynamic> json) {
  return _TaxCalModel.fromJson(json);
}

/// @nodoc
class _$TaxCalModelTearOff {
  const _$TaxCalModelTearOff();

  _TaxCalModel call(
      {required int hsnCode,
      required double taxableVal,
      required double tax,
      required double amount,
      required double rate,
      required double totalTaxAmount}) {
    return _TaxCalModel(
      hsnCode: hsnCode,
      taxableVal: taxableVal,
      tax: tax,
      amount: amount,
      rate: rate,
      totalTaxAmount: totalTaxAmount,
    );
  }

  TaxCalModel fromJson(Map<String, Object?> json) {
    return TaxCalModel.fromJson(json);
  }
}

/// @nodoc
const $TaxCalModel = _$TaxCalModelTearOff();

/// @nodoc
mixin _$TaxCalModel {
  int get hsnCode => throw _privateConstructorUsedError;
  double get taxableVal => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  double get totalTaxAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxCalModelCopyWith<TaxCalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxCalModelCopyWith<$Res> {
  factory $TaxCalModelCopyWith(
          TaxCalModel value, $Res Function(TaxCalModel) then) =
      _$TaxCalModelCopyWithImpl<$Res>;
  $Res call(
      {int hsnCode,
      double taxableVal,
      double tax,
      double amount,
      double rate,
      double totalTaxAmount});
}

/// @nodoc
class _$TaxCalModelCopyWithImpl<$Res> implements $TaxCalModelCopyWith<$Res> {
  _$TaxCalModelCopyWithImpl(this._value, this._then);

  final TaxCalModel _value;
  // ignore: unused_field
  final $Res Function(TaxCalModel) _then;

  @override
  $Res call({
    Object? hsnCode = freezed,
    Object? taxableVal = freezed,
    Object? tax = freezed,
    Object? amount = freezed,
    Object? rate = freezed,
    Object? totalTaxAmount = freezed,
  }) {
    return _then(_value.copyWith(
      hsnCode: hsnCode == freezed
          ? _value.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as int,
      taxableVal: taxableVal == freezed
          ? _value.taxableVal
          : taxableVal // ignore: cast_nullable_to_non_nullable
              as double,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      totalTaxAmount: totalTaxAmount == freezed
          ? _value.totalTaxAmount
          : totalTaxAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$TaxCalModelCopyWith<$Res>
    implements $TaxCalModelCopyWith<$Res> {
  factory _$TaxCalModelCopyWith(
          _TaxCalModel value, $Res Function(_TaxCalModel) then) =
      __$TaxCalModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int hsnCode,
      double taxableVal,
      double tax,
      double amount,
      double rate,
      double totalTaxAmount});
}

/// @nodoc
class __$TaxCalModelCopyWithImpl<$Res> extends _$TaxCalModelCopyWithImpl<$Res>
    implements _$TaxCalModelCopyWith<$Res> {
  __$TaxCalModelCopyWithImpl(
      _TaxCalModel _value, $Res Function(_TaxCalModel) _then)
      : super(_value, (v) => _then(v as _TaxCalModel));

  @override
  _TaxCalModel get _value => super._value as _TaxCalModel;

  @override
  $Res call({
    Object? hsnCode = freezed,
    Object? taxableVal = freezed,
    Object? tax = freezed,
    Object? amount = freezed,
    Object? rate = freezed,
    Object? totalTaxAmount = freezed,
  }) {
    return _then(_TaxCalModel(
      hsnCode: hsnCode == freezed
          ? _value.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as int,
      taxableVal: taxableVal == freezed
          ? _value.taxableVal
          : taxableVal // ignore: cast_nullable_to_non_nullable
              as double,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      totalTaxAmount: totalTaxAmount == freezed
          ? _value.totalTaxAmount
          : totalTaxAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaxCalModel implements _TaxCalModel {
  _$_TaxCalModel(
      {required this.hsnCode,
      required this.taxableVal,
      required this.tax,
      required this.amount,
      required this.rate,
      required this.totalTaxAmount});

  factory _$_TaxCalModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaxCalModelFromJson(json);

  @override
  final int hsnCode;
  @override
  final double taxableVal;
  @override
  final double tax;
  @override
  final double amount;
  @override
  final double rate;
  @override
  final double totalTaxAmount;

  @override
  String toString() {
    return 'TaxCalModel(hsnCode: $hsnCode, taxableVal: $taxableVal, tax: $tax, amount: $amount, rate: $rate, totalTaxAmount: $totalTaxAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaxCalModel &&
            const DeepCollectionEquality().equals(other.hsnCode, hsnCode) &&
            const DeepCollectionEquality()
                .equals(other.taxableVal, taxableVal) &&
            const DeepCollectionEquality().equals(other.tax, tax) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            const DeepCollectionEquality()
                .equals(other.totalTaxAmount, totalTaxAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hsnCode),
      const DeepCollectionEquality().hash(taxableVal),
      const DeepCollectionEquality().hash(tax),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(rate),
      const DeepCollectionEquality().hash(totalTaxAmount));

  @JsonKey(ignore: true)
  @override
  _$TaxCalModelCopyWith<_TaxCalModel> get copyWith =>
      __$TaxCalModelCopyWithImpl<_TaxCalModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaxCalModelToJson(this);
  }
}

abstract class _TaxCalModel implements TaxCalModel {
  factory _TaxCalModel(
      {required int hsnCode,
      required double taxableVal,
      required double tax,
      required double amount,
      required double rate,
      required double totalTaxAmount}) = _$_TaxCalModel;

  factory _TaxCalModel.fromJson(Map<String, dynamic> json) =
      _$_TaxCalModel.fromJson;

  @override
  int get hsnCode;
  @override
  double get taxableVal;
  @override
  double get tax;
  @override
  double get amount;
  @override
  double get rate;
  @override
  double get totalTaxAmount;
  @override
  @JsonKey(ignore: true)
  _$TaxCalModelCopyWith<_TaxCalModel> get copyWith =>
      throw _privateConstructorUsedError;
}
