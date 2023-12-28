// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  set code(String value) => throw _privateConstructorUsedError;
  String? get productNumber => throw _privateConstructorUsedError;
  set productNumber(String? value) =>
      throw _privateConstructorUsedError; // String? barcodeCode,
  String get productName =>
      throw _privateConstructorUsedError; // String? barcodeCode,
  set productName(String value) => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  set categoryId(String value) => throw _privateConstructorUsedError;
  String get unitId => throw _privateConstructorUsedError;
  set unitId(String value) => throw _privateConstructorUsedError;
  int? get unitQty => throw _privateConstructorUsedError;
  set unitQty(int? value) => throw _privateConstructorUsedError;
  List<PriceModel>? get differentPriceList =>
      throw _privateConstructorUsedError;
  set differentPriceList(List<PriceModel>? value) =>
      throw _privateConstructorUsedError;
  double get purchasePrice => throw _privateConstructorUsedError;
  set purchasePrice(double value) => throw _privateConstructorUsedError;
  double get sellingPrice => throw _privateConstructorUsedError;
  set sellingPrice(double value) => throw _privateConstructorUsedError;
  bool? get isHidden => throw _privateConstructorUsedError;
  set isHidden(bool? value) => throw _privateConstructorUsedError;
  double get wholesale => throw _privateConstructorUsedError;
  set wholesale(double value) => throw _privateConstructorUsedError;
  double get retail => throw _privateConstructorUsedError;
  set retail(double value) => throw _privateConstructorUsedError;
  bool? get isPending => throw _privateConstructorUsedError;
  set isPending(bool? value) => throw _privateConstructorUsedError;
  String? get companyId => throw _privateConstructorUsedError;
  set companyId(String? value) => throw _privateConstructorUsedError;
  List<String>? get imagesList => throw _privateConstructorUsedError;
  set imagesList(List<String>? value) => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String id,
      String code,
      String? productNumber,
      String productName,
      String categoryId,
      String unitId,
      int? unitQty,
      List<PriceModel>? differentPriceList,
      double purchasePrice,
      double sellingPrice,
      bool? isHidden,
      double wholesale,
      double retail,
      bool? isPending,
      String? companyId,
      List<String>? imagesList,
      DateTime createdAt});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? productNumber = freezed,
    Object? productName = null,
    Object? categoryId = null,
    Object? unitId = null,
    Object? unitQty = freezed,
    Object? differentPriceList = freezed,
    Object? purchasePrice = null,
    Object? sellingPrice = null,
    Object? isHidden = freezed,
    Object? wholesale = null,
    Object? retail = null,
    Object? isPending = freezed,
    Object? companyId = freezed,
    Object? imagesList = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      productNumber: freezed == productNumber
          ? _value.productNumber
          : productNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      unitQty: freezed == unitQty
          ? _value.unitQty
          : unitQty // ignore: cast_nullable_to_non_nullable
              as int?,
      differentPriceList: freezed == differentPriceList
          ? _value.differentPriceList
          : differentPriceList // ignore: cast_nullable_to_non_nullable
              as List<PriceModel>?,
      purchasePrice: null == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      sellingPrice: null == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isHidden: freezed == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      wholesale: null == wholesale
          ? _value.wholesale
          : wholesale // ignore: cast_nullable_to_non_nullable
              as double,
      retail: null == retail
          ? _value.retail
          : retail // ignore: cast_nullable_to_non_nullable
              as double,
      isPending: freezed == isPending
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesList: freezed == imagesList
          ? _value.imagesList
          : imagesList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      String? productNumber,
      String productName,
      String categoryId,
      String unitId,
      int? unitQty,
      List<PriceModel>? differentPriceList,
      double purchasePrice,
      double sellingPrice,
      bool? isHidden,
      double wholesale,
      double retail,
      bool? isPending,
      String? companyId,
      List<String>? imagesList,
      DateTime createdAt});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? productNumber = freezed,
    Object? productName = null,
    Object? categoryId = null,
    Object? unitId = null,
    Object? unitQty = freezed,
    Object? differentPriceList = freezed,
    Object? purchasePrice = null,
    Object? sellingPrice = null,
    Object? isHidden = freezed,
    Object? wholesale = null,
    Object? retail = null,
    Object? isPending = freezed,
    Object? companyId = freezed,
    Object? imagesList = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$ProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      productNumber: freezed == productNumber
          ? _value.productNumber
          : productNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      unitQty: freezed == unitQty
          ? _value.unitQty
          : unitQty // ignore: cast_nullable_to_non_nullable
              as int?,
      differentPriceList: freezed == differentPriceList
          ? _value.differentPriceList
          : differentPriceList // ignore: cast_nullable_to_non_nullable
              as List<PriceModel>?,
      purchasePrice: null == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      sellingPrice: null == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isHidden: freezed == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      wholesale: null == wholesale
          ? _value.wholesale
          : wholesale // ignore: cast_nullable_to_non_nullable
              as double,
      retail: null == retail
          ? _value.retail
          : retail // ignore: cast_nullable_to_non_nullable
              as double,
      isPending: freezed == isPending
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesList: freezed == imagesList
          ? _value.imagesList
          : imagesList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductModelImpl implements _ProductModel {
  _$ProductModelImpl(
      {required this.id,
      required this.code,
      this.productNumber,
      required this.productName,
      required this.categoryId,
      required this.unitId,
      this.unitQty = 0,
      this.differentPriceList = const [],
      required this.purchasePrice,
      required this.sellingPrice,
      this.isHidden = false,
      required this.wholesale,
      required this.retail,
      this.isPending = false,
      this.companyId,
      this.imagesList,
      required this.createdAt});

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  String id;
  @override
  String code;
  @override
  String? productNumber;
// String? barcodeCode,
  @override
  String productName;
  @override
  String categoryId;
  @override
  String unitId;
  @override
  @JsonKey()
  int? unitQty;
  @override
  @JsonKey()
  List<PriceModel>? differentPriceList;
  @override
  double purchasePrice;
  @override
  double sellingPrice;
  @override
  @JsonKey()
  bool? isHidden;
  @override
  double wholesale;
  @override
  double retail;
  @override
  @JsonKey()
  bool? isPending;
  @override
  String? companyId;
  @override
  List<String>? imagesList;
  @override
  DateTime createdAt;

  @override
  String toString() {
    return 'ProductModel(id: $id, code: $code, productNumber: $productNumber, productName: $productName, categoryId: $categoryId, unitId: $unitId, unitQty: $unitQty, differentPriceList: $differentPriceList, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, isHidden: $isHidden, wholesale: $wholesale, retail: $retail, isPending: $isPending, companyId: $companyId, imagesList: $imagesList, createdAt: $createdAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {required String id,
      required String code,
      String? productNumber,
      required String productName,
      required String categoryId,
      required String unitId,
      int? unitQty,
      List<PriceModel>? differentPriceList,
      required double purchasePrice,
      required double sellingPrice,
      bool? isHidden,
      required double wholesale,
      required double retail,
      bool? isPending,
      String? companyId,
      List<String>? imagesList,
      required DateTime createdAt}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get code;
  set code(String value);
  @override
  String? get productNumber;
  set productNumber(String? value);
  @override // String? barcodeCode,
  String get productName; // String? barcodeCode,
  set productName(String value);
  @override
  String get categoryId;
  set categoryId(String value);
  @override
  String get unitId;
  set unitId(String value);
  @override
  int? get unitQty;
  set unitQty(int? value);
  @override
  List<PriceModel>? get differentPriceList;
  set differentPriceList(List<PriceModel>? value);
  @override
  double get purchasePrice;
  set purchasePrice(double value);
  @override
  double get sellingPrice;
  set sellingPrice(double value);
  @override
  bool? get isHidden;
  set isHidden(bool? value);
  @override
  double get wholesale;
  set wholesale(double value);
  @override
  double get retail;
  set retail(double value);
  @override
  bool? get isPending;
  set isPending(bool? value);
  @override
  String? get companyId;
  set companyId(String? value);
  @override
  List<String>? get imagesList;
  set imagesList(List<String>? value);
  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
