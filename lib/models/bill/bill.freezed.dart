// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BillModel _$BillModelFromJson(Map<String, dynamic> json) {
  return _BillModel.fromJson(json);
}

/// @nodoc
class _$BillModelTearOff {
  const _$BillModelTearOff();

  _BillModel call(
      {required String id,
      required String billNo,
      String? borrowId,
      required CustomerModel customerModel,
      double? givenAmount = 0,
      bool? isPaid = false,
      bool? isTax = true,
      String? paidId = "",
      required double price,
      required List<SalesProductModel>? productList,
      required DateTime dateTime,
      double? discount = 0,
      String? note = "",
      String? supplierRef = "",
      String? buyerOrderNo = "",
      DateTime? buyerOrderDate,
      String? dispatchDocumentNo = "",
      String? dispatchThrough = "",
      String? destination = "",
      bool? isA4Printed = false}) {
    return _BillModel(
      id: id,
      billNo: billNo,
      borrowId: borrowId,
      customerModel: customerModel,
      givenAmount: givenAmount,
      isPaid: isPaid,
      isTax: isTax,
      paidId: paidId,
      price: price,
      productList: productList,
      dateTime: dateTime,
      discount: discount,
      note: note,
      supplierRef: supplierRef,
      buyerOrderNo: buyerOrderNo,
      buyerOrderDate: buyerOrderDate,
      dispatchDocumentNo: dispatchDocumentNo,
      dispatchThrough: dispatchThrough,
      destination: destination,
      isA4Printed: isA4Printed,
    );
  }

  BillModel fromJson(Map<String, Object?> json) {
    return BillModel.fromJson(json);
  }
}

/// @nodoc
const $BillModel = _$BillModelTearOff();

/// @nodoc
mixin _$BillModel {
  String get id => throw _privateConstructorUsedError;
  String get billNo => throw _privateConstructorUsedError;
  String? get borrowId => throw _privateConstructorUsedError;
  CustomerModel get customerModel => throw _privateConstructorUsedError;
  double? get givenAmount => throw _privateConstructorUsedError;
  bool? get isPaid => throw _privateConstructorUsedError;
  bool? get isTax => throw _privateConstructorUsedError;
  String? get paidId => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<SalesProductModel>? get productList =>
      throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get supplierRef => throw _privateConstructorUsedError;
  String? get buyerOrderNo => throw _privateConstructorUsedError;
  DateTime? get buyerOrderDate => throw _privateConstructorUsedError;
  String? get dispatchDocumentNo => throw _privateConstructorUsedError;
  String? get dispatchThrough => throw _privateConstructorUsedError;
  String? get destination => throw _privateConstructorUsedError;
  bool? get isA4Printed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillModelCopyWith<BillModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillModelCopyWith<$Res> {
  factory $BillModelCopyWith(BillModel value, $Res Function(BillModel) then) =
      _$BillModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String billNo,
      String? borrowId,
      CustomerModel customerModel,
      double? givenAmount,
      bool? isPaid,
      bool? isTax,
      String? paidId,
      double price,
      List<SalesProductModel>? productList,
      DateTime dateTime,
      double? discount,
      String? note,
      String? supplierRef,
      String? buyerOrderNo,
      DateTime? buyerOrderDate,
      String? dispatchDocumentNo,
      String? dispatchThrough,
      String? destination,
      bool? isA4Printed});

  $CustomerModelCopyWith<$Res> get customerModel;
}

/// @nodoc
class _$BillModelCopyWithImpl<$Res> implements $BillModelCopyWith<$Res> {
  _$BillModelCopyWithImpl(this._value, this._then);

  final BillModel _value;
  // ignore: unused_field
  final $Res Function(BillModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? billNo = freezed,
    Object? borrowId = freezed,
    Object? customerModel = freezed,
    Object? givenAmount = freezed,
    Object? isPaid = freezed,
    Object? isTax = freezed,
    Object? paidId = freezed,
    Object? price = freezed,
    Object? productList = freezed,
    Object? dateTime = freezed,
    Object? discount = freezed,
    Object? note = freezed,
    Object? supplierRef = freezed,
    Object? buyerOrderNo = freezed,
    Object? buyerOrderDate = freezed,
    Object? dispatchDocumentNo = freezed,
    Object? dispatchThrough = freezed,
    Object? destination = freezed,
    Object? isA4Printed = freezed,
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
      borrowId: borrowId == freezed
          ? _value.borrowId
          : borrowId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerModel: customerModel == freezed
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      givenAmount: givenAmount == freezed
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      isPaid: isPaid == freezed
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTax: isTax == freezed
          ? _value.isTax
          : isTax // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidId: paidId == freezed
          ? _value.paidId
          : paidId // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      productList: productList == freezed
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<SalesProductModel>?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierRef: supplierRef == freezed
          ? _value.supplierRef
          : supplierRef // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerOrderNo: buyerOrderNo == freezed
          ? _value.buyerOrderNo
          : buyerOrderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerOrderDate: buyerOrderDate == freezed
          ? _value.buyerOrderDate
          : buyerOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dispatchDocumentNo: dispatchDocumentNo == freezed
          ? _value.dispatchDocumentNo
          : dispatchDocumentNo // ignore: cast_nullable_to_non_nullable
              as String?,
      dispatchThrough: dispatchThrough == freezed
          ? _value.dispatchThrough
          : dispatchThrough // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: destination == freezed
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      isA4Printed: isA4Printed == freezed
          ? _value.isA4Printed
          : isA4Printed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $CustomerModelCopyWith<$Res> get customerModel {
    return $CustomerModelCopyWith<$Res>(_value.customerModel, (value) {
      return _then(_value.copyWith(customerModel: value));
    });
  }
}

/// @nodoc
abstract class _$BillModelCopyWith<$Res> implements $BillModelCopyWith<$Res> {
  factory _$BillModelCopyWith(
          _BillModel value, $Res Function(_BillModel) then) =
      __$BillModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String billNo,
      String? borrowId,
      CustomerModel customerModel,
      double? givenAmount,
      bool? isPaid,
      bool? isTax,
      String? paidId,
      double price,
      List<SalesProductModel>? productList,
      DateTime dateTime,
      double? discount,
      String? note,
      String? supplierRef,
      String? buyerOrderNo,
      DateTime? buyerOrderDate,
      String? dispatchDocumentNo,
      String? dispatchThrough,
      String? destination,
      bool? isA4Printed});

  @override
  $CustomerModelCopyWith<$Res> get customerModel;
}

