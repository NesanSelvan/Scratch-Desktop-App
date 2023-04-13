// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return _CustomerModel.fromJson(json);
}

/// @nodoc
class _$CustomerModelTearOff {
  const _$CustomerModelTearOff();

  _CustomerModel call(
      {required String id,
      required String name,
      String? email,
      required String address,
      required int pincode,
      required String state,
      required String type,
      required bool isPending,
      required int mobileNo,
      String? gstin,
      double pendingAmount = 0,
      DateTime? createdAt,
      double openingBalance = 0}) {
    return _CustomerModel(
      id: id,
      name: name,
      email: email,
      address: address,
      pincode: pincode,
      state: state,
      type: type,
      isPending: isPending,
      mobileNo: mobileNo,
      gstin: gstin,
      pendingAmount: pendingAmount,
      createdAt: createdAt,
      openingBalance: openingBalance,
    );
  }

  CustomerModel fromJson(Map<String, Object?> json) {
    return CustomerModel.fromJson(json);
  }
}

/// @nodoc
const $CustomerModel = _$CustomerModelTearOff();

/// @nodoc
mixin _$CustomerModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get pincode => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get isPending => throw _privateConstructorUsedError;
  int get mobileNo => throw _privateConstructorUsedError;
  String? get gstin => throw _privateConstructorUsedError;
  double get pendingAmount => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  double get openingBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerModelCopyWith<CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerModelCopyWith<$Res> {
  factory $CustomerModelCopyWith(
          CustomerModel value, $Res Function(CustomerModel) then) =
      _$CustomerModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String? email,
      String address,
      int pincode,
      String state,
      String type,
      bool isPending,
      int mobileNo,
      String? gstin,
      double pendingAmount,
      DateTime? createdAt,
      double openingBalance});
}

/// @nodoc
class _$CustomerModelCopyWithImpl<$Res>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._value, this._then);

  final CustomerModel _value;
  // ignore: unused_field
  final $Res Function(CustomerModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? pincode = freezed,
    Object? state = freezed,
    Object? type = freezed,
    Object? isPending = freezed,
    Object? mobileNo = freezed,
    Object? gstin = freezed,
    Object? pendingAmount = freezed,
    Object? createdAt = freezed,
    Object? openingBalance = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: pincode == freezed
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isPending: isPending == freezed
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileNo: mobileNo == freezed
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as int,
      gstin: gstin == freezed
          ? _value.gstin
          : gstin // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingAmount: pendingAmount == freezed
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      openingBalance: openingBalance == freezed
          ? _value.openingBalance
          : openingBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$CustomerModelCopyWith<$Res>
    implements $CustomerModelCopyWith<$Res> {
  factory _$CustomerModelCopyWith(
          _CustomerModel value, $Res Function(_CustomerModel) then) =
      __$CustomerModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String? email,
      String address,
      int pincode,
      String state,
      String type,
      bool isPending,
      int mobileNo,
      String? gstin,
      double pendingAmount,
      DateTime? createdAt,
      double openingBalance});
}

/// @nodoc
class __$CustomerModelCopyWithImpl<$Res>
    extends _$CustomerModelCopyWithImpl<$Res>
    implements _$CustomerModelCopyWith<$Res> {
  __$CustomerModelCopyWithImpl(
      _CustomerModel _value, $Res Function(_CustomerModel) _then)
      : super(_value, (v) => _then(v as _CustomerModel));

  @override
  _CustomerModel get _value => super._value as _CustomerModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? pincode = freezed,
    Object? state = freezed,
    Object? type = freezed,
    Object? isPending = freezed,
    Object? mobileNo = freezed,
    Object? gstin = freezed,
    Object? pendingAmount = freezed,
    Object? createdAt = freezed,
    Object? openingBalance = freezed,
  }) {
    return _then(_CustomerModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: pincode == freezed
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isPending: isPending == freezed
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileNo: mobileNo == freezed
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as int,
      gstin: gstin == freezed
          ? _value.gstin
          : gstin // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingAmount: pendingAmount == freezed
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      openingBalance: openingBalance == freezed
          ? _value.openingBalance
          : openingBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerModel implements _CustomerModel {
  const _$_CustomerModel(
      {required this.id,
      required this.name,
      this.email,
      required this.address,
      required this.pincode,
      required this.state,
      required this.type,
      required this.isPending,
      required this.mobileNo,
      this.gstin,
      this.pendingAmount = 0,
      this.createdAt,
      this.openingBalance = 0});

  factory _$_CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String address;
  @override
  final int pincode;
  @override
  final String state;
  @override
  final String type;
  @override
  final bool isPending;
  @override
  final int mobileNo;
  @override
  final String? gstin;
  @JsonKey()
  @override
  final double pendingAmount;
  @override
  final DateTime? createdAt;
  @JsonKey()
  @override
  final double openingBalance;

  @override
  String toString() {
    return 'CustomerModel(id: $id, name: $name, email: $email, address: $address, pincode: $pincode, state: $state, type: $type, isPending: $isPending, mobileNo: $mobileNo, gstin: $gstin, pendingAmount: $pendingAmount, createdAt: $createdAt, openingBalance: $openingBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.pincode, pincode) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.isPending, isPending) &&
            const DeepCollectionEquality().equals(other.mobileNo, mobileNo) &&
            const DeepCollectionEquality().equals(other.gstin, gstin) &&
            const DeepCollectionEquality()
                .equals(other.pendingAmount, pendingAmount) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.openingBalance, openingBalance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(pincode),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(isPending),
      const DeepCollectionEquality().hash(mobileNo),
      const DeepCollectionEquality().hash(gstin),
      const DeepCollectionEquality().hash(pendingAmount),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(openingBalance));

  @JsonKey(ignore: true)
  @override
  _$CustomerModelCopyWith<_CustomerModel> get copyWith =>
      __$CustomerModelCopyWithImpl<_CustomerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerModelToJson(this);
  }
}

abstract class _CustomerModel implements CustomerModel {
  const factory _CustomerModel(
      {required String id,
      required String name,
      String? email,
      required String address,
      required int pincode,
      required String state,
      required String type,
      required bool isPending,
      required int mobileNo,
      String? gstin,
      double pendingAmount,
      DateTime? createdAt,
      double openingBalance}) = _$_CustomerModel;

  factory _CustomerModel.fromJson(Map<String, dynamic> json) =
      _$_CustomerModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get email;
  @override
  String get address;
  @override
  int get pincode;
  @override
  String get state;
  @override
  String get type;
  @override
  bool get isPending;
  @override
  int get mobileNo;
  @override
  String? get gstin;
  @override
  double get pendingAmount;
  @override
  DateTime? get createdAt;
  @override
  double get openingBalance;
  @override
  @JsonKey(ignore: true)
  _$CustomerModelCopyWith<_CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
