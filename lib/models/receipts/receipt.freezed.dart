// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) {
  return _ReceiptModel.fromJson(json);
}

/// @nodoc
mixin _$ReceiptModel {
  String get id => throw _privateConstructorUsedError;
  String get receiptNo => throw _privateConstructorUsedError;
  String? get billNo => throw _privateConstructorUsedError;
  double get givenAmount => throw _privateConstructorUsedError;
  double get pendingAmount => throw _privateConstructorUsedError;
  double get advanceAmount => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String? get receivedFrom => throw _privateConstructorUsedError;
  String? get paymentFor => throw _privateConstructorUsedError;
  CustomerModel get customerModel => throw _privateConstructorUsedError;
  String get paymentId => throw _privateConstructorUsedError;
  bool get isAdvance => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptModelCopyWith<ReceiptModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptModelCopyWith<$Res> {
  factory $ReceiptModelCopyWith(
          ReceiptModel value, $Res Function(ReceiptModel) then) =
      _$ReceiptModelCopyWithImpl<$Res, ReceiptModel>;
  @useResult
  $Res call(
      {String id,
      String receiptNo,
      String? billNo,
      double givenAmount,
      double pendingAmount,
      double advanceAmount,
      String paymentMethod,
      String? receivedFrom,
      String? paymentFor,
      CustomerModel customerModel,
      String paymentId,
      bool isAdvance,
      DateTime createdAt});

  $CustomerModelCopyWith<$Res> get customerModel;
}

/// @nodoc
class _$ReceiptModelCopyWithImpl<$Res, $Val extends ReceiptModel>
    implements $ReceiptModelCopyWith<$Res> {
  _$ReceiptModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiptNo = null,
    Object? billNo = freezed,
    Object? givenAmount = null,
    Object? pendingAmount = null,
    Object? advanceAmount = null,
    Object? paymentMethod = null,
    Object? receivedFrom = freezed,
    Object? paymentFor = freezed,
    Object? customerModel = null,
    Object? paymentId = null,
    Object? isAdvance = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiptNo: null == receiptNo
          ? _value.receiptNo
          : receiptNo // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: freezed == billNo
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String?,
      givenAmount: null == givenAmount
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      pendingAmount: null == pendingAmount
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      advanceAmount: null == advanceAmount
          ? _value.advanceAmount
          : advanceAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFrom: freezed == receivedFrom
          ? _value.receivedFrom
          : receivedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentFor: freezed == paymentFor
          ? _value.paymentFor
          : paymentFor // ignore: cast_nullable_to_non_nullable
              as String?,
      customerModel: null == customerModel
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      isAdvance: null == isAdvance
          ? _value.isAdvance
          : isAdvance // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$ReceiptModelImplCopyWith<$Res>
    implements $ReceiptModelCopyWith<$Res> {
  factory _$$ReceiptModelImplCopyWith(
          _$ReceiptModelImpl value, $Res Function(_$ReceiptModelImpl) then) =
      __$$ReceiptModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String receiptNo,
      String? billNo,
      double givenAmount,
      double pendingAmount,
      double advanceAmount,
      String paymentMethod,
      String? receivedFrom,
      String? paymentFor,
      CustomerModel customerModel,
      String paymentId,
      bool isAdvance,
      DateTime createdAt});

  @override
  $CustomerModelCopyWith<$Res> get customerModel;
}

