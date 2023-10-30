// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) {
  return _PersonModel.fromJson(json);
}

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
      _$PersonModelCopyWithImpl<$Res, PersonModel>;
  @useResult
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
class _$PersonModelCopyWithImpl<$Res, $Val extends PersonModel>
    implements $PersonModelCopyWith<$Res> {
  _$PersonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? address = null,
    Object? pincode = null,
    Object? state = null,
    Object? type = null,
    Object? mobileNo = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PersonEnum,
      mobileNo: null == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonModelImplCopyWith<$Res>
    implements $PersonModelCopyWith<$Res> {
  factory _$$PersonModelImplCopyWith(
          _$PersonModelImpl value, $Res Function(_$PersonModelImpl) then) =
      __$$PersonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$PersonModelImplCopyWithImpl<$Res>
    extends _$PersonModelCopyWithImpl<$Res, _$PersonModelImpl>
    implements _$$PersonModelImplCopyWith<$Res> {
  __$$PersonModelImplCopyWithImpl(
      _$PersonModelImpl _value, $Res Function(_$PersonModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? address = null,
    Object? pincode = null,
    Object? state = null,
    Object? type = null,
    Object? mobileNo = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$PersonModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PersonEnum,
      mobileNo: null == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonModelImpl implements _PersonModel {
  const _$PersonModelImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.pincode,
      required this.state,
      this.type = PersonEnum.Customer,
      required this.mobileNo,
      this.createdAt});

  factory _$PersonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonModelImplFromJson(json);

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
  @JsonKey()
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
            other is _$PersonModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, address,
      pincode, state, type, mobileNo, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonModelImplCopyWith<_$PersonModelImpl> get copyWith =>
      __$$PersonModelImplCopyWithImpl<_$PersonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonModelImplToJson(
      this,
    );
  }
}

abstract class _PersonModel implements PersonModel {
  const factory _PersonModel(
      {required final String id,
      required final String name,
      required final String email,
      required final String address,
      required final int pincode,
      required final String state,
      final PersonEnum type,
      required final int mobileNo,
      final DateTime? createdAt}) = _$PersonModelImpl;

  factory _PersonModel.fromJson(Map<String, dynamic> json) =
      _$PersonModelImpl.fromJson;

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
  _$$PersonModelImplCopyWith<_$PersonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
