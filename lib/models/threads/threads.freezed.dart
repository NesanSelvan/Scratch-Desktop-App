// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'threads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThreadsModel _$ThreadsModelFromJson(Map<String, dynamic> json) {
  return _ThreadsModel.fromJson(json);
}

/// @nodoc
mixin _$ThreadsModel {
  String get number => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThreadsModelCopyWith<ThreadsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadsModelCopyWith<$Res> {
  factory $ThreadsModelCopyWith(
          ThreadsModel value, $Res Function(ThreadsModel) then) =
      _$ThreadsModelCopyWithImpl<$Res, ThreadsModel>;
  @useResult
  $Res call({String number, int stock, DateTime createdAt});
}

/// @nodoc
class _$ThreadsModelCopyWithImpl<$Res, $Val extends ThreadsModel>
    implements $ThreadsModelCopyWith<$Res> {
  _$ThreadsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? stock = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThreadsModelImplCopyWith<$Res>
    implements $ThreadsModelCopyWith<$Res> {
  factory _$$ThreadsModelImplCopyWith(
          _$ThreadsModelImpl value, $Res Function(_$ThreadsModelImpl) then) =
      __$$ThreadsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String number, int stock, DateTime createdAt});
}

/// @nodoc
class __$$ThreadsModelImplCopyWithImpl<$Res>
    extends _$ThreadsModelCopyWithImpl<$Res, _$ThreadsModelImpl>
    implements _$$ThreadsModelImplCopyWith<$Res> {
  __$$ThreadsModelImplCopyWithImpl(
      _$ThreadsModelImpl _value, $Res Function(_$ThreadsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? stock = null,
    Object? createdAt = null,
  }) {
    return _then(_$ThreadsModelImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ThreadsModelImpl implements _ThreadsModel {
  _$ThreadsModelImpl(
      {required this.number, required this.stock, required this.createdAt});

  factory _$ThreadsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreadsModelImplFromJson(json);

  @override
  final String number;
  @override
  final int stock;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ThreadsModel(number: $number, stock: $stock, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadsModelImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, number, stock, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadsModelImplCopyWith<_$ThreadsModelImpl> get copyWith =>
      __$$ThreadsModelImplCopyWithImpl<_$ThreadsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreadsModelImplToJson(
      this,
    );
  }
}

abstract class _ThreadsModel implements ThreadsModel {
  factory _ThreadsModel(
      {required final String number,
      required final int stock,
      required final DateTime createdAt}) = _$ThreadsModelImpl;

  factory _ThreadsModel.fromJson(Map<String, dynamic> json) =
      _$ThreadsModelImpl.fromJson;

  @override
  String get number;
  @override
  int get stock;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ThreadsModelImplCopyWith<_$ThreadsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
