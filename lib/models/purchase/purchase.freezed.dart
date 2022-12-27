// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchaseModel _$PurchaseModelFromJson(Map<String, dynamic> json) {
  return _PurchaseModel.fromJson(json);
}

/// @nodoc
class _$PurchaseModelTearOff {
  const _$PurchaseModelTearOff();

  _PurchaseModel call(
      {required String id,
      required String billNo,
      required CompanyModel companyModel,
      required bool? isNormalPurchaseBill,
      required double? lorryFright,
      required double? lorryFrightTax,
      required double? lorryFrightTotal,
      required List<PurchaseProductModel> productList,
      List<String> paymentsIdList = const [],
      bool isTax = true,
      required double grandTotal,
      double? forwardingSales,
      required DateTime dateTime,
      String? note,
      List<String>? imagesPathList,
      double? tcsSales,
      required DateTime createdAt}) {
    return _PurchaseModel(
      id: id,
      billNo: billNo,
      companyModel: companyModel,
      isNormalPurchaseBill: isNormalPurchaseBill,
      lorryFright: lorryFright,
      lorryFrightTax: lorryFrightTax,
      lorryFrightTotal: lorryFrightTotal,
      productList: productList,
      paymentsIdList: paymentsIdList,
      isTax: isTax,
      grandTotal: grandTotal,
      forwardingSales: forwardingSales,
      dateTime: dateTime,
      note: note,
      imagesPathList: imagesPathList,
      tcsSales: tcsSales,
      createdAt: createdAt,
    );
  }

  PurchaseModel fromJson(Map<String, Object?> json) {
    return PurchaseModel.fromJson(json);
  }
}

/// @nodoc
const $PurchaseModel = _$PurchaseModelTearOff();

/// @nodoc
mixin _$PurchaseModel {
  String get id => throw _privateConstructorUsedError;
  String get billNo => throw _privateConstructorUsedError;
  CompanyModel get companyModel => throw _privateConstructorUsedError;
  bool? get isNormalPurchaseBill => throw _privateConstructorUsedError;
  double? get lorryFright => throw _privateConstructorUsedError;
  double? get lorryFrightTax => throw _privateConstructorUsedError;
  double? get lorryFrightTotal => throw _privateConstructorUsedError;
  List<PurchaseProductModel> get productList =>
      throw _privateConstructorUsedError;
  List<String> get paymentsIdList => throw _privateConstructorUsedError;
  bool get isTax => throw _privateConstructorUsedError;
  double get grandTotal => throw _privateConstructorUsedError;
  double? get forwardingSales => throw _privateConstructorUsedError;
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
      _$PurchaseModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String billNo,
      CompanyModel companyModel,
      bool? isNormalPurchaseBill,
      double? lorryFright,
      double? lorryFrightTax,
      double? lorryFrightTotal,
      List<PurchaseProductModel> productList,
      List<String> paymentsIdList,
      bool isTax,
      double grandTotal,
      double? forwardingSales,
      DateTime dateTime,
      String? note,
      List<String>? imagesPathList,
      double? tcsSales,
      DateTime createdAt});

  $CompanyModelCopyWith<$Res> get companyModel;
}

