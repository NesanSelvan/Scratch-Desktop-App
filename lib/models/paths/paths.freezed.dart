// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paths.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PathsModel _$PathsModelFromJson(Map<String, dynamic> json) {
  return _PathsModel.fromJson(json);
}

/// @nodoc
class _$PathsModelTearOff {
  const _$PathsModelTearOff();

  _PathsModel call(
      {required String id,
      required String name,
      required String path,
      required DateTime createdAt}) {
    return _PathsModel(
      id: id,
      name: name,
      path: path,
      createdAt: createdAt,
    );
  }

  PathsModel fromJson(Map<String, Object?> json) {
    return PathsModel.fromJson(json);
  }
}

/// @nodoc
const $PathsModel = _$PathsModelTearOff();

/// @nodoc
mixin _$PathsModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PathsModelCopyWith<PathsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PathsModelCopyWith<$Res> {
  factory $PathsModelCopyWith(
          PathsModel value, $Res Function(PathsModel) then) =
      _$PathsModelCopyWithImpl<$Res>;
  $Res call({String id, String name, String path, DateTime createdAt});
}

/// @nodoc
class _$PathsModelCopyWithImpl<$Res> implements $PathsModelCopyWith<$Res> {
  _$PathsModelCopyWithImpl(this._value, this._then);

  final PathsModel _value;
  // ignore: unused_field
  final $Res Function(PathsModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? path = freezed,
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
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$PathsModelCopyWith<$Res> implements $PathsModelCopyWith<$Res> {
  factory _$PathsModelCopyWith(
          _PathsModel value, $Res Function(_PathsModel) then) =
      __$PathsModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String path, DateTime createdAt});
}

/// @nodoc
class __$PathsModelCopyWithImpl<$Res> extends _$PathsModelCopyWithImpl<$Res>
    implements _$PathsModelCopyWith<$Res> {
  __$PathsModelCopyWithImpl(
      _PathsModel _value, $Res Function(_PathsModel) _then)
      : super(_value, (v) => _then(v as _PathsModel));

  @override
  _PathsModel get _value => super._value as _PathsModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? path = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_PathsModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PathsModel implements _PathsModel {
  _$_PathsModel(
      {required this.id,
      required this.name,
      required this.path,
      required this.createdAt});

  factory _$_PathsModel.fromJson(Map<String, dynamic> json) =>
      _$$_PathsModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String path;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'PathsModel(id: $id, name: $name, path: $path, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PathsModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$PathsModelCopyWith<_PathsModel> get copyWith =>
      __$PathsModelCopyWithImpl<_PathsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PathsModelToJson(this);
  }
}

abstract class _PathsModel implements PathsModel {
  factory _PathsModel(
      {required String id,
      required String name,
      required String path,
      required DateTime createdAt}) = _$_PathsModel;

  factory _PathsModel.fromJson(Map<String, dynamic> json) =
      _$_PathsModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get path;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$PathsModelCopyWith<_PathsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
