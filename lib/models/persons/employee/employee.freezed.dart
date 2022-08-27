// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) {
  return _EmployeeModel.fromJson(json);
}

/// @nodoc
class _$EmployeeModelTearOff {
  const _$EmployeeModelTearOff();

  _EmployeeModel call(
      {required String id,
      required String name,
      required String email,
      required String address,
      required int pincode,
      required String state,
      required String type,
      required int mobileNo,
      required String password,
      DateTime? createdAt}) {
    return _EmployeeModel(
      id: id,
      name: name,
      email: email,
      address: address,
      pincode: pincode,
      state: state,
      type: type,
      mobileNo: mobileNo,
      password: password,
      createdAt: createdAt,
    );
  }

  EmployeeModel fromJson(Map<String, Object?> json) {
    return EmployeeModel.fromJson(json);
  }
}

/// @nodoc
const $EmployeeModel = _$EmployeeModelTearOff();

/// @nodoc
mixin _$EmployeeModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get pincode => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get mobileNo => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeModelCopyWith<EmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeModelCopyWith<$Res> {
  factory $EmployeeModelCopyWith(
          EmployeeModel value, $Res Function(EmployeeModel) then) =
      _$EmployeeModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String email,
      String address,
      int pincode,
      String state,
      String type,
      int mobileNo,
      String password,
      DateTime? createdAt});
}

/// @nodoc
class _$EmployeeModelCopyWithImpl<$Res>
    implements $EmployeeModelCopyWith<$Res> {
  _$EmployeeModelCopyWithImpl(this._value, this._then);

  final EmployeeModel _value;
  // ignore: unused_field
  final $Res Function(EmployeeModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? pincode = freezed,
    Object? state = freezed,
    Object? type = freezed,
    Object? mobileNo = freezed,
    Object? password = freezed,
    Object? createdAt = freezed,
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
              as String,
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
      mobileNo: mobileNo == freezed
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as int,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$EmployeeModelCopyWith<$Res>
    implements $EmployeeModelCopyWith<$Res> {
  factory _$EmployeeModelCopyWith(
          _EmployeeModel value, $Res Function(_EmployeeModel) then) =
      __$EmployeeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String email,
      String address,
      int pincode,
      String state,
      String type,
      int mobileNo,
      String password,
      DateTime? createdAt});
}

/// @nodoc
class __$EmployeeModelCopyWithImpl<$Res>
    extends _$EmployeeModelCopyWithImpl<$Res>
    implements _$EmployeeModelCopyWith<$Res> {
  __$EmployeeModelCopyWithImpl(
      _EmployeeModel _value, $Res Function(_EmployeeModel) _then)
      : super(_value, (v) => _then(v as _EmployeeModel));

  @override
  _EmployeeModel get _value => super._value as _EmployeeModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? pincode = freezed,
    Object? state = freezed,
    Object? type = freezed,
    Object? mobileNo = freezed,
    Object? password = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_EmployeeModel(
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
              as String,
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
      mobileNo: mobileNo == freezed
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as int,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmployeeModel implements _EmployeeModel {
  const _$_EmployeeModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.pincode,
      required this.state,
      required this.type,
      required this.mobileNo,
      required this.password,
      this.createdAt});

  factory _$_EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String address;
  @override
  final int pincode;
  @override
  final String state;
  @override
  final String type;
  @override
  final int mobileNo;
  @override
  final String password;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'EmployeeModel(id: $id, name: $name, email: $email, address: $address, pincode: $pincode, state: $state, type: $type, mobileNo: $mobileNo, password: $password, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmployeeModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.pincode, pincode) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.mobileNo, mobileNo) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
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
      const DeepCollectionEquality().hash(mobileNo),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$EmployeeModelCopyWith<_EmployeeModel> get copyWith =>
      __$EmployeeModelCopyWithImpl<_EmployeeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeModelToJson(this);
  }
}

abstract class _EmployeeModel implements EmployeeModel {
  const factory _EmployeeModel(
      {required String id,
      required String name,
      required String email,
      required String address,
      required int pincode,
      required String state,
      required String type,
      required int mobileNo,
      required String password,
      DateTime? createdAt}) = _$_EmployeeModel;

  factory _EmployeeModel.fromJson(Map<String, dynamic> json) =
      _$_EmployeeModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get address;
  @override
  int get pincode;
  @override
  String get state;
  @override
  String get type;
  @override
  int get mobileNo;
  @override
  String get password;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$EmployeeModelCopyWith<_EmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
