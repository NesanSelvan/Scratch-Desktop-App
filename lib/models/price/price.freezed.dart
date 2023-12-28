// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) {
  return _PriceModel.fromJson(json);
}

/// @nodoc
mixin _$PriceModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  set code(String? value) => throw _privateConstructorUsedError;
  String? get barcodeCode => throw _privateConstructorUsedError;
  set barcodeCode(String? value) => throw _privateConstructorUsedError;
  UnitModel get unitModel => throw _privateConstructorUsedError;
  set unitModel(UnitModel value) => throw _privateConstructorUsedError;
  double? get purchasePrice => throw _privateConstructorUsedError;
  set purchasePrice(double? value) => throw _privateConstructorUsedError;
  double get mrp => throw _privateConstructorUsedError;
  set mrp(double value) => throw _privateConstructorUsedError;
  double get unitQty => throw _privateConstructorUsedError;
  set unitQty(double value) => throw _privateConstructorUsedError;
  double get retail => throw _privateConstructorUsedError;
  set retail(double value) => throw _privateConstructorUsedError;
  double get wholesale => throw _privateConstructorUsedError;
  set wholesale(double value) => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceModelCopyWith<PriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceModelCopyWith<$Res> {
  factory $PriceModelCopyWith(
          PriceModel value, $Res Function(PriceModel) then) =
      _$PriceModelCopyWithImpl<$Res, PriceModel>;
  @useResult
  $Res call(
      {String id,
      String? code,
      String? barcodeCode,
      UnitModel unitModel,
      double? purchasePrice,
      double mrp,
      double unitQty,
      double retail,
      double wholesale,
      DateTime createdAt});

  $UnitModelCopyWith<$Res> get unitModel;
}

/// @nodoc
class _$PriceModelCopyWithImpl<$Res, $Val extends PriceModel>
    implements $PriceModelCopyWith<$Res> {
  _$PriceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? barcodeCode = freezed,
    Object? unitModel = null,
    Object? purchasePrice = freezed,
    Object? mrp = null,
    Object? unitQty = null,
    Object? retail = null,
    Object? wholesale = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      barcodeCode: freezed == barcodeCode
          ? _value.barcodeCode
          : barcodeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      unitModel: null == unitModel
          ? _value.unitModel
          : unitModel // ignore: cast_nullable_to_non_nullable
              as UnitModel,
      purchasePrice: freezed == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      unitQty: null == unitQty
          ? _value.unitQty
          : unitQty // ignore: cast_nullable_to_non_nullable
              as double,
      retail: null == retail
          ? _value.retail
          : retail // ignore: cast_nullable_to_non_nullable
              as double,
      wholesale: null == wholesale
          ? _value.wholesale
          : wholesale // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnitModelCopyWith<$Res> get unitModel {
    return $UnitModelCopyWith<$Res>(_value.unitModel, (value) {
      return _then(_value.copyWith(unitModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PriceModelImplCopyWith<$Res>
    implements $PriceModelCopyWith<$Res> {
  factory _$$PriceModelImplCopyWith(
          _$PriceModelImpl value, $Res Function(_$PriceModelImpl) then) =
      __$$PriceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? code,
      String? barcodeCode,
      UnitModel unitModel,
      double? purchasePrice,
      double mrp,
      double unitQty,
      double retail,
      double wholesale,
      DateTime createdAt});

  @override
  $UnitModelCopyWith<$Res> get unitModel;
}

/// @nodoc
class __$$PriceModelImplCopyWithImpl<$Res>
    extends _$PriceModelCopyWithImpl<$Res, _$PriceModelImpl>
    implements _$$PriceModelImplCopyWith<$Res> {
  __$$PriceModelImplCopyWithImpl(
      _$PriceModelImpl _value, $Res Function(_$PriceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? barcodeCode = freezed,
    Object? unitModel = null,
    Object? purchasePrice = freezed,
    Object? mrp = null,
    Object? unitQty = null,
    Object? retail = null,
    Object? wholesale = null,
    Object? createdAt = null,
  }) {
    return _then(_$PriceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      barcodeCode: freezed == barcodeCode
          ? _value.barcodeCode
          : barcodeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      unitModel: null == unitModel
          ? _value.unitModel
          : unitModel // ignore: cast_nullable_to_non_nullable
              as UnitModel,
      purchasePrice: freezed == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      unitQty: null == unitQty
          ? _value.unitQty
          : unitQty // ignore: cast_nullable_to_non_nullable
              as double,
      retail: null == retail
          ? _value.retail
          : retail // ignore: cast_nullable_to_non_nullable
              as double,
      wholesale: null == wholesale
          ? _value.wholesale
          : wholesale // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PriceModelImpl implements _PriceModel {
  _$PriceModelImpl(
      {required this.id,
      this.code,
      this.barcodeCode,
      required this.unitModel,
      this.purchasePrice,
      required this.mrp,
      required this.unitQty,
      required this.retail,
      required this.wholesale,
      required this.createdAt});

  factory _$PriceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceModelImplFromJson(json);

  @override
  String id;
  @override
  String? code;
  @override
  String? barcodeCode;
  @override
  UnitModel unitModel;
  @override
  double? purchasePrice;
  @override
  double mrp;
  @override
  double unitQty;
  @override
  double retail;
  @override
  double wholesale;
  @override
  DateTime createdAt;

  @override
  String toString() {
    return 'PriceModel(id: $id, code: $code, barcodeCode: $barcodeCode, unitModel: $unitModel, purchasePrice: $purchasePrice, mrp: $mrp, unitQty: $unitQty, retail: $retail, wholesale: $wholesale, createdAt: $createdAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceModelImplCopyWith<_$PriceModelImpl> get copyWith =>
      __$$PriceModelImplCopyWithImpl<_$PriceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceModelImplToJson(
      this,
    );
  }
}

abstract class _PriceModel implements PriceModel {
  factory _PriceModel(
      {required String id,
      String? code,
      String? barcodeCode,
      required UnitModel unitModel,
      double? purchasePrice,
      required double mrp,
      required double unitQty,
      required double retail,
      required double wholesale,
      required DateTime createdAt}) = _$PriceModelImpl;

  factory _PriceModel.fromJson(Map<String, dynamic> json) =
      _$PriceModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String? get code;
  set code(String? value);
  @override
  String? get barcodeCode;
  set barcodeCode(String? value);
  @override
  UnitModel get unitModel;
  set unitModel(UnitModel value);
  @override
  double? get purchasePrice;
  set purchasePrice(double? value);
  @override
  double get mrp;
  set mrp(double value);
  @override
  double get unitQty;
  set unitQty(double value);
  @override
  double get retail;
  set retail(double value);
  @override
  double get wholesale;
  set wholesale(double value);
  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$PriceModelImplCopyWith<_$PriceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
