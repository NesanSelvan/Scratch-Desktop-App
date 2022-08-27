// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'threads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThreadsModel _$ThreadsModelFromJson(Map<String, dynamic> json) {
  return _ThreadsModel.fromJson(json);
}

/// @nodoc
class _$ThreadsModelTearOff {
  const _$ThreadsModelTearOff();

  _ThreadsModel call(
      {required String number,
      required int stock,
      required DateTime createdAt}) {
    return _ThreadsModel(
      number: number,
      stock: stock,
      createdAt: createdAt,
    );
  }

  ThreadsModel fromJson(Map<String, Object?> json) {
    return ThreadsModel.fromJson(json);
  }
}

/// @nodoc
const $ThreadsModel = _$ThreadsModelTearOff();

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
      _$ThreadsModelCopyWithImpl<$Res>;
  $Res call({String number, int stock, DateTime createdAt});
}

/// @nodoc
class _$ThreadsModelCopyWithImpl<$Res> implements $ThreadsModelCopyWith<$Res> {
  _$ThreadsModelCopyWithImpl(this._value, this._then);

  final ThreadsModel _value;
  // ignore: unused_field
  final $Res Function(ThreadsModel) _then;

  @override
  $Res call({
    Object? number = freezed,
    Object? stock = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ThreadsModelCopyWith<$Res>
    implements $ThreadsModelCopyWith<$Res> {
  factory _$ThreadsModelCopyWith(
          _ThreadsModel value, $Res Function(_ThreadsModel) then) =
      __$ThreadsModelCopyWithImpl<$Res>;
  @override
  $Res call({String number, int stock, DateTime createdAt});
}

/// @nodoc
class __$ThreadsModelCopyWithImpl<$Res> extends _$ThreadsModelCopyWithImpl<$Res>
    implements _$ThreadsModelCopyWith<$Res> {
  __$ThreadsModelCopyWithImpl(
      _ThreadsModel _value, $Res Function(_ThreadsModel) _then)
      : super(_value, (v) => _then(v as _ThreadsModel));

  @override
  _ThreadsModel get _value => super._value as _ThreadsModel;

  @override
  $Res call({
    Object? number = freezed,
    Object? stock = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_ThreadsModel(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ThreadsModel implements _ThreadsModel {
  _$_ThreadsModel(
      {required this.number, required this.stock, required this.createdAt});

  factory _$_ThreadsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ThreadsModelFromJson(json);

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
            other is _ThreadsModel &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.stock, stock) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(stock),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$ThreadsModelCopyWith<_ThreadsModel> get copyWith =>
      __$ThreadsModelCopyWithImpl<_ThreadsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThreadsModelToJson(this);
  }
}

abstract class _ThreadsModel implements ThreadsModel {
  factory _ThreadsModel(
      {required String number,
      required int stock,
      required DateTime createdAt}) = _$_ThreadsModel;

  factory _ThreadsModel.fromJson(Map<String, dynamic> json) =
      _$_ThreadsModel.fromJson;

  @override
  String get number;
  @override
  int get stock;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$ThreadsModelCopyWith<_ThreadsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
