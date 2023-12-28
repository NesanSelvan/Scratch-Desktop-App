// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return _PaymentModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get paymentNo => throw _privateConstructorUsedError;
  set paymentNo(String value) => throw _privateConstructorUsedError;
  String get purchaseId => throw _privateConstructorUsedError;
  set purchaseId(String value) => throw _privateConstructorUsedError;
  double get givenAmount => throw _privateConstructorUsedError;
  set givenAmount(double value) => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  set paymentMethod(String value) => throw _privateConstructorUsedError;
  String get paymentID => throw _privateConstructorUsedError;
  set paymentID(String value) => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime value) => throw _privateConstructorUsedError;
  PurchaseModel? get purchaseModel => throw _privateConstructorUsedError;
  set purchaseModel(PurchaseModel? value) => throw _privateConstructorUsedError;
  CompanyModel? get companyModel => throw _privateConstructorUsedError;
  set companyModel(CompanyModel? value) => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  set note(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) then) =
      _$PaymentModelCopyWithImpl<$Res, PaymentModel>;
  @useResult
  $Res call(
      {String id,
      String paymentNo,
      String purchaseId,
      double givenAmount,
      String paymentMethod,
      String paymentID,
      DateTime createdAt,
      PurchaseModel? purchaseModel,
      CompanyModel? companyModel,
      String? note});

  $PurchaseModelCopyWith<$Res>? get purchaseModel;
  $CompanyModelCopyWith<$Res>? get companyModel;
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res, $Val extends PaymentModel>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentNo = null,
    Object? purchaseId = null,
    Object? givenAmount = null,
    Object? paymentMethod = null,
    Object? paymentID = null,
    Object? createdAt = null,
    Object? purchaseModel = freezed,
    Object? companyModel = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNo: null == paymentNo
          ? _value.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseId: null == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as String,
      givenAmount: null == givenAmount
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchaseModel: freezed == purchaseModel
          ? _value.purchaseModel
          : purchaseModel // ignore: cast_nullable_to_non_nullable
              as PurchaseModel?,
      companyModel: freezed == companyModel
          ? _value.companyModel
          : companyModel // ignore: cast_nullable_to_non_nullable
              as CompanyModel?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseModelCopyWith<$Res>? get purchaseModel {
    if (_value.purchaseModel == null) {
      return null;
    }

    return $PurchaseModelCopyWith<$Res>(_value.purchaseModel!, (value) {
      return _then(_value.copyWith(purchaseModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CompanyModelCopyWith<$Res>? get companyModel {
    if (_value.companyModel == null) {
      return null;
    }

    return $CompanyModelCopyWith<$Res>(_value.companyModel!, (value) {
      return _then(_value.copyWith(companyModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentModelImplCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$$PaymentModelImplCopyWith(
          _$PaymentModelImpl value, $Res Function(_$PaymentModelImpl) then) =
      __$$PaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String paymentNo,
      String purchaseId,
      double givenAmount,
      String paymentMethod,
      String paymentID,
      DateTime createdAt,
      PurchaseModel? purchaseModel,
      CompanyModel? companyModel,
      String? note});

  @override
  $PurchaseModelCopyWith<$Res>? get purchaseModel;
  @override
  $CompanyModelCopyWith<$Res>? get companyModel;
}

/// @nodoc
class __$$PaymentModelImplCopyWithImpl<$Res>
    extends _$PaymentModelCopyWithImpl<$Res, _$PaymentModelImpl>
    implements _$$PaymentModelImplCopyWith<$Res> {
  __$$PaymentModelImplCopyWithImpl(
      _$PaymentModelImpl _value, $Res Function(_$PaymentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentNo = null,
    Object? purchaseId = null,
    Object? givenAmount = null,
    Object? paymentMethod = null,
    Object? paymentID = null,
    Object? createdAt = null,
    Object? purchaseModel = freezed,
    Object? companyModel = freezed,
    Object? note = freezed,
  }) {
    return _then(_$PaymentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNo: null == paymentNo
          ? _value.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseId: null == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as String,
      givenAmount: null == givenAmount
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchaseModel: freezed == purchaseModel
          ? _value.purchaseModel
          : purchaseModel // ignore: cast_nullable_to_non_nullable
              as PurchaseModel?,
      companyModel: freezed == companyModel
          ? _value.companyModel
          : companyModel // ignore: cast_nullable_to_non_nullable
              as CompanyModel?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PaymentModelImpl implements _PaymentModel {
  _$PaymentModelImpl(
      {required this.id,
      required this.paymentNo,
      required this.purchaseId,
      required this.givenAmount,
      required this.paymentMethod,
      required this.paymentID,
      required this.createdAt,
      this.purchaseModel,
      this.companyModel,
      this.note});

  factory _$PaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentModelImplFromJson(json);

  @override
  String id;
  @override
  String paymentNo;
  @override
  String purchaseId;
  @override
  double givenAmount;
  @override
  String paymentMethod;
  @override
  String paymentID;
  @override
  DateTime createdAt;
  @override
  PurchaseModel? purchaseModel;
  @override
  CompanyModel? companyModel;
  @override
  String? note;

  @override
  String toString() {
    return 'PaymentModel(id: $id, paymentNo: $paymentNo, purchaseId: $purchaseId, givenAmount: $givenAmount, paymentMethod: $paymentMethod, paymentID: $paymentID, createdAt: $createdAt, purchaseModel: $purchaseModel, companyModel: $companyModel, note: $note)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      __$$PaymentModelImplCopyWithImpl<_$PaymentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentModel implements PaymentModel {
  factory _PaymentModel(
      {required String id,
      required String paymentNo,
      required String purchaseId,
      required double givenAmount,
      required String paymentMethod,
      required String paymentID,
      required DateTime createdAt,
      PurchaseModel? purchaseModel,
      CompanyModel? companyModel,
      String? note}) = _$PaymentModelImpl;

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$PaymentModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get paymentNo;
  set paymentNo(String value);
  @override
  String get purchaseId;
  set purchaseId(String value);
  @override
  double get givenAmount;
  set givenAmount(double value);
  @override
  String get paymentMethod;
  set paymentMethod(String value);
  @override
  String get paymentID;
  set paymentID(String value);
  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  PurchaseModel? get purchaseModel;
  set purchaseModel(PurchaseModel? value);
  @override
  CompanyModel? get companyModel;
  set companyModel(CompanyModel? value);
  @override
  String? get note;
  set note(String? value);
  @override
  @JsonKey(ignore: true)
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
