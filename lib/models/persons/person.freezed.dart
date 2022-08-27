// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) {
  return _PersonModel.fromJson(json);
}

/// @nodoc
class _$PersonModelTearOff {
  const _$PersonModelTearOff();

  _PersonModel call(
      {required String id,
      required String name,
      required String email,
      required String address,
      required int pincode,
      required String state,
      PersonEnum type = PersonEnum.Customer,
      required int mobileNo,
      DateTime? createdAt}) {
    return _PersonModel(
      id: id,
      name: name,
      email: email,
      address: address,
      pincode: pincode,
      state: state,
      type: type,
      mobileNo: mobileNo,
      createdAt: createdAt,
    );
  }

  PersonModel fromJson(Map<String, Object?> json) {
    return PersonModel.fromJson(json);
  }
}

/// @nodoc
const $PersonModel = _$PersonModelTearOff();

/// @nodoc
mixin _$PersonModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get pincode => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  PersonEnum get type => throw _privateConstructorUsedError;
  int get mobileNo => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonModelCopyWith<PersonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonModelCopyWith<$Res> {
  factory $PersonModelCopyWith(
          PersonModel value, $Res Function(PersonModel) then) =
      _$PersonModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String email,
      String address,
      int pincode,
      String state,
      PersonEnum type,
      int mobileNo,
      DateTime? createdAt});
}

/// @nodoc
class _$PersonModelCopyWithImpl<$Res> implements $PersonModelCopyWith<$Res> {
  _$PersonModelCopyWithImpl(this._value, this._then);

  final PersonModel _value;
  // ignore: unused_field
  final $Res Function(PersonModel) _then;

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
              as PersonEnum,
      mobileNo: mobileNo == freezed
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$PersonModelCopyWith<$Res>
    implements $PersonModelCopyWith<$Res> {
  factory _$PersonModelCopyWith(
          _PersonModel value, $Res Function(_PersonModel) then) =
      __$PersonModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String email,
      String address,
      int pincode,
      String state,
      PersonEnum type,
      int mobileNo,
      DateTime? createdAt});
}

/// @nodoc
class __$PersonModelCopyWithImpl<$Res> extends _$PersonModelCopyWithImpl<$Res>
    implements _$PersonModelCopyWith<$Res> {
  __$PersonModelCopyWithImpl(
      _PersonModel _value, $Res Function(_PersonModel) _then)
      : super(_value, (v) => _then(v as _PersonModel));

  @override
  _PersonModel get _value => super._value as _PersonModel;

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
    Object? createdAt = freezed,
  }) {
    return _then(_PersonModel(
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
              as PersonEnum,
      mobileNo: mobileNo == freezed
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PersonModel implements _PersonModel {
  const _$_PersonModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.pincode,
      required this.state,
      this.type = PersonEnum.Customer,
      required this.mobileNo,
      this.createdAt});

  factory _$_PersonModel.fromJson(Map<String, dynamic> json) =>
      _$$_PersonModelFromJson(json);

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
  @JsonKey()
  @override
  final PersonEnum type;
  @override
  final int mobileNo;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'PersonModel(id: $id, name: $name, email: $email, address: $address, pincode: $pincode, state: $state, type: $type, mobileNo: $mobileNo, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PersonModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.pincode, pincode) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.mobileNo, mobileNo) &&
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
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$PersonModelCopyWith<_PersonModel> get copyWith =>
      __$PersonModelCopyWithImpl<_PersonModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PersonModelToJson(this);
  }
}

abstract class _PersonModel implements PersonModel {
  const factory _PersonModel(
      {required String id,
      required String name,
      required String email,
      required String address,
      required int pincode,
      required String state,
      PersonEnum type,
      required int mobileNo,
      DateTime? createdAt}) = _$_PersonModel;

  factory _PersonModel.fromJson(Map<String, dynamic> json) =
      _$_PersonModel.fromJson;

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
  PersonEnum get type;
  @override
  int get mobileNo;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$PersonModelCopyWith<_PersonModel> get copyWith =>
      throw _privateConstructorUsedError;
}
