// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) {
  return _ReceiptModel.fromJson(json);
}

/// @nodoc
class _$ReceiptModelTearOff {
  const _$ReceiptModelTearOff();

  _ReceiptModel call(
      {required String id,
      required String receiptNo,
      String? billNo,
      required double givenAmount,
      required double pendingAmount,
      double advanceAmount = 0,
      required String paymentMethod,
      String? receivedFrom,
      String? paymentFor,
      required CustomerModel customerModel,
      required String paymentId,
      bool isAdvance = false,
      required DateTime createdAt}) {
    return _ReceiptModel(
      id: id,
      receiptNo: receiptNo,
      billNo: billNo,
      givenAmount: givenAmount,
      pendingAmount: pendingAmount,
      advanceAmount: advanceAmount,
      paymentMethod: paymentMethod,
      receivedFrom: receivedFrom,
      paymentFor: paymentFor,
      customerModel: customerModel,
      paymentId: paymentId,
      isAdvance: isAdvance,
      createdAt: createdAt,
    );
  }

  ReceiptModel fromJson(Map<String, Object?> json) {
    return ReceiptModel.fromJson(json);
  }
}

/// @nodoc
const $ReceiptModel = _$ReceiptModelTearOff();

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
      _$ReceiptModelCopyWithImpl<$Res>;
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
class _$ReceiptModelCopyWithImpl<$Res> implements $ReceiptModelCopyWith<$Res> {
  _$ReceiptModelCopyWithImpl(this._value, this._then);

  final ReceiptModel _value;
  // ignore: unused_field
  final $Res Function(ReceiptModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? receiptNo = freezed,
    Object? billNo = freezed,
    Object? givenAmount = freezed,
    Object? pendingAmount = freezed,
    Object? advanceAmount = freezed,
    Object? paymentMethod = freezed,
    Object? receivedFrom = freezed,
    Object? paymentFor = freezed,
    Object? customerModel = freezed,
    Object? paymentId = freezed,
    Object? isAdvance = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiptNo: receiptNo == freezed
          ? _value.receiptNo
          : receiptNo // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: billNo == freezed
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String?,
      givenAmount: givenAmount == freezed
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      pendingAmount: pendingAmount == freezed
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      advanceAmount: advanceAmount == freezed
          ? _value.advanceAmount
          : advanceAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFrom: receivedFrom == freezed
          ? _value.receivedFrom
          : receivedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentFor: paymentFor == freezed
          ? _value.paymentFor
          : paymentFor // ignore: cast_nullable_to_non_nullable
              as String?,
      customerModel: customerModel == freezed
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      paymentId: paymentId == freezed
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      isAdvance: isAdvance == freezed
          ? _value.isAdvance
          : isAdvance // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$ReceiptModelCopyWith<$Res>
    implements $ReceiptModelCopyWith<$Res> {
  factory _$ReceiptModelCopyWith(
          _ReceiptModel value, $Res Function(_ReceiptModel) then) =
      __$ReceiptModelCopyWithImpl<$Res>;
  @override
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
class __$ReceiptModelCopyWithImpl<$Res> extends _$ReceiptModelCopyWithImpl<$Res>
    implements _$ReceiptModelCopyWith<$Res> {
  __$ReceiptModelCopyWithImpl(
      _ReceiptModel _value, $Res Function(_ReceiptModel) _then)
      : super(_value, (v) => _then(v as _ReceiptModel));

  @override
  _ReceiptModel get _value => super._value as _ReceiptModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? receiptNo = freezed,
    Object? billNo = freezed,
    Object? givenAmount = freezed,
    Object? pendingAmount = freezed,
    Object? advanceAmount = freezed,
    Object? paymentMethod = freezed,
    Object? receivedFrom = freezed,
    Object? paymentFor = freezed,
    Object? customerModel = freezed,
    Object? paymentId = freezed,
    Object? isAdvance = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_ReceiptModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiptNo: receiptNo == freezed
          ? _value.receiptNo
          : receiptNo // ignore: cast_nullable_to_non_nullable
              as String,
      billNo: billNo == freezed
          ? _value.billNo
          : billNo // ignore: cast_nullable_to_non_nullable
              as String?,
      givenAmount: givenAmount == freezed
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      pendingAmount: pendingAmount == freezed
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      advanceAmount: advanceAmount == freezed
          ? _value.advanceAmount
          : advanceAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFrom: receivedFrom == freezed
          ? _value.receivedFrom
          : receivedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentFor: paymentFor == freezed
          ? _value.paymentFor
          : paymentFor // ignore: cast_nullable_to_non_nullable
              as String?,
      customerModel: customerModel == freezed
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      paymentId: paymentId == freezed
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      isAdvance: isAdvance == freezed
          ? _value.isAdvance
          : isAdvance // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ReceiptModel implements _ReceiptModel {
  const _$_ReceiptModel(
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

  factory _$_ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReceiptModelFromJson(json);

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
  @JsonKey()
  @override
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
  @JsonKey()
  @override
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
            other is _ReceiptModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.receiptNo, receiptNo) &&
            const DeepCollectionEquality().equals(other.billNo, billNo) &&
            const DeepCollectionEquality()
                .equals(other.givenAmount, givenAmount) &&
            const DeepCollectionEquality()
                .equals(other.pendingAmount, pendingAmount) &&
            const DeepCollectionEquality()
                .equals(other.advanceAmount, advanceAmount) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethod, paymentMethod) &&
            const DeepCollectionEquality()
                .equals(other.receivedFrom, receivedFrom) &&
            const DeepCollectionEquality()
                .equals(other.paymentFor, paymentFor) &&
            const DeepCollectionEquality()
                .equals(other.customerModel, customerModel) &&
            const DeepCollectionEquality().equals(other.paymentId, paymentId) &&
            const DeepCollectionEquality().equals(other.isAdvance, isAdvance) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(receiptNo),
      const DeepCollectionEquality().hash(billNo),
      const DeepCollectionEquality().hash(givenAmount),
      const DeepCollectionEquality().hash(pendingAmount),
      const DeepCollectionEquality().hash(advanceAmount),
      const DeepCollectionEquality().hash(paymentMethod),
      const DeepCollectionEquality().hash(receivedFrom),
      const DeepCollectionEquality().hash(paymentFor),
      const DeepCollectionEquality().hash(customerModel),
      const DeepCollectionEquality().hash(paymentId),
      const DeepCollectionEquality().hash(isAdvance),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$ReceiptModelCopyWith<_ReceiptModel> get copyWith =>
      __$ReceiptModelCopyWithImpl<_ReceiptModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiptModelToJson(this);
  }
}

abstract class _ReceiptModel implements ReceiptModel {
  const factory _ReceiptModel(
      {required String id,
      required String receiptNo,
      String? billNo,
      required double givenAmount,
      required double pendingAmount,
      double advanceAmount,
      required String paymentMethod,
      String? receivedFrom,
      String? paymentFor,
      required CustomerModel customerModel,
      required String paymentId,
      bool isAdvance,
      required DateTime createdAt}) = _$_ReceiptModel;

  factory _ReceiptModel.fromJson(Map<String, dynamic> json) =
      _$_ReceiptModel.fromJson;

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
  _$ReceiptModelCopyWith<_ReceiptModel> get copyWith =>
      throw _privateConstructorUsedError;
}