/// @nodoc
class __$BillModelCopyWithImpl<$Res> extends _$BillModelCopyWithImpl<$Res>
    implements _$BillModelCopyWith<$Res> {
  __$BillModelCopyWithImpl(_BillModel _value, $Res Function(_BillModel) _then)
      : super(_value, (v) => _then(v as _BillModel));

  @override
  _BillModel get _value => super._value as _BillModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? billNo = freezed,
    Object? borrowId = freezed,
    Object? customerModel = freezed,
    Object? givenAmount = freezed,
    Object? isPaid = freezed,
    Object? isTax = freezed,
    Object? paidId = freezed,
    Object? price = freezed,
    Object? productList = freezed,
    Object? dateTime = freezed,
    Object? discount = freezed,
    Object? note = freezed,
    Object? supplierRef = freezed,
    Object? buyerOrderNo = freezed,
    Object? buyerOrderDate = freezed,
    Object? dispatchDocumentNo = freezed,
    Object? dispatchThrough = freezed,
    Object? destination = freezed,
    Object? isA4Printed = freezed,
  }) {
    return _then(_BillModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: billNo == freezed
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String,
      borrowId: borrowId == freezed
          ? _value.borrowId
          : borrowId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerModel: customerModel == freezed
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      givenAmount: givenAmount == freezed
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      isPaid: isPaid == freezed
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTax: isTax == freezed
          ? _value.isTax
          : isTax // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidId: paidId == freezed
          ? _value.paidId
          : paidId // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      productList: productList == freezed
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<SalesProductModel>?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierRef: supplierRef == freezed
          ? _value.supplierRef
          : supplierRef // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerOrderNo: buyerOrderNo == freezed
          ? _value.buyerOrderNo
          : buyerOrderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerOrderDate: buyerOrderDate == freezed
          ? _value.buyerOrderDate
          : buyerOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dispatchDocumentNo: dispatchDocumentNo == freezed
          ? _value.dispatchDocumentNo
          : dispatchDocumentNo // ignore: cast_nullable_to_non_nullable
              as String?,
      dispatchThrough: dispatchThrough == freezed
          ? _value.dispatchThrough
          : dispatchThrough // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: destination == freezed
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      isA4Printed: isA4Printed == freezed
          ? _value.isA4Printed
          : isA4Printed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BillModel implements _BillModel {
  const _$_BillModel(
      {required this.id,
      required this.billNo,
      this.borrowId,
      required this.customerModel,
      this.givenAmount = 0,
      this.isPaid = false,
      this.isTax = true,
      this.paidId = "",
      required this.price,
      required this.productList,
      required this.dateTime,
      this.discount = 0,
      this.note = "",
      this.supplierRef = "",
      this.buyerOrderNo = "",
      this.buyerOrderDate,
      this.dispatchDocumentNo = "",
      this.dispatchThrough = "",
      this.destination = "",
      this.isA4Printed = false});

  factory _$_BillModel.fromJson(Map<String, dynamic> json) =>
      _$$_BillModelFromJson(json);

  @override
  final String id;
  @override
  final String billNo;
  @override
  final String? borrowId;
  @override
  final CustomerModel customerModel;
  @JsonKey()
  @override
  final double? givenAmount;
  @JsonKey()
  @override
  final bool? isPaid;
  @JsonKey()
  @override
  final bool? isTax;
  @JsonKey()
  @override
  final String? paidId;
  @override
  final double price;
  @override
  final List<SalesProductModel>? productList;
  @override
  final DateTime dateTime;
  @JsonKey()
  @override
  final double? discount;
  @JsonKey()
  @override
  final String? note;
  @JsonKey()
  @override
  final String? supplierRef;
  @JsonKey()
  @override
  final String? buyerOrderNo;
  @override
  final DateTime? buyerOrderDate;
  @JsonKey()
  @override
  final String? dispatchDocumentNo;
  @JsonKey()
  @override
  final String? dispatchThrough;
  @JsonKey()
  @override
  final String? destination;
  @JsonKey()
  @override
  final bool? isA4Printed;

  @override
  String toString() {
    return 'BillModel(id: $id, billNo: $billNo, borrowId: $borrowId, customerModel: $customerModel, givenAmount: $givenAmount, isPaid: $isPaid, isTax: $isTax, paidId: $paidId, price: $price, productList: $productList, dateTime: $dateTime, discount: $discount, note: $note, supplierRef: $supplierRef, buyerOrderNo: $buyerOrderNo, buyerOrderDate: $buyerOrderDate, dispatchDocumentNo: $dispatchDocumentNo, dispatchThrough: $dispatchThrough, destination: $destination, isA4Printed: $isA4Printed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BillModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.billNo, billNo) &&
            const DeepCollectionEquality().equals(other.borrowId, borrowId) &&
            const DeepCollectionEquality()
                .equals(other.customerModel, customerModel) &&
            const DeepCollectionEquality()
                .equals(other.givenAmount, givenAmount) &&
            const DeepCollectionEquality().equals(other.isPaid, isPaid) &&
            const DeepCollectionEquality().equals(other.isTax, isTax) &&
            const DeepCollectionEquality().equals(other.paidId, paidId) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.productList, productList) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.discount, discount) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality()
                .equals(other.supplierRef, supplierRef) &&
            const DeepCollectionEquality()
                .equals(other.buyerOrderNo, buyerOrderNo) &&
            const DeepCollectionEquality()
                .equals(other.buyerOrderDate, buyerOrderDate) &&
            const DeepCollectionEquality()
                .equals(other.dispatchDocumentNo, dispatchDocumentNo) &&
            const DeepCollectionEquality()
                .equals(other.dispatchThrough, dispatchThrough) &&
            const DeepCollectionEquality()
                .equals(other.destination, destination) &&
            const DeepCollectionEquality()
                .equals(other.isA4Printed, isA4Printed));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(billNo),
        const DeepCollectionEquality().hash(borrowId),
        const DeepCollectionEquality().hash(customerModel),
        const DeepCollectionEquality().hash(givenAmount),
        const DeepCollectionEquality().hash(isPaid),
        const DeepCollectionEquality().hash(isTax),
        const DeepCollectionEquality().hash(paidId),
        const DeepCollectionEquality().hash(price),
        const DeepCollectionEquality().hash(productList),
        const DeepCollectionEquality().hash(dateTime),
        const DeepCollectionEquality().hash(discount),
        const DeepCollectionEquality().hash(note),
        const DeepCollectionEquality().hash(supplierRef),
        const DeepCollectionEquality().hash(buyerOrderNo),
        const DeepCollectionEquality().hash(buyerOrderDate),
        const DeepCollectionEquality().hash(dispatchDocumentNo),
        const DeepCollectionEquality().hash(dispatchThrough),
        const DeepCollectionEquality().hash(destination),
        const DeepCollectionEquality().hash(isA4Printed)
      ]);

  @JsonKey(ignore: true)
  @override
  _$BillModelCopyWith<_BillModel> get copyWith =>
      __$BillModelCopyWithImpl<_BillModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BillModelToJson(this);
  }
}

