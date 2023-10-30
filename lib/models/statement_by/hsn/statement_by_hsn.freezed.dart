// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statement_by_hsn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatementByHSN _$StatementByHSNFromJson(Map<String, dynamic> json) {
  return _StatementByHSN.fromJson(json);
}

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
      _$StatementByHSNCopyWithImpl<$Res, StatementByHSN>;
  @useResult
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
class _$StatementByHSNCopyWithImpl<$Res, $Val extends StatementByHSN>
    implements $StatementByHSNCopyWith<$Res> {
  _$StatementByHSNCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billModel = null,
    Object? categoryModel = null,
    Object? amount = null,
    Object? tax = null,
    Object? taxableValue = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billModel: null == billModel
          ? _value.billModel
          : billModel // ignore: cast_nullable_to_non_nullable
              as BillModel,
      categoryModel: null == categoryModel
          ? _value.categoryModel
          : categoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      taxableValue: null == taxableValue
          ? _value.taxableValue
          : taxableValue // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BillModelCopyWith<$Res> get billModel {
    return $BillModelCopyWith<$Res>(_value.billModel, (value) {
      return _then(_value.copyWith(billModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get categoryModel {
    return $CategoryModelCopyWith<$Res>(_value.categoryModel, (value) {
      return _then(_value.copyWith(categoryModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatementByHSNImplCopyWith<$Res>
    implements $StatementByHSNCopyWith<$Res> {
  factory _$$StatementByHSNImplCopyWith(_$StatementByHSNImpl value,
          $Res Function(_$StatementByHSNImpl) then) =
      __$$StatementByHSNImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$StatementByHSNImplCopyWithImpl<$Res>
    extends _$StatementByHSNCopyWithImpl<$Res, _$StatementByHSNImpl>
    implements _$$StatementByHSNImplCopyWith<$Res> {
  __$$StatementByHSNImplCopyWithImpl(
      _$StatementByHSNImpl _value, $Res Function(_$StatementByHSNImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billModel = null,
    Object? categoryModel = null,
    Object? amount = null,
    Object? tax = null,
    Object? taxableValue = null,
    Object? createdAt = null,
  }) {
    return _then(_$StatementByHSNImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == billModel
          ? _value.billModel
          : billModel // ignore: cast_nullable_to_non_nullable
              as BillModel,
      null == categoryModel
          ? _value.categoryModel
          : categoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      null == taxableValue
          ? _value.taxableValue
          : taxableValue // ignore: cast_nullable_to_non_nullable
              as double,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatementByHSNImpl implements _StatementByHSN {
  const _$StatementByHSNImpl(this.id, this.billModel, this.categoryModel,
      this.amount, this.tax, this.taxableValue, this.createdAt);

  factory _$StatementByHSNImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatementByHSNImplFromJson(json);

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
            other is _$StatementByHSNImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.billModel, billModel) ||
                other.billModel == billModel) &&
            (identical(other.categoryModel, categoryModel) ||
                other.categoryModel == categoryModel) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.taxableValue, taxableValue) ||
                other.taxableValue == taxableValue) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, billModel, categoryModel,
      amount, tax, taxableValue, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatementByHSNImplCopyWith<_$StatementByHSNImpl> get copyWith =>
      __$$StatementByHSNImplCopyWithImpl<_$StatementByHSNImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatementByHSNImplToJson(
      this,
    );
  }
}

abstract class _StatementByHSN implements StatementByHSN {
  const factory _StatementByHSN(
      final String id,
      final BillModel billModel,
      final CategoryModel categoryModel,
      final double amount,
      final double tax,
      final double taxableValue,
      final DateTime createdAt) = _$StatementByHSNImpl;

  factory _StatementByHSN.fromJson(Map<String, dynamic> json) =
      _$StatementByHSNImpl.fromJson;

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
  _$$StatementByHSNImplCopyWith<_$StatementByHSNImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