/// @nodoc
class _$PurchaseModelCopyWithImpl<$Res>
    implements $PurchaseModelCopyWith<$Res> {
  _$PurchaseModelCopyWithImpl(this._value, this._then);

  final PurchaseModel _value;
  // ignore: unused_field
  final $Res Function(PurchaseModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? billNo = freezed,
    Object? companyModel = freezed,
    Object? isNormalPurchaseBill = freezed,
    Object? lorryFright = freezed,
    Object? lorryFrightTax = freezed,
    Object? lorryFrightTotal = freezed,
    Object? productList = freezed,
    Object? paymentsIdList = freezed,
    Object? isTax = freezed,
    Object? grandTotal = freezed,
    Object? forwardingSales = freezed,
    Object? dateTime = freezed,
    Object? note = freezed,
    Object? imagesPathList = freezed,
    Object? tcsSales = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: billNo == freezed
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String,
      companyModel: companyModel == freezed
          ? _value.companyModel
          : companyModel // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      isNormalPurchaseBill: isNormalPurchaseBill == freezed
          ? _value.isNormalPurchaseBill
          : isNormalPurchaseBill // ignore: cast_nullable_to_non_nullable
              as bool?,
      lorryFright: lorryFright == freezed
          ? _value.lorryFright
          : lorryFright // ignore: cast_nullable_to_non_nullable
              as double?,
      lorryFrightTax: lorryFrightTax == freezed
          ? _value.lorryFrightTax
          : lorryFrightTax // ignore: cast_nullable_to_non_nullable
              as double?,
      lorryFrightTotal: lorryFrightTotal == freezed
          ? _value.lorryFrightTotal
          : lorryFrightTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      productList: productList == freezed
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<PurchaseProductModel>,
      paymentsIdList: paymentsIdList == freezed
          ? _value.paymentsIdList
          : paymentsIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isTax: isTax == freezed
          ? _value.isTax
          : isTax // ignore: cast_nullable_to_non_nullable
              as bool,
      grandTotal: grandTotal == freezed
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      forwardingSales: forwardingSales == freezed
          ? _value.forwardingSales
          : forwardingSales // ignore: cast_nullable_to_non_nullable
              as double?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesPathList: imagesPathList == freezed
          ? _value.imagesPathList
          : imagesPathList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tcsSales: tcsSales == freezed
          ? _value.tcsSales
          : tcsSales // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $CompanyModelCopyWith<$Res> get companyModel {
    return $CompanyModelCopyWith<$Res>(_value.companyModel, (value) {
      return _then(_value.copyWith(companyModel: value));
    });
  }
}

/// @nodoc
abstract class _$PurchaseModelCopyWith<$Res>
    implements $PurchaseModelCopyWith<$Res> {
  factory _$PurchaseModelCopyWith(
          _PurchaseModel value, $Res Function(_PurchaseModel) then) =
      __$PurchaseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String billNo,
      CompanyModel companyModel,
      bool? isNormalPurchaseBill,
      double? lorryFright,
      double? lorryFrightTax,
      double? lorryFrightTotal,
      List<PurchaseProductModel> productList,
      List<String> paymentsIdList,
      bool isTax,
      double grandTotal,
      double? forwardingSales,
      DateTime dateTime,
      String? note,
      List<String>? imagesPathList,
      double? tcsSales,
      DateTime createdAt});

  @override
  $CompanyModelCopyWith<$Res> get companyModel;
}

