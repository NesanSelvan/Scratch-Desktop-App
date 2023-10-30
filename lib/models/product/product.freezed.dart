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
          ? _value._differentPriceList
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
          ? _value._imagesList
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
  const _$ProductModelImpl(
      {required this.id,
      required this.code,
      this.productNumber,
      required this.productName,
      required this.categoryId,
      required this.unitId,
      this.unitQty = 0,
      final List<PriceModel>? differentPriceList = const [],
      required this.purchasePrice,
      required this.sellingPrice,
      this.isHidden = false,
      required this.wholesale,
      required this.retail,
      this.isPending = false,
      this.companyId,
      final List<String>? imagesList,
      required this.createdAt})
      : _differentPriceList = differentPriceList,
        _imagesList = imagesList;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String? productNumber;
// String? barcodeCode,
  @override
  final String productName;
  @override
  final String categoryId;
  @override
  final String unitId;
  @override
  @JsonKey()
  final int? unitQty;
  final List<PriceModel>? _differentPriceList;
  @override
  @JsonKey()
  List<PriceModel>? get differentPriceList {
    final value = _differentPriceList;
    if (value == null) return null;
    if (_differentPriceList is EqualUnmodifiableListView)
      return _differentPriceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double purchasePrice;
  @override
  final double sellingPrice;
  @override
  @JsonKey()
  final bool? isHidden;
  @override
  final double wholesale;
  @override
  final double retail;
  @override
  @JsonKey()
  final bool? isPending;
  @override
  final String? companyId;
  final List<String>? _imagesList;
  @override
  List<String>? get imagesList {
    final value = _imagesList;
    if (value == null) return null;
    if (_imagesList is EqualUnmodifiableListView) return _imagesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.productNumber, productNumber) ||
                other.productNumber == productNumber) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.unitQty, unitQty) || other.unitQty == unitQty) &&
            const DeepCollectionEquality()
                .equals(other._differentPriceList, _differentPriceList) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.sellingPrice, sellingPrice) ||
                other.sellingPrice == sellingPrice) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.wholesale, wholesale) ||
                other.wholesale == wholesale) &&
            (identical(other.retail, retail) || other.retail == retail) &&
            (identical(other.isPending, isPending) ||
                other.isPending == isPending) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            const DeepCollectionEquality()
                .equals(other._imagesList, _imagesList) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      productNumber,
      productName,
      categoryId,
      unitId,
      unitQty,
      const DeepCollectionEquality().hash(_differentPriceList),
      purchasePrice,
      sellingPrice,
      isHidden,
      wholesale,
      retail,
      isPending,
      companyId,
      const DeepCollectionEquality().hash(_imagesList),
      createdAt);

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
  const factory _ProductModel(
      {required final String id,
      required final String code,
      final String? productNumber,
      required final String productName,
      required final String categoryId,
      required final String unitId,
      final int? unitQty,
      final List<PriceModel>? differentPriceList,
      required final double purchasePrice,
      required final double sellingPrice,
      final bool? isHidden,
      required final double wholesale,
      required final double retail,
      final bool? isPending,
      final String? companyId,
      final List<String>? imagesList,
      required final DateTime createdAt}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

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
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
