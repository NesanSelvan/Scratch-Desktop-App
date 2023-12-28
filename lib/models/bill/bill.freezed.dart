// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BillModel _$BillModelFromJson(Map<String, dynamic> json) {
  return _BillModel.fromJson(json);
}

/// @nodoc
mixin _$BillModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get billNo => throw _privateConstructorUsedError;
  set billNo(String value) => throw _privateConstructorUsedError;
  String? get borrowId => throw _privateConstructorUsedError;
  set borrowId(String? value) => throw _privateConstructorUsedError;
  CustomerModel get customerModel => throw _privateConstructorUsedError;
  set customerModel(CustomerModel value) => throw _privateConstructorUsedError;
  double? get givenAmount => throw _privateConstructorUsedError;
  set givenAmount(double? value) => throw _privateConstructorUsedError;
  bool? get isPaid => throw _privateConstructorUsedError;
  set isPaid(bool? value) => throw _privateConstructorUsedError;
  bool? get isTax => throw _privateConstructorUsedError;
  set isTax(bool? value) => throw _privateConstructorUsedError;
  String? get paidId => throw _privateConstructorUsedError;
  set paidId(String? value) => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  set price(double value) => throw _privateConstructorUsedError;
  List<SalesProductModel>? get productList =>
      throw _privateConstructorUsedError;
  set productList(List<SalesProductModel>? value) =>
      throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  set dateTime(DateTime value) => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  set discount(double? value) => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  set note(String? value) => throw _privateConstructorUsedError;
  String? get supplierRef => throw _privateConstructorUsedError;
  set supplierRef(String? value) => throw _privateConstructorUsedError;
  String? get buyerOrderNo => throw _privateConstructorUsedError;
  set buyerOrderNo(String? value) => throw _privateConstructorUsedError;
  DateTime? get buyerOrderDate => throw _privateConstructorUsedError;
  set buyerOrderDate(DateTime? value) => throw _privateConstructorUsedError;
  String? get dispatchDocumentNo => throw _privateConstructorUsedError;
  set dispatchDocumentNo(String? value) => throw _privateConstructorUsedError;
  String? get dispatchThrough => throw _privateConstructorUsedError;
  set dispatchThrough(String? value) => throw _privateConstructorUsedError;
  String? get destination => throw _privateConstructorUsedError;
  set destination(String? value) => throw _privateConstructorUsedError;
  bool? get isA4Printed => throw _privateConstructorUsedError;
  set isA4Printed(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillModelCopyWith<BillModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillModelCopyWith<$Res> {
  factory $BillModelCopyWith(BillModel value, $Res Function(BillModel) then) =
      _$BillModelCopyWithImpl<$Res, BillModel>;
  @useResult
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
class _$BillModelCopyWithImpl<$Res, $Val extends BillModel>
    implements $BillModelCopyWith<$Res> {
  _$BillModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billNo = null,
    Object? borrowId = freezed,
    Object? customerModel = null,
    Object? givenAmount = freezed,
    Object? isPaid = freezed,
    Object? isTax = freezed,
    Object? paidId = freezed,
    Object? price = null,
    Object? productList = freezed,
    Object? dateTime = null,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: null == billNo
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String,
      borrowId: freezed == borrowId
          ? _value.borrowId
          : borrowId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerModel: null == customerModel
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      givenAmount: freezed == givenAmount
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTax: freezed == isTax
          ? _value.isTax
          : isTax // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidId: freezed == paidId
          ? _value.paidId
          : paidId // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      productList: freezed == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<SalesProductModel>?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierRef: freezed == supplierRef
          ? _value.supplierRef
          : supplierRef // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerOrderNo: freezed == buyerOrderNo
          ? _value.buyerOrderNo
          : buyerOrderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerOrderDate: freezed == buyerOrderDate
          ? _value.buyerOrderDate
          : buyerOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dispatchDocumentNo: freezed == dispatchDocumentNo
          ? _value.dispatchDocumentNo
          : dispatchDocumentNo // ignore: cast_nullable_to_non_nullable
              as String?,
      dispatchThrough: freezed == dispatchThrough
          ? _value.dispatchThrough
          : dispatchThrough // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      isA4Printed: freezed == isA4Printed
          ? _value.isA4Printed
          : isA4Printed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerModelCopyWith<$Res> get customerModel {
    return $CustomerModelCopyWith<$Res>(_value.customerModel, (value) {
      return _then(_value.copyWith(customerModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BillModelImplCopyWith<$Res>
    implements $BillModelCopyWith<$Res> {
  factory _$$BillModelImplCopyWith(
          _$BillModelImpl value, $Res Function(_$BillModelImpl) then) =
      __$$BillModelImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$BillModelImplCopyWithImpl<$Res>
    extends _$BillModelCopyWithImpl<$Res, _$BillModelImpl>
    implements _$$BillModelImplCopyWith<$Res> {
  __$$BillModelImplCopyWithImpl(
      _$BillModelImpl _value, $Res Function(_$BillModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billNo = null,
    Object? borrowId = freezed,
    Object? customerModel = null,
    Object? givenAmount = freezed,
    Object? isPaid = freezed,
    Object? isTax = freezed,
    Object? paidId = freezed,
    Object? price = null,
    Object? productList = freezed,
    Object? dateTime = null,
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
    return _then(_$BillModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: null == billNo
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String,
      borrowId: freezed == borrowId
          ? _value.borrowId
          : borrowId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerModel: null == customerModel
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      givenAmount: freezed == givenAmount
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTax: freezed == isTax
          ? _value.isTax
          : isTax // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidId: freezed == paidId
          ? _value.paidId
          : paidId // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      productList: freezed == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<SalesProductModel>?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierRef: freezed == supplierRef
          ? _value.supplierRef
          : supplierRef // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerOrderNo: freezed == buyerOrderNo
          ? _value.buyerOrderNo
          : buyerOrderNo // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerOrderDate: freezed == buyerOrderDate
          ? _value.buyerOrderDate
          : buyerOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dispatchDocumentNo: freezed == dispatchDocumentNo
          ? _value.dispatchDocumentNo
          : dispatchDocumentNo // ignore: cast_nullable_to_non_nullable
              as String?,
      dispatchThrough: freezed == dispatchThrough
          ? _value.dispatchThrough
          : dispatchThrough // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      isA4Printed: freezed == isA4Printed
          ? _value.isA4Printed
          : isA4Printed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BillModelImpl implements _BillModel {
  _$BillModelImpl(
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

  factory _$BillModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillModelImplFromJson(json);

  @override
  String id;
  @override
  String billNo;
  @override
  String? borrowId;
  @override
  CustomerModel customerModel;
  @override
  @JsonKey()
  double? givenAmount;
  @override
  @JsonKey()
  bool? isPaid;
  @override
  @JsonKey()
  bool? isTax;
  @override
  @JsonKey()
  String? paidId;
  @override
  double price;
  @override
  List<SalesProductModel>? productList;
  @override
  DateTime dateTime;
  @override
  @JsonKey()
  double? discount;
  @override
  @JsonKey()
  String? note;
  @override
  @JsonKey()
  String? supplierRef;
  @override
  @JsonKey()
  String? buyerOrderNo;
  @override
  DateTime? buyerOrderDate;
  @override
  @JsonKey()
  String? dispatchDocumentNo;
  @override
  @JsonKey()
  String? dispatchThrough;
  @override
  @JsonKey()
  String? destination;
  @override
  @JsonKey()
  bool? isA4Printed;

  @override
  String toString() {
    return 'BillModel(id: $id, billNo: $billNo, borrowId: $borrowId, customerModel: $customerModel, givenAmount: $givenAmount, isPaid: $isPaid, isTax: $isTax, paidId: $paidId, price: $price, productList: $productList, dateTime: $dateTime, discount: $discount, note: $note, supplierRef: $supplierRef, buyerOrderNo: $buyerOrderNo, buyerOrderDate: $buyerOrderDate, dispatchDocumentNo: $dispatchDocumentNo, dispatchThrough: $dispatchThrough, destination: $destination, isA4Printed: $isA4Printed)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillModelImplCopyWith<_$BillModelImpl> get copyWith =>
      __$$BillModelImplCopyWithImpl<_$BillModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillModelImplToJson(
      this,
    );
  }
}

abstract class _BillModel implements BillModel {
  factory _BillModel(
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
      bool? isA4Printed}) = _$BillModelImpl;

  factory _BillModel.fromJson(Map<String, dynamic> json) =
      _$BillModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get billNo;
  set billNo(String value);
  @override
  String? get borrowId;
  set borrowId(String? value);
  @override
  CustomerModel get customerModel;
  set customerModel(CustomerModel value);
  @override
  double? get givenAmount;
  set givenAmount(double? value);
  @override
  bool? get isPaid;
  set isPaid(bool? value);
  @override
  bool? get isTax;
  set isTax(bool? value);
  @override
  String? get paidId;
  set paidId(String? value);
  @override
  double get price;
  set price(double value);
  @override
  List<SalesProductModel>? get productList;
  set productList(List<SalesProductModel>? value);
  @override
  DateTime get dateTime;
  set dateTime(DateTime value);
  @override
  double? get discount;
  set discount(double? value);
  @override
  String? get note;
  set note(String? value);
  @override
  String? get supplierRef;
  set supplierRef(String? value);
  @override
  String? get buyerOrderNo;
  set buyerOrderNo(String? value);
  @override
  DateTime? get buyerOrderDate;
  set buyerOrderDate(DateTime? value);
  @override
  String? get dispatchDocumentNo;
  set dispatchDocumentNo(String? value);
  @override
  String? get dispatchThrough;
  set dispatchThrough(String? value);
  @override
  String? get destination;
  set destination(String? value);
  @override
  bool? get isA4Printed;
  set isA4Printed(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$BillModelImplCopyWith<_$BillModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
