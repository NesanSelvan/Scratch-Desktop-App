// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_cal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaxCalModel _$TaxCalModelFromJson(Map<String, dynamic> json) {
  return _TaxCalModel.fromJson(json);
}

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
      _$TaxCalModelCopyWithImpl<$Res, TaxCalModel>;
  @useResult
  $Res call(
      {int hsnCode,
      double taxableVal,
      double tax,
      double amount,
      double rate,
      double totalTaxAmount});
}

/// @nodoc
class _$TaxCalModelCopyWithImpl<$Res, $Val extends TaxCalModel>
    implements $TaxCalModelCopyWith<$Res> {
  _$TaxCalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hsnCode = null,
    Object? taxableVal = null,
    Object? tax = null,
    Object? amount = null,
    Object? rate = null,
    Object? totalTaxAmount = null,
  }) {
    return _then(_value.copyWith(
      hsnCode: null == hsnCode
          ? _value.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as int,
      taxableVal: null == taxableVal
          ? _value.taxableVal
          : taxableVal // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      totalTaxAmount: null == totalTaxAmount
          ? _value.totalTaxAmount
          : totalTaxAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxCalModelImplCopyWith<$Res>
    implements $TaxCalModelCopyWith<$Res> {
  factory _$$TaxCalModelImplCopyWith(
          _$TaxCalModelImpl value, $Res Function(_$TaxCalModelImpl) then) =
      __$$TaxCalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int hsnCode,
      double taxableVal,
      double tax,
      double amount,
      double rate,
      double totalTaxAmount});
}

/// @nodoc
class __$$TaxCalModelImplCopyWithImpl<$Res>
    extends _$TaxCalModelCopyWithImpl<$Res, _$TaxCalModelImpl>
    implements _$$TaxCalModelImplCopyWith<$Res> {
  __$$TaxCalModelImplCopyWithImpl(
      _$TaxCalModelImpl _value, $Res Function(_$TaxCalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hsnCode = null,
    Object? taxableVal = null,
    Object? tax = null,
    Object? amount = null,
    Object? rate = null,
    Object? totalTaxAmount = null,
  }) {
    return _then(_$TaxCalModelImpl(
      hsnCode: null == hsnCode
          ? _value.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as int,
      taxableVal: null == taxableVal
          ? _value.taxableVal
          : taxableVal // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      totalTaxAmount: null == totalTaxAmount
          ? _value.totalTaxAmount
          : totalTaxAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxCalModelImpl implements _TaxCalModel {
  _$TaxCalModelImpl(
      {required this.hsnCode,
      required this.taxableVal,
      required this.tax,
      required this.amount,
      required this.rate,
      required this.totalTaxAmount});

  factory _$TaxCalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxCalModelImplFromJson(json);

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
            other is _$TaxCalModelImpl &&
            (identical(other.hsnCode, hsnCode) || other.hsnCode == hsnCode) &&
            (identical(other.taxableVal, taxableVal) ||
                other.taxableVal == taxableVal) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.totalTaxAmount, totalTaxAmount) ||
                other.totalTaxAmount == totalTaxAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, hsnCode, taxableVal, tax, amount, rate, totalTaxAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxCalModelImplCopyWith<_$TaxCalModelImpl> get copyWith =>
      __$$TaxCalModelImplCopyWithImpl<_$TaxCalModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxCalModelImplToJson(
      this,
    );
  }
}

abstract class _TaxCalModel implements TaxCalModel {
  factory _TaxCalModel(
      {required final int hsnCode,
      required final double taxableVal,
      required final double tax,
      required final double amount,
      required final double rate,
      required final double totalTaxAmount}) = _$TaxCalModelImpl;

  factory _TaxCalModel.fromJson(Map<String, dynamic> json) =
      _$TaxCalModelImpl.fromJson;

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
  _$$TaxCalModelImplCopyWith<_$TaxCalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
