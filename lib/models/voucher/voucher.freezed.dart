// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VoucherModel _$VoucherModelFromJson(Map<String, dynamic> json) {
  return _VoucherModel.fromJson(json);
}

/// @nodoc
mixin _$VoucherModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get voucherNo => throw _privateConstructorUsedError;
  set voucherNo(String value) => throw _privateConstructorUsedError;
  double get givenAmount => throw _privateConstructorUsedError;
  set givenAmount(double value) => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  set paymentMethod(String value) => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;
  EmployeeModel get givenTo => throw _privateConstructorUsedError;
  set givenTo(EmployeeModel value) => throw _privateConstructorUsedError;
  String get paymentId => throw _privateConstructorUsedError;
  set paymentId(String value) => throw _privateConstructorUsedError;
  bool get isAdvance => throw _privateConstructorUsedError;
  set isAdvance(bool value) => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoucherModelCopyWith<VoucherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoucherModelCopyWith<$Res> {
  factory $VoucherModelCopyWith(
          VoucherModel value, $Res Function(VoucherModel) then) =
      _$VoucherModelCopyWithImpl<$Res, VoucherModel>;
  @useResult
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
class _$VoucherModelCopyWithImpl<$Res, $Val extends VoucherModel>
    implements $VoucherModelCopyWith<$Res> {
  _$VoucherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? voucherNo = null,
    Object? givenAmount = null,
    Object? paymentMethod = null,
    Object? description = null,
    Object? givenTo = null,
    Object? paymentId = null,
    Object? isAdvance = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      voucherNo: null == voucherNo
          ? _value.voucherNo
          : voucherNo // ignore: cast_nullable_to_non_nullable
              as String,
      givenAmount: null == givenAmount
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      givenTo: null == givenTo
          ? _value.givenTo
          : givenTo // ignore: cast_nullable_to_non_nullable
              as EmployeeModel,
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
  $EmployeeModelCopyWith<$Res> get givenTo {
    return $EmployeeModelCopyWith<$Res>(_value.givenTo, (value) {
      return _then(_value.copyWith(givenTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VoucherModelImplCopyWith<$Res>
    implements $VoucherModelCopyWith<$Res> {
  factory _$$VoucherModelImplCopyWith(
          _$VoucherModelImpl value, $Res Function(_$VoucherModelImpl) then) =
      __$$VoucherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$VoucherModelImplCopyWithImpl<$Res>
    extends _$VoucherModelCopyWithImpl<$Res, _$VoucherModelImpl>
    implements _$$VoucherModelImplCopyWith<$Res> {
  __$$VoucherModelImplCopyWithImpl(
      _$VoucherModelImpl _value, $Res Function(_$VoucherModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? voucherNo = null,
    Object? givenAmount = null,
    Object? paymentMethod = null,
    Object? description = null,
    Object? givenTo = null,
    Object? paymentId = null,
    Object? isAdvance = null,
    Object? createdAt = null,
  }) {
    return _then(_$VoucherModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      voucherNo: null == voucherNo
          ? _value.voucherNo
          : voucherNo // ignore: cast_nullable_to_non_nullable
              as String,
      givenAmount: null == givenAmount
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      givenTo: null == givenTo
          ? _value.givenTo
          : givenTo // ignore: cast_nullable_to_non_nullable
              as EmployeeModel,
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
class _$VoucherModelImpl implements _VoucherModel {
  _$VoucherModelImpl(
      {required this.id,
      required this.voucherNo,
      required this.givenAmount,
      required this.paymentMethod,
      required this.description,
      required this.givenTo,
      required this.paymentId,
      this.isAdvance = false,
      required this.createdAt});

  factory _$VoucherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoucherModelImplFromJson(json);

  @override
  String id;
  @override
  String voucherNo;
  @override
  double givenAmount;
  @override
  String paymentMethod;
  @override
  String description;
  @override
  EmployeeModel givenTo;
  @override
  String paymentId;
  @override
  @JsonKey()
  bool isAdvance;
  @override
  DateTime createdAt;

  @override
  String toString() {
    return 'VoucherModel(id: $id, voucherNo: $voucherNo, givenAmount: $givenAmount, paymentMethod: $paymentMethod, description: $description, givenTo: $givenTo, paymentId: $paymentId, isAdvance: $isAdvance, createdAt: $createdAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoucherModelImplCopyWith<_$VoucherModelImpl> get copyWith =>
      __$$VoucherModelImplCopyWithImpl<_$VoucherModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoucherModelImplToJson(
      this,
    );
  }
}

abstract class _VoucherModel implements VoucherModel {
  factory _VoucherModel(
      {required String id,
      required String voucherNo,
      required double givenAmount,
      required String paymentMethod,
      required String description,
      required EmployeeModel givenTo,
      required String paymentId,
      bool isAdvance,
      required DateTime createdAt}) = _$VoucherModelImpl;

  factory _VoucherModel.fromJson(Map<String, dynamic> json) =
      _$VoucherModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get voucherNo;
  set voucherNo(String value);
  @override
  double get givenAmount;
  set givenAmount(double value);
  @override
  String get paymentMethod;
  set paymentMethod(String value);
  @override
  String get description;
  set description(String value);
  @override
  EmployeeModel get givenTo;
  set givenTo(EmployeeModel value);
  @override
  String get paymentId;
  set paymentId(String value);
  @override
  bool get isAdvance;
  set isAdvance(bool value);
  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$VoucherModelImplCopyWith<_$VoucherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
