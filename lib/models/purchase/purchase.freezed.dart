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
  set id(String value) => throw _privateConstructorUsedError;
  String get billNo => throw _privateConstructorUsedError;
  set billNo(String value) => throw _privateConstructorUsedError;
  CompanyModel get companyModel => throw _privateConstructorUsedError;
  set companyModel(CompanyModel value) => throw _privateConstructorUsedError;
  bool? get isNormalPurchaseBill => throw _privateConstructorUsedError;
  set isNormalPurchaseBill(bool? value) => throw _privateConstructorUsedError;
  double? get lorryFright => throw _privateConstructorUsedError;
  set lorryFright(double? value) => throw _privateConstructorUsedError;
  double? get lorryFrightTax => throw _privateConstructorUsedError;
  set lorryFrightTax(double? value) => throw _privateConstructorUsedError;
  double? get lorryFrightTotal => throw _privateConstructorUsedError;
  set lorryFrightTotal(double? value) => throw _privateConstructorUsedError;
  double? get overallDiscount => throw _privateConstructorUsedError;
  set overallDiscount(double? value) => throw _privateConstructorUsedError;
  List<PurchaseProductModel> get productList =>
      throw _privateConstructorUsedError;
  set productList(List<PurchaseProductModel> value) =>
      throw _privateConstructorUsedError;
  List<String> get paymentsIdList => throw _privateConstructorUsedError;
  set paymentsIdList(List<String> value) => throw _privateConstructorUsedError;
  bool get isTax => throw _privateConstructorUsedError;
  set isTax(bool value) => throw _privateConstructorUsedError;
  double get grandTotal => throw _privateConstructorUsedError;
  set grandTotal(double value) => throw _privateConstructorUsedError;
  double? get forwardingSales => throw _privateConstructorUsedError;
  set forwardingSales(double? value) => throw _privateConstructorUsedError;
  double get forwardingSalesPercentage => throw _privateConstructorUsedError;
  set forwardingSalesPercentage(double value) =>
      throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  set dateTime(DateTime value) => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  set note(String? value) => throw _privateConstructorUsedError;
  List<String>? get imagesPathList => throw _privateConstructorUsedError;
  set imagesPathList(List<String>? value) => throw _privateConstructorUsedError;
  double? get tcsSales => throw _privateConstructorUsedError;
  set tcsSales(double? value) => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime value) => throw _privateConstructorUsedError;

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
      required this.productList,
      this.paymentsIdList = const [],
      this.isTax = true,
      required this.grandTotal,
      this.forwardingSales,
      this.forwardingSalesPercentage = 0,
      required this.dateTime,
      this.note,
      this.imagesPathList,
      this.tcsSales,
      required this.createdAt});

  factory _$PurchaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseModelImplFromJson(json);

  @override
  String id;
  @override
  String billNo;
  @override
  CompanyModel companyModel;
  @override
  bool? isNormalPurchaseBill;
  @override
  double? lorryFright;
  @override
  double? lorryFrightTax;
  @override
  double? lorryFrightTotal;
  @override
  double? overallDiscount;
  @override
  List<PurchaseProductModel> productList;
  @override
  @JsonKey()
  List<String> paymentsIdList;
  @override
  @JsonKey()
  bool isTax;
  @override
  double grandTotal;
  @override
  double? forwardingSales;
  @override
  @JsonKey()
  double forwardingSalesPercentage;
  @override
  DateTime dateTime;
  @override
  String? note;
  @override
  List<String>? imagesPathList;
  @override
  double? tcsSales;
  @override
  DateTime createdAt;

  @override
  String toString() {
    return 'PurchaseModel(id: $id, billNo: $billNo, companyModel: $companyModel, isNormalPurchaseBill: $isNormalPurchaseBill, lorryFright: $lorryFright, lorryFrightTax: $lorryFrightTax, lorryFrightTotal: $lorryFrightTotal, overallDiscount: $overallDiscount, productList: $productList, paymentsIdList: $paymentsIdList, isTax: $isTax, grandTotal: $grandTotal, forwardingSales: $forwardingSales, forwardingSalesPercentage: $forwardingSalesPercentage, dateTime: $dateTime, note: $note, imagesPathList: $imagesPathList, tcsSales: $tcsSales, createdAt: $createdAt)';
  }

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
      {required String id,
      required String billNo,
      required CompanyModel companyModel,
      required bool? isNormalPurchaseBill,
      required double? lorryFright,
      required double? lorryFrightTax,
      required double? lorryFrightTotal,
      required double? overallDiscount,
      required List<PurchaseProductModel> productList,
      List<String> paymentsIdList,
      bool isTax,
      required double grandTotal,
      double? forwardingSales,
      double forwardingSalesPercentage,
      required DateTime dateTime,
      String? note,
      List<String>? imagesPathList,
      double? tcsSales,
      required DateTime createdAt}) = _$PurchaseModelImpl;

  factory _PurchaseModel.fromJson(Map<String, dynamic> json) =
      _$PurchaseModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get billNo;
  set billNo(String value);
  @override
  CompanyModel get companyModel;
  set companyModel(CompanyModel value);
  @override
  bool? get isNormalPurchaseBill;
  set isNormalPurchaseBill(bool? value);
  @override
  double? get lorryFright;
  set lorryFright(double? value);
  @override
  double? get lorryFrightTax;
  set lorryFrightTax(double? value);
  @override
  double? get lorryFrightTotal;
  set lorryFrightTotal(double? value);
  @override
  double? get overallDiscount;
  set overallDiscount(double? value);
  @override
  List<PurchaseProductModel> get productList;
  set productList(List<PurchaseProductModel> value);
  @override
  List<String> get paymentsIdList;
  set paymentsIdList(List<String> value);
  @override
  bool get isTax;
  set isTax(bool value);
  @override
  double get grandTotal;
  set grandTotal(double value);
  @override
  double? get forwardingSales;
  set forwardingSales(double? value);
  @override
  double get forwardingSalesPercentage;
  set forwardingSalesPercentage(double value);
  @override
  DateTime get dateTime;
  set dateTime(DateTime value);
  @override
  String? get note;
  set note(String? value);
  @override
  List<String>? get imagesPathList;
  set imagesPathList(List<String>? value);
  @override
  double? get tcsSales;
  set tcsSales(double? value);
  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$PurchaseModelImplCopyWith<_$PurchaseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