/// @nodoc
class __$PurchaseModelCopyWithImpl<$Res>
    extends _$PurchaseModelCopyWithImpl<$Res>
    implements _$PurchaseModelCopyWith<$Res> {
  __$PurchaseModelCopyWithImpl(
      _PurchaseModel _value, $Res Function(_PurchaseModel) _then)
      : super(_value, (v) => _then(v as _PurchaseModel));

  @override
  _PurchaseModel get _value => super._value as _PurchaseModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? billNo = freezed,
    Object? companyModel = freezed,
    Object? isNormalPurchaseBill = freezed,
    Object? lorryFright = freezed,
    Object? lorryFrightTax = freezed,
    Object? lorryFrightTotal = freezed,
    Object? productList = freezed,
    Object? paymentsIdList = freezed,
    Object? isTax = freezed,
    Object? grandTotal = freezed,
    Object? forwardingSales = freezed,
    Object? dateTime = freezed,
    Object? note = freezed,
    Object? imagesPathList = freezed,
    Object? tcsSales = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_PurchaseModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: billNo == freezed
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String,
      companyModel: companyModel == freezed
          ? _value.companyModel
          : companyModel // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      isNormalPurchaseBill: isNormalPurchaseBill == freezed
          ? _value.isNormalPurchaseBill
          : isNormalPurchaseBill // ignore: cast_nullable_to_non_nullable
              as bool?,
      lorryFright: lorryFright == freezed
          ? _value.lorryFright
          : lorryFright // ignore: cast_nullable_to_non_nullable
              as double?,
      lorryFrightTax: lorryFrightTax == freezed
          ? _value.lorryFrightTax
          : lorryFrightTax // ignore: cast_nullable_to_non_nullable
              as double?,
      lorryFrightTotal: lorryFrightTotal == freezed
          ? _value.lorryFrightTotal
          : lorryFrightTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      productList: productList == freezed
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<PurchaseProductModel>,
      paymentsIdList: paymentsIdList == freezed
          ? _value.paymentsIdList
          : paymentsIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isTax: isTax == freezed
          ? _value.isTax
          : isTax // ignore: cast_nullable_to_non_nullable
              as bool,
      grandTotal: grandTotal == freezed
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      forwardingSales: forwardingSales == freezed
          ? _value.forwardingSales
          : forwardingSales // ignore: cast_nullable_to_non_nullable
              as double?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesPathList: imagesPathList == freezed
          ? _value.imagesPathList
          : imagesPathList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tcsSales: tcsSales == freezed
          ? _value.tcsSales
          : tcsSales // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PurchaseModel implements _PurchaseModel {
  _$_PurchaseModel(
      {required this.id,
      required this.billNo,
      required this.companyModel,
      required this.isNormalPurchaseBill,
      required this.lorryFright,
      required this.lorryFrightTax,
      required this.lorryFrightTotal,
      required this.productList,
      this.paymentsIdList = const [],
      this.isTax = true,
      required this.grandTotal,
      this.forwardingSales,
      required this.dateTime,
      this.note,
      this.imagesPathList,
      this.tcsSales,
      required this.createdAt});

  factory _$_PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$$_PurchaseModelFromJson(json);

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
  final List<PurchaseProductModel> productList;
  @JsonKey()
  @override
  final List<String> paymentsIdList;
  @JsonKey()
  @override
  final bool isTax;
  @override
  final double grandTotal;
  @override
  final double? forwardingSales;
  @override
  final DateTime dateTime;
  @override
  final String? note;
  @override
  final List<String>? imagesPathList;
  @override
  final double? tcsSales;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'PurchaseModel(id: $id, billNo: $billNo, companyModel: $companyModel, isNormalPurchaseBill: $isNormalPurchaseBill, lorryFright: $lorryFright, lorryFrightTax: $lorryFrightTax, lorryFrightTotal: $lorryFrightTotal, productList: $productList, paymentsIdList: $paymentsIdList, isTax: $isTax, grandTotal: $grandTotal, forwardingSales: $forwardingSales, dateTime: $dateTime, note: $note, imagesPathList: $imagesPathList, tcsSales: $tcsSales, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.billNo, billNo) &&
            const DeepCollectionEquality()
                .equals(other.companyModel, companyModel) &&
            const DeepCollectionEquality()
                .equals(other.isNormalPurchaseBill, isNormalPurchaseBill) &&
            const DeepCollectionEquality()
                .equals(other.lorryFright, lorryFright) &&
            const DeepCollectionEquality()
                .equals(other.lorryFrightTax, lorryFrightTax) &&
            const DeepCollectionEquality()
                .equals(other.lorryFrightTotal, lorryFrightTotal) &&
            const DeepCollectionEquality()
                .equals(other.productList, productList) &&
            const DeepCollectionEquality()
                .equals(other.paymentsIdList, paymentsIdList) &&
            const DeepCollectionEquality().equals(other.isTax, isTax) &&
            const DeepCollectionEquality()
                .equals(other.grandTotal, grandTotal) &&
            const DeepCollectionEquality()
                .equals(other.forwardingSales, forwardingSales) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality()
                .equals(other.imagesPathList, imagesPathList) &&
            const DeepCollectionEquality().equals(other.tcsSales, tcsSales) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(billNo),
      const DeepCollectionEquality().hash(companyModel),
      const DeepCollectionEquality().hash(isNormalPurchaseBill),
      const DeepCollectionEquality().hash(lorryFright),
      const DeepCollectionEquality().hash(lorryFrightTax),
      const DeepCollectionEquality().hash(lorryFrightTotal),
      const DeepCollectionEquality().hash(productList),
      const DeepCollectionEquality().hash(paymentsIdList),
      const DeepCollectionEquality().hash(isTax),
      const DeepCollectionEquality().hash(grandTotal),
      const DeepCollectionEquality().hash(forwardingSales),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(imagesPathList),
      const DeepCollectionEquality().hash(tcsSales),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$PurchaseModelCopyWith<_PurchaseModel> get copyWith =>
      __$PurchaseModelCopyWithImpl<_PurchaseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PurchaseModelToJson(this);
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
      required List<PurchaseProductModel> productList,
      List<String> paymentsIdList,
      bool isTax,
      required double grandTotal,
      double? forwardingSales,
      required DateTime dateTime,
      String? note,
      List<String>? imagesPathList,
      double? tcsSales,
      required DateTime createdAt}) = _$_PurchaseModel;

  factory _PurchaseModel.fromJson(Map<String, dynamic> json) =
      _$_PurchaseModel.fromJson;

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
  _$PurchaseModelCopyWith<_PurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
