// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchaseModel _$PurchaseModelFromJson(Map<String, dynamic> json) {
  return _PurchaseModel.fromJson(json);
}

/// @nodoc
mixin _$PurchaseModel {
  String get id => throw _privateConstructorUsedError;
  String get billNo => throw _privateConstructorUsedError;
  CompanyModel get companyModel => throw _privateConstructorUsedError;
  bool? get isNormalPurchaseBill => throw _privateConstructorUsedError;
  double? get lorryFright => throw _privateConstructorUsedError;
  double? get lorryFrightTax => throw _privateConstructorUsedError;
  double? get lorryFrightTotal => throw _privateConstructorUsedError;
  double? get overallDiscount => throw _privateConstructorUsedError;
  List<PurchaseProductModel> get productList =>
      throw _privateConstructorUsedError;
  List<String> get paymentsIdList => throw _privateConstructorUsedError;
  bool get isTax => throw _privateConstructorUsedError;
  double get grandTotal => throw _privateConstructorUsedError;
  double? get forwardingSales => throw _privateConstructorUsedError;
  double get forwardingSalesPercentage => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  List<String>? get imagesPathList => throw _privateConstructorUsedError;
  double? get tcsSales => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseModelCopyWith<PurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseModelCopyWith<$Res> {
  factory $PurchaseModelCopyWith(
          PurchaseModel value, $Res Function(PurchaseModel) then) =
      _$PurchaseModelCopyWithImpl<$Res, PurchaseModel>;
  @useResult
  $Res call(
      {String id,
      String billNo,
      CompanyModel companyModel,
      bool? isNormalPurchaseBill,
      double? lorryFright,
      double? lorryFrightTax,
      double? lorryFrightTotal,
      double? overallDiscount,
      List<PurchaseProductModel> productList,
      List<String> paymentsIdList,
      bool isTax,
      double grandTotal,
      double? forwardingSales,
      double forwardingSalesPercentage,
      DateTime dateTime,
      String? note,
      List<String>? imagesPathList,
      double? tcsSales,
      DateTime createdAt});

  $CompanyModelCopyWith<$Res> get companyModel;
}

/// @nodoc
class _$PurchaseModelCopyWithImpl<$Res, $Val extends PurchaseModel>
    implements $PurchaseModelCopyWith<$Res> {
  _$PurchaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billNo = null,
    Object? companyModel = null,
    Object? isNormalPurchaseBill = freezed,
    Object? lorryFright = freezed,
    Object? lorryFrightTax = freezed,
    Object? lorryFrightTotal = freezed,
    Object? overallDiscount = freezed,
    Object? productList = null,
    Object? paymentsIdList = null,
    Object? isTax = null,
    Object? grandTotal = null,
    Object? forwardingSales = freezed,
    Object? forwardingSalesPercentage = null,
    Object? dateTime = null,
    Object? note = freezed,
    Object? imagesPathList = freezed,
    Object? tcsSales = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: null == billNo
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String,
      companyModel: null == companyModel
          ? _value.companyModel
          : companyModel // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      isNormalPurchaseBill: freezed == isNormalPurchaseBill
          ? _value.isNormalPurchaseBill
          : isNormalPurchaseBill // ignore: cast_nullable_to_non_nullable
              as bool?,
      lorryFright: freezed == lorryFright
          ? _value.lorryFright
          : lorryFright // ignore: cast_nullable_to_non_nullable
              as double?,
      lorryFrightTax: freezed == lorryFrightTax
          ? _value.lorryFrightTax
          : lorryFrightTax // ignore: cast_nullable_to_non_nullable
              as double?,
      lorryFrightTotal: freezed == lorryFrightTotal
          ? _value.lorryFrightTotal
          : lorryFrightTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      overallDiscount: freezed == overallDiscount
          ? _value.overallDiscount
          : overallDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      productList: null == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<PurchaseProductModel>,
      paymentsIdList: null == paymentsIdList
          ? _value.paymentsIdList
          : paymentsIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isTax: null == isTax
          ? _value.isTax
          : isTax // ignore: cast_nullable_to_non_nullable
              as bool,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      forwardingSales: freezed == forwardingSales
          ? _value.forwardingSales
          : forwardingSales // ignore: cast_nullable_to_non_nullable
              as double?,
      forwardingSalesPercentage: null == forwardingSalesPercentage
          ? _value.forwardingSalesPercentage
          : forwardingSalesPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesPathList: freezed == imagesPathList
          ? _value.imagesPathList
          : imagesPathList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tcsSales: freezed == tcsSales
          ? _value.tcsSales
          : tcsSales // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompanyModelCopyWith<$Res> get companyModel {
    return $CompanyModelCopyWith<$Res>(_value.companyModel, (value) {
      return _then(_value.copyWith(companyModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseModelImplCopyWith<$Res>
    implements $PurchaseModelCopyWith<$Res> {
  factory _$$PurchaseModelImplCopyWith(
          _$PurchaseModelImpl value, $Res Function(_$PurchaseModelImpl) then) =
      __$$PurchaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String billNo,
      CompanyModel companyModel,
      bool? isNormalPurchaseBill,
      double? lorryFright,
      double? lorryFrightTax,
      double? lorryFrightTotal,
      double? overallDiscount,
      List<PurchaseProductModel> productList,
      List<String> paymentsIdList,
      bool isTax,
      double grandTotal,
      double? forwardingSales,
      double forwardingSalesPercentage,
      DateTime dateTime,
      String? note,
      List<String>? imagesPathList,
      double? tcsSales,
      DateTime createdAt});

  @override
  $CompanyModelCopyWith<$Res> get companyModel;
}

/// @nodoc
class __$$PurchaseModelImplCopyWithImpl<$Res>
    extends _$PurchaseModelCopyWithImpl<$Res, _$PurchaseModelImpl>
    implements _$$PurchaseModelImplCopyWith<$Res> {
  __$$PurchaseModelImplCopyWithImpl(
      _$PurchaseModelImpl _value, $Res Function(_$PurchaseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billNo = null,
    Object? companyModel = null,
    Object? isNormalPurchaseBill = freezed,
    Object? lorryFright = freezed,
    Object? lorryFrightTax = freezed,
    Object? lorryFrightTotal = freezed,
    Object? overallDiscount = freezed,
    Object? productList = null,
    Object? paymentsIdList = null,
    Object? isTax = null,
    Object? grandTotal = null,
    Object? forwardingSales = freezed,
    Object? forwardingSalesPercentage = null,
    Object? dateTime = null,
    Object? note = freezed,
    Object? imagesPathList = freezed,
    Object? tcsSales = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$PurchaseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: null == billNo
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String,
      companyModel: null == companyModel
          ? _value.companyModel
          : companyModel // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      isNormalPurchaseBill: freezed == isNormalPurchaseBill
          ? _value.isNormalPurchaseBill
          : isNormalPurchaseBill // ignore: cast_nullable_to_non_nullable
              as bool?,
      lorryFright: freezed == lorryFright
          ? _value.lorryFright
          : lorryFright // ignore: cast_nullable_to_non_nullable
              as double?,
      lorryFrightTax: freezed == lorryFrightTax
          ? _value.lorryFrightTax
          : lorryFrightTax // ignore: cast_nullable_to_non_nullable
              as double?,
      lorryFrightTotal: freezed == lorryFrightTotal
          ? _value.lorryFrightTotal
          : lorryFrightTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      overallDiscount: freezed == overallDiscount
          ? _value.overallDiscount
          : overallDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      productList: null == productList
          ? _value._productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<PurchaseProductModel>,
      paymentsIdList: null == paymentsIdList
          ? _value._paymentsIdList
          : paymentsIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isTax: null == isTax
          ? _value.isTax
          : isTax // ignore: cast_nullable_to_non_nullable
              as bool,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      forwardingSales: freezed == forwardingSales
          ? _value.forwardingSales
          : forwardingSales // ignore: cast_nullable_to_non_nullable
              as double?,
      forwardingSalesPercentage: null == forwardingSalesPercentage
          ? _value.forwardingSalesPercentage
          : forwardingSalesPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesPathList: freezed == imagesPathList
          ? _value._imagesPathList
          : imagesPathList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tcsSales: freezed == tcsSales
          ? _value.tcsSales
          : tcsSales // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PurchaseModelImpl implements _PurchaseModel {
  _$PurchaseModelImpl(
      {required this.id,
      required this.billNo,
      required this.companyModel,
      required this.isNormalPurchaseBill,
      required this.lorryFright,
      required this.lorryFrightTax,
      required this.lorryFrightTotal,
      required this.overallDiscount,
      required final List<PurchaseProductModel> productList,
      final List<String> paymentsIdList = const [],
      this.isTax = true,
      required this.grandTotal,
      this.forwardingSales,
      this.forwardingSalesPercentage = 0,
      required this.dateTime,
      this.note,
      final List<String>? imagesPathList,
      this.tcsSales,
      required this.createdAt})
      : _productList = productList,
        _paymentsIdList = paymentsIdList,
        _imagesPathList = imagesPathList;

  factory _$PurchaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseModelImplFromJson(json);

  @override
  final String id;
  @override
  final String billNo;
  @override
  final CompanyModel companyModel;
  @override
  final bool? isNormalPurchaseBill;
  @override
  final double? lorryFright;
  @override
  final double? lorryFrightTax;
  @override
  final double? lorryFrightTotal;
  @override
  final double? overallDiscount;
  final List<PurchaseProductModel> _productList;
  @override
  List<PurchaseProductModel> get productList {
    if (_productList is EqualUnmodifiableListView) return _productList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productList);
  }

  final List<String> _paymentsIdList;
  @override
  @JsonKey()
  List<String> get paymentsIdList {
    if (_paymentsIdList is EqualUnmodifiableListView) return _paymentsIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentsIdList);
  }

  @override
  @JsonKey()
  final bool isTax;
  @override
  final double grandTotal;
  @override
  final double? forwardingSales;
  @override
  @JsonKey()
  final double forwardingSalesPercentage;
  @override
  final DateTime dateTime;
  @override
  final String? note;
  final List<String>? _imagesPathList;
  @override
  List<String>? get imagesPathList {
    final value = _imagesPathList;
    if (value == null) return null;
    if (_imagesPathList is EqualUnmodifiableListView) return _imagesPathList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? tcsSales;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'PurchaseModel(id: $id, billNo: $billNo, companyModel: $companyModel, isNormalPurchaseBill: $isNormalPurchaseBill, lorryFright: $lorryFright, lorryFrightTax: $lorryFrightTax, lorryFrightTotal: $lorryFrightTotal, overallDiscount: $overallDiscount, productList: $productList, paymentsIdList: $paymentsIdList, isTax: $isTax, grandTotal: $grandTotal, forwardingSales: $forwardingSales, forwardingSalesPercentage: $forwardingSalesPercentage, dateTime: $dateTime, note: $note, imagesPathList: $imagesPathList, tcsSales: $tcsSales, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.billNo, billNo) || other.billNo == billNo) &&
            (identical(other.companyModel, companyModel) ||
                other.companyModel == companyModel) &&
            (identical(other.isNormalPurchaseBill, isNormalPurchaseBill) ||
                other.isNormalPurchaseBill == isNormalPurchaseBill) &&
            (identical(other.lorryFright, lorryFright) ||
                other.lorryFright == lorryFright) &&
            (identical(other.lorryFrightTax, lorryFrightTax) ||
                other.lorryFrightTax == lorryFrightTax) &&
            (identical(other.lorryFrightTotal, lorryFrightTotal) ||
                other.lorryFrightTotal == lorryFrightTotal) &&
            (identical(other.overallDiscount, overallDiscount) ||
                other.overallDiscount == overallDiscount) &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList) &&
            const DeepCollectionEquality()
                .equals(other._paymentsIdList, _paymentsIdList) &&
            (identical(other.isTax, isTax) || other.isTax == isTax) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.forwardingSales, forwardingSales) ||
                other.forwardingSales == forwardingSales) &&
            (identical(other.forwardingSalesPercentage,
                    forwardingSalesPercentage) ||
                other.forwardingSalesPercentage == forwardingSalesPercentage) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality()
                .equals(other._imagesPathList, _imagesPathList) &&
            (identical(other.tcsSales, tcsSales) ||
                other.tcsSales == tcsSales) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        billNo,
        companyModel,
        isNormalPurchaseBill,
        lorryFright,
        lorryFrightTax,
        lorryFrightTotal,
        overallDiscount,
        const DeepCollectionEquality().hash(_productList),
        const DeepCollectionEquality().hash(_paymentsIdList),
        isTax,
        grandTotal,
        forwardingSales,
        forwardingSalesPercentage,
        dateTime,
        note,
        const DeepCollectionEquality().hash(_imagesPathList),
        tcsSales,
        createdAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseModelImplCopyWith<_$PurchaseModelImpl> get copyWith =>
      __$$PurchaseModelImplCopyWithImpl<_$PurchaseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseModelImplToJson(
      this,
    );
  }
}

abstract class _PurchaseModel implements PurchaseModel {
  factory _PurchaseModel(
      {required final String id,
      required final String billNo,
      required final CompanyModel companyModel,
      required final bool? isNormalPurchaseBill,
      required final double? lorryFright,
      required final double? lorryFrightTax,
      required final double? lorryFrightTotal,
      required final double? overallDiscount,
      required final List<PurchaseProductModel> productList,
      final List<String> paymentsIdList,
      final bool isTax,
      required final double grandTotal,
      final double? forwardingSales,
      final double forwardingSalesPercentage,
      required final DateTime dateTime,
      final String? note,
      final List<String>? imagesPathList,
      final double? tcsSales,
      required final DateTime createdAt}) = _$PurchaseModelImpl;

  factory _PurchaseModel.fromJson(Map<String, dynamic> json) =
      _$PurchaseModelImpl.fromJson;

  @override
  String get id;
  @override
  String get billNo;
  @override
  CompanyModel get companyModel;
  @override
  bool? get isNormalPurchaseBill;
  @override
  double? get lorryFright;
  @override
  double? get lorryFrightTax;
  @override
  double? get lorryFrightTotal;
  @override
  double? get overallDiscount;
  @override
  List<PurchaseProductModel> get productList;
  @override
  List<String> get paymentsIdList;
  @override
  bool get isTax;
  @override
  double get grandTotal;
  @override
  double? get forwardingSales;
  @override
  double get forwardingSalesPercentage;
  @override
  DateTime get dateTime;
  @override
  String? get note;
  @override
  List<String>? get imagesPathList;
  @override
  double? get tcsSales;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseModelImplCopyWith<_$PurchaseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