abstract class _BillModel implements BillModel {
  const factory _BillModel(
      {required String id,
      required String billNo,
      String? borrowId,
      required CustomerModel customerModel,
      double? givenAmount,
      bool? isPaid,
      bool? isTax,
      String? paidId,
      required double price,
      required List<SalesProductModel>? productList,
      required DateTime dateTime,
      double? discount,
      String? note,
      String? supplierRef,
      String? buyerOrderNo,
      DateTime? buyerOrderDate,
      String? dispatchDocumentNo,
      String? dispatchThrough,
      String? destination,
      bool? isA4Printed}) = _$_BillModel;

  factory _BillModel.fromJson(Map<String, dynamic> json) =
      _$_BillModel.fromJson;

  @override
  String get id;
  @override
  String get billNo;
  @override
  String? get borrowId;
  @override
  CustomerModel get customerModel;
  @override
  double? get givenAmount;
  @override
  bool? get isPaid;
  @override
  bool? get isTax;
  @override
  String? get paidId;
  @override
  double get price;
  @override
  List<SalesProductModel>? get productList;
  @override
  DateTime get dateTime;
  @override
  double? get discount;
  @override
  String? get note;
  @override
  String? get supplierRef;
  @override
  String? get buyerOrderNo;
  @override
  DateTime? get buyerOrderDate;
  @override
  String? get dispatchDocumentNo;
  @override
  String? get dispatchThrough;
  @override
  String? get destination;
  @override
  bool? get isA4Printed;
  @override
  @JsonKey(ignore: true)
  _$BillModelCopyWith<_BillModel> get copyWith =>
      throw _privateConstructorUsedError;
}
