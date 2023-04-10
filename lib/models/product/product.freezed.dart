// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
class _$ProductModelTearOff {
  const _$ProductModelTearOff();

  _ProductModel call(
      {required String id,
      required String code,
      String? productNumber,
      required String productName,
      required String categoryId,
      required String unitId,
      int? unitQty = 0,
      List<PriceModel>? differentPriceList = const [],
      required double purchasePrice,
      required double sellingPrice,
      bool? isHidden = false,
      required double wholesale,
      required double retail,
      bool? isPending = false,
      String? companyId,
      List<String>? imagesList,
      required DateTime createdAt}) {
    return _ProductModel(
      id: id,
      code: code,
      productNumber: productNumber,
      productName: productName,
      categoryId: categoryId,
      unitId: unitId,
      unitQty: unitQty,
      differentPriceList: differentPriceList,
      purchasePrice: purchasePrice,
      sellingPrice: sellingPrice,
      isHidden: isHidden,
      wholesale: wholesale,
      retail: retail,
      isPending: isPending,
      companyId: companyId,
      imagesList: imagesList,
      createdAt: createdAt,
    );
  }

  ProductModel fromJson(Map<String, Object?> json) {
    return ProductModel.fromJson(json);
  }
}

/// @nodoc
const $ProductModel = _$ProductModelTearOff();

