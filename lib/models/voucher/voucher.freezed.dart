// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'voucher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VoucherModel _$VoucherModelFromJson(Map<String, dynamic> json) {
  return _VoucherModel.fromJson(json);
}

/// @nodoc
class _$VoucherModelTearOff {
  const _$VoucherModelTearOff();

  _VoucherModel call(
      {required String id,
      required String voucherNo,
      required double givenAmount,
      required String paymentMethod,
      required String description,
      required EmployeeModel givenTo,
      required String paymentId,
      bool isAdvance = false,
      required DateTime createdAt}) {
    return _VoucherModel(
      id: id,
      voucherNo: voucherNo,
      givenAmount: givenAmount,
      paymentMethod: paymentMethod,
      description: description,
      givenTo: givenTo,
      paymentId: paymentId,
      isAdvance: isAdvance,
      createdAt: createdAt,
    );
  }

  VoucherModel fromJson(Map<String, Object?> json) {
    return VoucherModel.fromJson(json);
  }
}

/// @nodoc
const $VoucherModel = _$VoucherModelTearOff();

/// @nodoc
mixin _$VoucherModel {
  String get id => throw _privateConstructorUsedError;
  String get voucherNo => throw _privateConstructorUsedError;
  double get givenAmount => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  EmployeeModel get givenTo => throw _privateConstructorUsedError;
  String get paymentId => throw _privateConstructorUsedError;
  bool get isAdvance => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoucherModelCopyWith<VoucherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoucherModelCopyWith<$Res> {
  factory $VoucherModelCopyWith(
          VoucherModel value, $Res Function(VoucherModel) then) =
      _$VoucherModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String voucherNo,
      double givenAmount,
      String paymentMethod,
      String description,
      EmployeeModel givenTo,
      String paymentId,
      bool isAdvance,
      DateTime createdAt});

  $EmployeeModelCopyWith<$Res> get givenTo;
}

/// @nodoc
class _$VoucherModelCopyWithImpl<$Res> implements $VoucherModelCopyWith<$Res> {
  _$VoucherModelCopyWithImpl(this._value, this._then);

  final VoucherModel _value;
  // ignore: unused_field
  final $Res Function(VoucherModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? voucherNo = freezed,
    Object? givenAmount = freezed,
    Object? paymentMethod = freezed,
    Object? description = freezed,
    Object? givenTo = freezed,
    Object? paymentId = freezed,
    Object? isAdvance = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      voucherNo: voucherNo == freezed
          ? _value.voucherNo
          : voucherNo // ignore: cast_nullable_to_non_nullable
              as String,
      givenAmount: givenAmount == freezed
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      givenTo: givenTo == freezed
          ? _value.givenTo
          : givenTo // ignore: cast_nullable_to_non_nullable
              as EmployeeModel,
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
  $EmployeeModelCopyWith<$Res> get givenTo {
    return $EmployeeModelCopyWith<$Res>(_value.givenTo, (value) {
      return _then(_value.copyWith(givenTo: value));
    });
  }
}

/// @nodoc
abstract class _$VoucherModelCopyWith<$Res>
    implements $VoucherModelCopyWith<$Res> {
  factory _$VoucherModelCopyWith(
          _VoucherModel value, $Res Function(_VoucherModel) then) =
      __$VoucherModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String voucherNo,
      double givenAmount,
      String paymentMethod,
      String description,
      EmployeeModel givenTo,
      String paymentId,
      bool isAdvance,
      DateTime createdAt});

  @override
  $EmployeeModelCopyWith<$Res> get givenTo;
}

/// @nodoc
class __$VoucherModelCopyWithImpl<$Res> extends _$VoucherModelCopyWithImpl<$Res>
    implements _$VoucherModelCopyWith<$Res> {
  __$VoucherModelCopyWithImpl(
      _VoucherModel _value, $Res Function(_VoucherModel) _then)
      : super(_value, (v) => _then(v as _VoucherModel));

  @override
  _VoucherModel get _value => super._value as _VoucherModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? voucherNo = freezed,
    Object? givenAmount = freezed,
    Object? paymentMethod = freezed,
    Object? description = freezed,
    Object? givenTo = freezed,
    Object? paymentId = freezed,
    Object? isAdvance = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_VoucherModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      voucherNo: voucherNo == freezed
          ? _value.voucherNo
          : voucherNo // ignore: cast_nullable_to_non_nullable
              as String,
      givenAmount: givenAmount == freezed
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: paymentMethod == freezed
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      givenTo: givenTo == freezed
          ? _value.givenTo
          : givenTo // ignore: cast_nullable_to_non_nullable
              as EmployeeModel,
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
class _$_VoucherModel implements _VoucherModel {
  const _$_VoucherModel(
      {required this.id,
      required this.voucherNo,
      required this.givenAmount,
      required this.paymentMethod,
      required this.description,
      required this.givenTo,
      required this.paymentId,
      this.isAdvance = false,
      required this.createdAt});

  factory _$_VoucherModel.fromJson(Map<String, dynamic> json) =>
      _$$_VoucherModelFromJson(json);

  @override
  final String id;
  @override
  final String voucherNo;
  @override
  final double givenAmount;
  @override
  final String paymentMethod;
  @override
  final String description;
  @override
  final EmployeeModel givenTo;
  @override
  final String paymentId;
  @JsonKey()
  @override
  final bool isAdvance;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'VoucherModel(id: $id, voucherNo: $voucherNo, givenAmount: $givenAmount, paymentMethod: $paymentMethod, description: $description, givenTo: $givenTo, paymentId: $paymentId, isAdvance: $isAdvance, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VoucherModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.voucherNo, voucherNo) &&
            const DeepCollectionEquality()
                .equals(other.givenAmount, givenAmount) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethod, paymentMethod) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.givenTo, givenTo) &&
            const DeepCollectionEquality().equals(other.paymentId, paymentId) &&
            const DeepCollectionEquality().equals(other.isAdvance, isAdvance) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(voucherNo),
      const DeepCollectionEquality().hash(givenAmount),
      const DeepCollectionEquality().hash(paymentMethod),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(givenTo),
      const DeepCollectionEquality().hash(paymentId),
      const DeepCollectionEquality().hash(isAdvance),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$VoucherModelCopyWith<_VoucherModel> get copyWith =>
      __$VoucherModelCopyWithImpl<_VoucherModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VoucherModelToJson(this);
  }
}

abstract class _VoucherModel implements VoucherModel {
  const factory _VoucherModel(
      {required String id,
      required String voucherNo,
      required double givenAmount,
      required String paymentMethod,
      required String description,
      required EmployeeModel givenTo,
      required String paymentId,
      bool isAdvance,
      required DateTime createdAt}) = _$_VoucherModel;

  factory _VoucherModel.fromJson(Map<String, dynamic> json) =
      _$_VoucherModel.fromJson;

  @override
  String get id;
  @override
  String get voucherNo;
  @override
  double get givenAmount;
  @override
  String get paymentMethod;
  @override
  String get description;
  @override
  EmployeeModel get givenTo;
  @override
  String get paymentId;
  @override
  bool get isAdvance;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$VoucherModelCopyWith<_VoucherModel> get copyWith =>
      throw _privateConstructorUsedError;
}
