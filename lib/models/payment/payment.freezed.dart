// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return _PaymentModel.fromJson(json);
}

/// @nodoc
class _$PaymentModelTearOff {
  const _$PaymentModelTearOff();

  _PaymentModel call(
      {required String id,
      required String paymentNo,
      required String purchaseId,
      required double givenAmount,
      required String paymentMethod,
      required String paymentID,
      required DateTime createdAt,
      PurchaseModel? purchaseModel,
      String? note}) {
    return _PaymentModel(
      id: id,
      paymentNo: paymentNo,
      purchaseId: purchaseId,
      givenAmount: givenAmount,
      paymentMethod: paymentMethod,
      paymentID: paymentID,
      createdAt: createdAt,
      purchaseModel: purchaseModel,
      note: note,
    );
  }

  PaymentModel fromJson(Map<String, Object?> json) {
    return PaymentModel.fromJson(json);
  }
}

/// @nodoc
const $PaymentModel = _$PaymentModelTearOff();

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
      _$PaymentModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String paymentNo,
      String purchaseId,
      double givenAmount,
      String paymentMethod,
      String paymentID,
      DateTime createdAt,
      PurchaseModel? purchaseModel,
      String? note});

  $PurchaseModelCopyWith<$Res>? get purchaseModel;
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res> implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  final PaymentModel _value;
  // ignore: unused_field
  final $Res Function(PaymentModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? paymentNo = freezed,
    Object? purchaseId = freezed,
    Object? givenAmount = freezed,
    Object? paymentMethod = freezed,
    Object? paymentID = freezed,
    Object? createdAt = freezed,
    Object? purchaseModel = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNo: paymentNo == freezed
          ? _value.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseId: purchaseId == freezed
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as String,
      givenAmount: givenAmount == freezed
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentID: paymentID == freezed
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchaseModel: purchaseModel == freezed
          ? _value.purchaseModel
          : purchaseModel // ignore: cast_nullable_to_non_nullable
              as PurchaseModel?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $PurchaseModelCopyWith<$Res>? get purchaseModel {
    if (_value.purchaseModel == null) {
      return null;
    }

    return $PurchaseModelCopyWith<$Res>(_value.purchaseModel!, (value) {
      return _then(_value.copyWith(purchaseModel: value));
    });
  }
}

/// @nodoc
abstract class _$PaymentModelCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(
          _PaymentModel value, $Res Function(_PaymentModel) then) =
      __$PaymentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String paymentNo,
      String purchaseId,
      double givenAmount,
      String paymentMethod,
      String paymentID,
      DateTime createdAt,
      PurchaseModel? purchaseModel,
      String? note});

  @override
  $PurchaseModelCopyWith<$Res>? get purchaseModel;
}

/// @nodoc
class __$PaymentModelCopyWithImpl<$Res> extends _$PaymentModelCopyWithImpl<$Res>
    implements _$PaymentModelCopyWith<$Res> {
  __$PaymentModelCopyWithImpl(
      _PaymentModel _value, $Res Function(_PaymentModel) _then)
      : super(_value, (v) => _then(v as _PaymentModel));

  @override
  _PaymentModel get _value => super._value as _PaymentModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? paymentNo = freezed,
    Object? purchaseId = freezed,
    Object? givenAmount = freezed,
    Object? paymentMethod = freezed,
    Object? paymentID = freezed,
    Object? createdAt = freezed,
    Object? purchaseModel = freezed,
    Object? note = freezed,
  }) {
    return _then(_PaymentModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNo: paymentNo == freezed
          ? _value.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseId: purchaseId == freezed
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as String,
      givenAmount: givenAmount == freezed
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentID: paymentID == freezed
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchaseModel: purchaseModel == freezed
          ? _value.purchaseModel
          : purchaseModel // ignore: cast_nullable_to_non_nullable
              as PurchaseModel?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PaymentModel implements _PaymentModel {
  _$_PaymentModel(
      {required this.id,
      required this.paymentNo,
      required this.purchaseId,
      required this.givenAmount,
      required this.paymentMethod,
      required this.paymentID,
      required this.createdAt,
      this.purchaseModel,
      this.note});

  factory _$_PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentModelFromJson(json);

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
  final String? note;

  @override
  String toString() {
    return 'PaymentModel(id: $id, paymentNo: $paymentNo, purchaseId: $purchaseId, givenAmount: $givenAmount, paymentMethod: $paymentMethod, paymentID: $paymentID, createdAt: $createdAt, purchaseModel: $purchaseModel, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.paymentNo, paymentNo) &&
            const DeepCollectionEquality()
                .equals(other.purchaseId, purchaseId) &&
            const DeepCollectionEquality()
                .equals(other.givenAmount, givenAmount) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethod, paymentMethod) &&
            const DeepCollectionEquality().equals(other.paymentID, paymentID) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.purchaseModel, purchaseModel) &&
            const DeepCollectionEquality().equals(other.note, note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(paymentNo),
      const DeepCollectionEquality().hash(purchaseId),
      const DeepCollectionEquality().hash(givenAmount),
      const DeepCollectionEquality().hash(paymentMethod),
      const DeepCollectionEquality().hash(paymentID),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(purchaseModel),
      const DeepCollectionEquality().hash(note));

  @JsonKey(ignore: true)
  @override
  _$PaymentModelCopyWith<_PaymentModel> get copyWith =>
      __$PaymentModelCopyWithImpl<_PaymentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentModelToJson(this);
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
      String? note}) = _$_PaymentModel;

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$_PaymentModel.fromJson;

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
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$PaymentModelCopyWith<_PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