/// @nodoc
mixin _$ProductModel {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String? get productNumber =>
      throw _privateConstructorUsedError; // String? barcodeCode,
  String get productName => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get unitId => throw _privateConstructorUsedError;
  int? get unitQty => throw _privateConstructorUsedError;
  List<PriceModel>? get differentPriceList =>
      throw _privateConstructorUsedError;
  double get purchasePrice => throw _privateConstructorUsedError;
  double get sellingPrice => throw _privateConstructorUsedError;
  bool? get isHidden => throw _privateConstructorUsedError;
  double get wholesale => throw _privateConstructorUsedError;
  double get retail => throw _privateConstructorUsedError;
  bool? get isPending => throw _privateConstructorUsedError;
  String? get companyId => throw _privateConstructorUsedError;
  List<String>? get imagesList => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res>;
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
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  final ProductModel _value;
  // ignore: unused_field
  final $Res Function(ProductModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? productNumber = freezed,
    Object? productName = freezed,
    Object? categoryId = freezed,
    Object? unitId = freezed,
    Object? unitQty = freezed,
    Object? differentPriceList = freezed,
    Object? purchasePrice = freezed,
    Object? sellingPrice = freezed,
    Object? isHidden = freezed,
    Object? wholesale = freezed,
    Object? retail = freezed,
    Object? isPending = freezed,
    Object? companyId = freezed,
    Object? imagesList = freezed,
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
              as String,
      productNumber: productNumber == freezed
          ? _value.productNumber
          : productNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: unitId == freezed
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      unitQty: unitQty == freezed
          ? _value.unitQty
          : unitQty // ignore: cast_nullable_to_non_nullable
              as int?,
      differentPriceList: differentPriceList == freezed
          ? _value.differentPriceList
          : differentPriceList // ignore: cast_nullable_to_non_nullable
              as List<PriceModel>?,
      purchasePrice: purchasePrice == freezed
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      sellingPrice: sellingPrice == freezed
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isHidden: isHidden == freezed
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      wholesale: wholesale == freezed
          ? _value.wholesale
          : wholesale // ignore: cast_nullable_to_non_nullable
              as double,
      retail: retail == freezed
          ? _value.retail
          : retail // ignore: cast_nullable_to_non_nullable
              as double,
      isPending: isPending == freezed
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool?,
      companyId: companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesList: imagesList == freezed
          ? _value.imagesList
          : imagesList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(
          _ProductModel value, $Res Function(_ProductModel) then) =
      __$ProductModelCopyWithImpl<$Res>;
  @override
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
class __$ProductModelCopyWithImpl<$Res> extends _$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(
      _ProductModel _value, $Res Function(_ProductModel) _then)
      : super(_value, (v) => _then(v as _ProductModel));

  @override
  _ProductModel get _value => super._value as _ProductModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? productNumber = freezed,
    Object? productName = freezed,
    Object? categoryId = freezed,
    Object? unitId = freezed,
    Object? unitQty = freezed,
    Object? differentPriceList = freezed,
    Object? purchasePrice = freezed,
    Object? sellingPrice = freezed,
    Object? isHidden = freezed,
    Object? wholesale = freezed,
    Object? retail = freezed,
    Object? isPending = freezed,
    Object? companyId = freezed,
    Object? imagesList = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_ProductModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      productNumber: productNumber == freezed
          ? _value.productNumber
          : productNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: unitId == freezed
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      unitQty: unitQty == freezed
          ? _value.unitQty
          : unitQty // ignore: cast_nullable_to_non_nullable
              as int?,
      differentPriceList: differentPriceList == freezed
          ? _value.differentPriceList
          : differentPriceList // ignore: cast_nullable_to_non_nullable
              as List<PriceModel>?,
      purchasePrice: purchasePrice == freezed
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      sellingPrice: sellingPrice == freezed
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isHidden: isHidden == freezed
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      wholesale: wholesale == freezed
          ? _value.wholesale
          : wholesale // ignore: cast_nullable_to_non_nullable
              as double,
      retail: retail == freezed
          ? _value.retail
          : retail // ignore: cast_nullable_to_non_nullable
              as double,
      isPending: isPending == freezed
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool?,
      companyId: companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesList: imagesList == freezed
          ? _value.imagesList
          : imagesList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ProductModel implements _ProductModel {
  const _$_ProductModel(
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

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String? productNumber;
  @override // String? barcodeCode,
  final String productName;
  @override
  final String categoryId;
  @override
  final String unitId;
  @JsonKey()
  @override
  final int? unitQty;
  @JsonKey()
  @override
  final List<PriceModel>? differentPriceList;
  @override
  final double purchasePrice;
  @override
  final double sellingPrice;
  @JsonKey()
  @override
  final bool? isHidden;
  @override
  final double wholesale;
  @override
  final double retail;
  @JsonKey()
  @override
  final bool? isPending;
  @override
  final String? companyId;
  @override
  final List<String>? imagesList;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ProductModel(id: $id, code: $code, productNumber: $productNumber, productName: $productName, categoryId: $categoryId, unitId: $unitId, unitQty: $unitQty, differentPriceList: $differentPriceList, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, isHidden: $isHidden, wholesale: $wholesale, retail: $retail, isPending: $isPending, companyId: $companyId, imagesList: $imagesList, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.productNumber, productNumber) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.unitId, unitId) &&
            const DeepCollectionEquality().equals(other.unitQty, unitQty) &&
            const DeepCollectionEquality()
                .equals(other.differentPriceList, differentPriceList) &&
            const DeepCollectionEquality()
                .equals(other.purchasePrice, purchasePrice) &&
            const DeepCollectionEquality()
                .equals(other.sellingPrice, sellingPrice) &&
            const DeepCollectionEquality().equals(other.isHidden, isHidden) &&
            const DeepCollectionEquality().equals(other.wholesale, wholesale) &&
            const DeepCollectionEquality().equals(other.retail, retail) &&
            const DeepCollectionEquality().equals(other.isPending, isPending) &&
            const DeepCollectionEquality().equals(other.companyId, companyId) &&
            const DeepCollectionEquality()
                .equals(other.imagesList, imagesList) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(productNumber),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(unitId),
      const DeepCollectionEquality().hash(unitQty),
      const DeepCollectionEquality().hash(differentPriceList),
      const DeepCollectionEquality().hash(purchasePrice),
      const DeepCollectionEquality().hash(sellingPrice),
      const DeepCollectionEquality().hash(isHidden),
      const DeepCollectionEquality().hash(wholesale),
      const DeepCollectionEquality().hash(retail),
      const DeepCollectionEquality().hash(isPending),
      const DeepCollectionEquality().hash(companyId),
      const DeepCollectionEquality().hash(imagesList),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(this);
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
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
      required DateTime createdAt}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  String get id;
  @override
  String get code;
  @override
  String? get productNumber;
  @override // String? barcodeCode,
  String get productName;
  @override
  String get categoryId;
  @override
  String get unitId;
  @override
  int? get unitQty;
  @override
  List<PriceModel>? get differentPriceList;
  @override
  double get purchasePrice;
  @override
  double get sellingPrice;
  @override
  bool? get isHidden;
  @override
  double get wholesale;
  @override
  double get retail;
  @override
  bool? get isPending;
  @override
  String? get companyId;
  @override
  List<String>? get imagesList;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