/// @nodoc
class __$$ReceiptModelImplCopyWithImpl<$Res>
    extends _$ReceiptModelCopyWithImpl<$Res, _$ReceiptModelImpl>
    implements _$$ReceiptModelImplCopyWith<$Res> {
  __$$ReceiptModelImplCopyWithImpl(
      _$ReceiptModelImpl _value, $Res Function(_$ReceiptModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiptNo = null,
    Object? billNo = freezed,
    Object? givenAmount = null,
    Object? pendingAmount = null,
    Object? advanceAmount = null,
    Object? paymentMethod = null,
    Object? receivedFrom = freezed,
    Object? paymentFor = freezed,
    Object? customerModel = null,
    Object? paymentId = null,
    Object? isAdvance = null,
    Object? createdAt = null,
  }) {
    return _then(_$ReceiptModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiptNo: null == receiptNo
          ? _value.receiptNo
          : receiptNo // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: freezed == billNo
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String?,
      givenAmount: null == givenAmount
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      pendingAmount: null == pendingAmount
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      advanceAmount: null == advanceAmount
          ? _value.advanceAmount
          : advanceAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFrom: freezed == receivedFrom
          ? _value.receivedFrom
          : receivedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentFor: freezed == paymentFor
          ? _value.paymentFor
          : paymentFor // ignore: cast_nullable_to_non_nullable
              as String?,
      customerModel: null == customerModel
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      isAdvance: null == isAdvance
          ? _value.isAdvance
          : isAdvance // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ReceiptModelImpl implements _ReceiptModel {
  const _$ReceiptModelImpl(
      {required this.id,
      required this.receiptNo,
      this.billNo,
      required this.givenAmount,
      required this.pendingAmount,
      this.advanceAmount = 0,
      required this.paymentMethod,
      this.receivedFrom,
      this.paymentFor,
      required this.customerModel,
      required this.paymentId,
      this.isAdvance = false,
      required this.createdAt});

  factory _$ReceiptModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptModelImplFromJson(json);

  @override
  final String id;
  @override
  final String receiptNo;
  @override
  final String? billNo;
  @override
  final double givenAmount;
  @override
  final double pendingAmount;
  @override
  @JsonKey()
  final double advanceAmount;
  @override
  final String paymentMethod;
  @override
  final String? receivedFrom;
  @override
  final String? paymentFor;
  @override
  final CustomerModel customerModel;
  @override
  final String paymentId;
  @override
  @JsonKey()
  final bool isAdvance;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ReceiptModel(id: $id, receiptNo: $receiptNo, billNo: $billNo, givenAmount: $givenAmount, pendingAmount: $pendingAmount, advanceAmount: $advanceAmount, paymentMethod: $paymentMethod, receivedFrom: $receivedFrom, paymentFor: $paymentFor, customerModel: $customerModel, paymentId: $paymentId, isAdvance: $isAdvance, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receiptNo, receiptNo) ||
                other.receiptNo == receiptNo) &&
            (identical(other.billNo, billNo) || other.billNo == billNo) &&
            (identical(other.givenAmount, givenAmount) ||
                other.givenAmount == givenAmount) &&
            (identical(other.pendingAmount, pendingAmount) ||
                other.pendingAmount == pendingAmount) &&
            (identical(other.advanceAmount, advanceAmount) ||
                other.advanceAmount == advanceAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.receivedFrom, receivedFrom) ||
                other.receivedFrom == receivedFrom) &&
            (identical(other.paymentFor, paymentFor) ||
                other.paymentFor == paymentFor) &&
            (identical(other.customerModel, customerModel) ||
                other.customerModel == customerModel) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.isAdvance, isAdvance) ||
                other.isAdvance == isAdvance) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      receiptNo,
      billNo,
      givenAmount,
      pendingAmount,
      advanceAmount,
      paymentMethod,
      receivedFrom,
      paymentFor,
      customerModel,
      paymentId,
      isAdvance,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptModelImplCopyWith<_$ReceiptModelImpl> get copyWith =>
      __$$ReceiptModelImplCopyWithImpl<_$ReceiptModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptModelImplToJson(
      this,
    );
  }
}

abstract class _ReceiptModel implements ReceiptModel {
  const factory _ReceiptModel(
      {required final String id,
      required final String receiptNo,
      final String? billNo,
      required final double givenAmount,
      required final double pendingAmount,
      final double advanceAmount,
      required final String paymentMethod,
      final String? receivedFrom,
      final String? paymentFor,
      required final CustomerModel customerModel,
      required final String paymentId,
      final bool isAdvance,
      required final DateTime createdAt}) = _$ReceiptModelImpl;

  factory _ReceiptModel.fromJson(Map<String, dynamic> json) =
      _$ReceiptModelImpl.fromJson;

  @override
  String get id;
  @override
  String get receiptNo;
  @override
  String? get billNo;
  @override
  double get givenAmount;
  @override
  double get pendingAmount;
  @override
  double get advanceAmount;
  @override
  String get paymentMethod;
  @override
  String? get receivedFrom;
  @override
  String? get paymentFor;
  @override
  CustomerModel get customerModel;
  @override
  String get paymentId;
  @override
  bool get isAdvance;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ReceiptModelImplCopyWith<_$ReceiptModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
