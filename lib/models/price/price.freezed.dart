// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) {
  return _PriceModel.fromJson(json);
}

/// @nodoc
class _$PriceModelTearOff {
  const _$PriceModelTearOff();

  _PriceModel call(
      {required String id,
      String? code,
      String? barcodeCode,
      required UnitModel unitModel,
      double? purchasePrice,
      required double mrp,
      required double unitQty,
      required double retail,
      required double wholesale,
      required DateTime createdAt}) {
    return _PriceModel(
      id: id,
      code: code,
      barcodeCode: barcodeCode,
      unitModel: unitModel,
      purchasePrice: purchasePrice,
      mrp: mrp,
      unitQty: unitQty,
      retail: retail,
      wholesale: wholesale,
      createdAt: createdAt,
    );
  }

  PriceModel fromJson(Map<String, Object?> json) {
    return PriceModel.fromJson(json);
  }
}

/// @nodoc
const $PriceModel = _$PriceModelTearOff();

/// @nodoc
mixin _$PriceModel {
  String get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get barcodeCode => throw _privateConstructorUsedError;
  UnitModel get unitModel => throw _privateConstructorUsedError;
  double? get purchasePrice => throw _privateConstructorUsedError;
  double get mrp => throw _privateConstructorUsedError;
  double get unitQty => throw _privateConstructorUsedError;
  double get retail => throw _privateConstructorUsedError;
  double get wholesale => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceModelCopyWith<PriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceModelCopyWith<$Res> {
  factory $PriceModelCopyWith(
          PriceModel value, $Res Function(PriceModel) then) =
      _$PriceModelCopyWithImpl<$Res>;
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
class _$PriceModelCopyWithImpl<$Res> implements $PriceModelCopyWith<$Res> {
  _$PriceModelCopyWithImpl(this._value, this._then);

  final PriceModel _value;
  // ignore: unused_field
  final $Res Function(PriceModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? barcodeCode = freezed,
    Object? unitModel = freezed,
    Object? purchasePrice = freezed,
    Object? mrp = freezed,
    Object? unitQty = freezed,
    Object? retail = freezed,
    Object? wholesale = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      barcodeCode: barcodeCode == freezed
          ? _value.barcodeCode
          : barcodeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      unitModel: unitModel == freezed
          ? _value.unitModel
          : unitModel // ignore: cast_nullable_to_non_nullable
              as UnitModel,
      purchasePrice: purchasePrice == freezed
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      mrp: mrp == freezed
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      unitQty: unitQty == freezed
          ? _value.unitQty
          : unitQty // ignore: cast_nullable_to_non_nullable
              as double,
      retail: retail == freezed
          ? _value.retail
          : retail // ignore: cast_nullable_to_non_nullable
              as double,
      wholesale: wholesale == freezed
          ? _value.wholesale
          : wholesale // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $UnitModelCopyWith<$Res> get unitModel {
    return $UnitModelCopyWith<$Res>(_value.unitModel, (value) {
      return _then(_value.copyWith(unitModel: value));
    });
  }
}

/// @nodoc
abstract class _$PriceModelCopyWith<$Res> implements $PriceModelCopyWith<$Res> {
  factory _$PriceModelCopyWith(
          _PriceModel value, $Res Function(_PriceModel) then) =
      __$PriceModelCopyWithImpl<$Res>;
  @override
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
class __$PriceModelCopyWithImpl<$Res> extends _$PriceModelCopyWithImpl<$Res>
    implements _$PriceModelCopyWith<$Res> {
  __$PriceModelCopyWithImpl(
      _PriceModel _value, $Res Function(_PriceModel) _then)
      : super(_value, (v) => _then(v as _PriceModel));

  @override
  _PriceModel get _value => super._value as _PriceModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? barcodeCode = freezed,
    Object? unitModel = freezed,
    Object? purchasePrice = freezed,
    Object? mrp = freezed,
    Object? unitQty = freezed,
    Object? retail = freezed,
    Object? wholesale = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_PriceModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      barcodeCode: barcodeCode == freezed
          ? _value.barcodeCode
          : barcodeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      unitModel: unitModel == freezed
          ? _value.unitModel
          : unitModel // ignore: cast_nullable_to_non_nullable
              as UnitModel,
      purchasePrice: purchasePrice == freezed
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      mrp: mrp == freezed
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      unitQty: unitQty == freezed
          ? _value.unitQty
          : unitQty // ignore: cast_nullable_to_non_nullable
              as double,
      retail: retail == freezed
          ? _value.retail
          : retail // ignore: cast_nullable_to_non_nullable
              as double,
      wholesale: wholesale == freezed
          ? _value.wholesale
          : wholesale // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PriceModel implements _PriceModel {
  _$_PriceModel(
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

  factory _$_PriceModel.fromJson(Map<String, dynamic> json) =>
      _$$_PriceModelFromJson(json);

  @override
  final String id;
  @override
  final String? code;
  @override
  final String? barcodeCode;
  @override
  final UnitModel unitModel;
  @override
  final double? purchasePrice;
  @override
  final double mrp;
  @override
  final double unitQty;
  @override
  final double retail;
  @override
  final double wholesale;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'PriceModel(id: $id, code: $code, barcodeCode: $barcodeCode, unitModel: $unitModel, purchasePrice: $purchasePrice, mrp: $mrp, unitQty: $unitQty, retail: $retail, wholesale: $wholesale, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PriceModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.barcodeCode, barcodeCode) &&
            const DeepCollectionEquality().equals(other.unitModel, unitModel) &&
            const DeepCollectionEquality()
                .equals(other.purchasePrice, purchasePrice) &&
            const DeepCollectionEquality().equals(other.mrp, mrp) &&
            const DeepCollectionEquality().equals(other.unitQty, unitQty) &&
            const DeepCollectionEquality().equals(other.retail, retail) &&
            const DeepCollectionEquality().equals(other.wholesale, wholesale) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(barcodeCode),
      const DeepCollectionEquality().hash(unitModel),
      const DeepCollectionEquality().hash(purchasePrice),
      const DeepCollectionEquality().hash(mrp),
      const DeepCollectionEquality().hash(unitQty),
      const DeepCollectionEquality().hash(retail),
      const DeepCollectionEquality().hash(wholesale),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$PriceModelCopyWith<_PriceModel> get copyWith =>
      __$PriceModelCopyWithImpl<_PriceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceModelToJson(this);
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
      required DateTime createdAt}) = _$_PriceModel;

  factory _PriceModel.fromJson(Map<String, dynamic> json) =
      _$_PriceModel.fromJson;

  @override
  String get id;
  @override
  String? get code;
  @override
  String? get barcodeCode;
  @override
  UnitModel get unitModel;
  @override
  double? get purchasePrice;
  @override
  double get mrp;
  @override
  double get unitQty;
  @override
  double get retail;
  @override
  double get wholesale;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$PriceModelCopyWith<_PriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
