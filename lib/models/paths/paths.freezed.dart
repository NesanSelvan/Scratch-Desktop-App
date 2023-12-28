// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paths.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PathsModel _$PathsModelFromJson(Map<String, dynamic> json) {
  return _PathsModel.fromJson(json);
}

/// @nodoc
mixin _$PathsModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  set path(String value) => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PathsModelCopyWith<PathsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PathsModelCopyWith<$Res> {
  factory $PathsModelCopyWith(
          PathsModel value, $Res Function(PathsModel) then) =
      _$PathsModelCopyWithImpl<$Res, PathsModel>;
  @useResult
  $Res call({String id, String name, String path, DateTime createdAt});
}

/// @nodoc
class _$PathsModelCopyWithImpl<$Res, $Val extends PathsModel>
    implements $PathsModelCopyWith<$Res> {
  _$PathsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? createdAt = null,
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
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PathsModelImplCopyWith<$Res>
    implements $PathsModelCopyWith<$Res> {
  factory _$$PathsModelImplCopyWith(
          _$PathsModelImpl value, $Res Function(_$PathsModelImpl) then) =
      __$$PathsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String path, DateTime createdAt});
}

/// @nodoc
class __$$PathsModelImplCopyWithImpl<$Res>
    extends _$PathsModelCopyWithImpl<$Res, _$PathsModelImpl>
    implements _$$PathsModelImplCopyWith<$Res> {
  __$$PathsModelImplCopyWithImpl(
      _$PathsModelImpl _value, $Res Function(_$PathsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? createdAt = null,
  }) {
    return _then(_$PathsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PathsModelImpl implements _PathsModel {
  _$PathsModelImpl(
      {required this.id,
      required this.name,
      required this.path,
      required this.createdAt});

  factory _$PathsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PathsModelImplFromJson(json);

  @override
  String id;
  @override
  String name;
  @override
  String path;
  @override
  DateTime createdAt;

  @override
  String toString() {
    return 'PathsModel(id: $id, name: $name, path: $path, createdAt: $createdAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PathsModelImplCopyWith<_$PathsModelImpl> get copyWith =>
      __$$PathsModelImplCopyWithImpl<_$PathsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PathsModelImplToJson(
      this,
    );
  }
}

abstract class _PathsModel implements PathsModel {
  factory _PathsModel(
      {required String id,
      required String name,
      required String path,
      required DateTime createdAt}) = _$PathsModelImpl;

  factory _PathsModel.fromJson(Map<String, dynamic> json) =
      _$PathsModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  String get path;
  set path(String value);
  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$PathsModelImplCopyWith<_$PathsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
