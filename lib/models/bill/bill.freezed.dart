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
          ? _value._productList
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
  const _$BillModelImpl(
      {required this.id,
      required this.billNo,
      this.borrowId,
      required this.customerModel,
      this.givenAmount = 0,
      this.isPaid = false,
      this.isTax = true,
      this.paidId = "",
      required this.price,
      required final List<SalesProductModel>? productList,
      required this.dateTime,
      this.discount = 0,
      this.note = "",
      this.supplierRef = "",
      this.buyerOrderNo = "",
      this.buyerOrderDate,
      this.dispatchDocumentNo = "",
      this.dispatchThrough = "",
      this.destination = "",
      this.isA4Printed = false})
      : _productList = productList;

  factory _$BillModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillModelImplFromJson(json);

  @override
  final String id;
  @override
  final String billNo;
  @override
  final String? borrowId;
  @override
  final CustomerModel customerModel;
  @override
  @JsonKey()
  final double? givenAmount;
  @override
  @JsonKey()
  final bool? isPaid;
  @override
  @JsonKey()
  final bool? isTax;
  @override
  @JsonKey()
  final String? paidId;
  @override
  final double price;
  final List<SalesProductModel>? _productList;
  @override
  List<SalesProductModel>? get productList {
    final value = _productList;
    if (value == null) return null;
    if (_productList is EqualUnmodifiableListView) return _productList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime dateTime;
  @override
  @JsonKey()
  final double? discount;
  @override
  @JsonKey()
  final String? note;
  @override
  @JsonKey()
  final String? supplierRef;
  @override
  @JsonKey()
  final String? buyerOrderNo;
  @override
  final DateTime? buyerOrderDate;
  @override
  @JsonKey()
  final String? dispatchDocumentNo;
  @override
  @JsonKey()
  final String? dispatchThrough;
  @override
  @JsonKey()
  final String? destination;
  @override
  @JsonKey()
  final bool? isA4Printed;

  @override
  String toString() {
    return 'BillModel(id: $id, billNo: $billNo, borrowId: $borrowId, customerModel: $customerModel, givenAmount: $givenAmount, isPaid: $isPaid, isTax: $isTax, paidId: $paidId, price: $price, productList: $productList, dateTime: $dateTime, discount: $discount, note: $note, supplierRef: $supplierRef, buyerOrderNo: $buyerOrderNo, buyerOrderDate: $buyerOrderDate, dispatchDocumentNo: $dispatchDocumentNo, dispatchThrough: $dispatchThrough, destination: $destination, isA4Printed: $isA4Printed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.billNo, billNo) || other.billNo == billNo) &&
            (identical(other.borrowId, borrowId) ||
                other.borrowId == borrowId) &&
            (identical(other.customerModel, customerModel) ||
                other.customerModel == customerModel) &&
            (identical(other.givenAmount, givenAmount) ||
                other.givenAmount == givenAmount) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.isTax, isTax) || other.isTax == isTax) &&
            (identical(other.paidId, paidId) || other.paidId == paidId) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.supplierRef, supplierRef) ||
                other.supplierRef == supplierRef) &&
            (identical(other.buyerOrderNo, buyerOrderNo) ||
                other.buyerOrderNo == buyerOrderNo) &&
            (identical(other.buyerOrderDate, buyerOrderDate) ||
                other.buyerOrderDate == buyerOrderDate) &&
            (identical(other.dispatchDocumentNo, dispatchDocumentNo) ||
                other.dispatchDocumentNo == dispatchDocumentNo) &&
            (identical(other.dispatchThrough, dispatchThrough) ||
                other.dispatchThrough == dispatchThrough) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.isA4Printed, isA4Printed) ||
                other.isA4Printed == isA4Printed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        billNo,
        borrowId,
        customerModel,
        givenAmount,
        isPaid,
        isTax,
        paidId,
        price,
        const DeepCollectionEquality().hash(_productList),
        dateTime,
        discount,
        note,
        supplierRef,
        buyerOrderNo,
        buyerOrderDate,
        dispatchDocumentNo,
        dispatchThrough,
        destination,
        isA4Printed
      ]);

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
  const factory _BillModel(
      {required final String id,
      required final String billNo,
      final String? borrowId,
      required final CustomerModel customerModel,
      final double? givenAmount,
      final bool? isPaid,
      final bool? isTax,
      final String? paidId,
      required final double price,
      required final List<SalesProductModel>? productList,
      required final DateTime dateTime,
      final double? discount,
      final String? note,
      final String? supplierRef,
      final String? buyerOrderNo,
      final DateTime? buyerOrderDate,
      final String? dispatchDocumentNo,
      final String? dispatchThrough,
      final String? destination,
      final bool? isA4Printed}) = _$BillModelImpl;

  factory _BillModel.fromJson(Map<String, dynamic> json) =
      _$BillModelImpl.fromJson;

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
  _$$BillModelImplCopyWith<_$BillModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
