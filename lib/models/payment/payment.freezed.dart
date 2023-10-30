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
  String get paymentNo => throw _privateConstructorUsedError;
  String get purchaseId => throw _privateConstructorUsedError;
  double get givenAmount => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get paymentID => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  PurchaseModel? get purchaseModel => throw _privateConstructorUsedError;
  CompanyModel? get companyModel => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

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
  final String id;
  @override
  final String paymentNo;
  @override
  final String purchaseId;
  @override
  final double givenAmount;
  @override
  final String paymentMethod;
  @override
  final String paymentID;
  @override
  final DateTime createdAt;
  @override
  final PurchaseModel? purchaseModel;
  @override
  final CompanyModel? companyModel;
  @override
  final String? note;

  @override
  String toString() {
    return 'PaymentModel(id: $id, paymentNo: $paymentNo, purchaseId: $purchaseId, givenAmount: $givenAmount, paymentMethod: $paymentMethod, paymentID: $paymentID, createdAt: $createdAt, purchaseModel: $purchaseModel, companyModel: $companyModel, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentNo, paymentNo) ||
                other.paymentNo == paymentNo) &&
            (identical(other.purchaseId, purchaseId) ||
                other.purchaseId == purchaseId) &&
            (identical(other.givenAmount, givenAmount) ||
                other.givenAmount == givenAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentID, paymentID) ||
                other.paymentID == paymentID) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.purchaseModel, purchaseModel) ||
                other.purchaseModel == purchaseModel) &&
            (identical(other.companyModel, companyModel) ||
                other.companyModel == companyModel) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      paymentNo,
      purchaseId,
      givenAmount,
      paymentMethod,
      paymentID,
      createdAt,
      purchaseModel,
      companyModel,
      note);

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
      {required final String id,
      required final String paymentNo,
      required final String purchaseId,
      required final double givenAmount,
      required final String paymentMethod,
      required final String paymentID,
      required final DateTime createdAt,
      final PurchaseModel? purchaseModel,
      final CompanyModel? companyModel,
      final String? note}) = _$PaymentModelImpl;

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$PaymentModelImpl.fromJson;

  @override
  String get id;
  @override
  String get paymentNo;
  @override
  String get purchaseId;
  @override
  double get givenAmount;
  @override
  String get paymentMethod;
  @override
  String get paymentID;
  @override
  DateTime get createdAt;
  @override
  PurchaseModel? get purchaseModel;
  @override
  CompanyModel? get companyModel;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
