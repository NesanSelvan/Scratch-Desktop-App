// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sub_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) {
  return _SubCategoryModel.fromJson(json);
}

/// @nodoc
class _$SubCategoryModelTearOff {
  const _$SubCategoryModelTearOff();

  _SubCategoryModel call(
      String? id, int? hsnCode, String? subCategoryName, DateTime createdAt) {
    return _SubCategoryModel(
      id,
      hsnCode,
      subCategoryName,
      createdAt,
    );
  }

  SubCategoryModel fromJson(Map<String, Object?> json) {
    return SubCategoryModel.fromJson(json);
  }
}

/// @nodoc
const $SubCategoryModel = _$SubCategoryModelTearOff();

/// @nodoc
mixin _$SubCategoryModel {
  String? get id => throw _privateConstructorUsedError;
  int? get hsnCode => throw _privateConstructorUsedError;
  String? get subCategoryName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoryModelCopyWith<SubCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryModelCopyWith<$Res> {
  factory $SubCategoryModelCopyWith(
          SubCategoryModel value, $Res Function(SubCategoryModel) then) =
      _$SubCategoryModelCopyWithImpl<$Res>;
  $Res call(
      {String? id, int? hsnCode, String? subCategoryName, DateTime createdAt});
}

/// @nodoc
class _$SubCategoryModelCopyWithImpl<$Res>
    implements $SubCategoryModelCopyWith<$Res> {
  _$SubCategoryModelCopyWithImpl(this._value, this._then);

  final SubCategoryModel _value;
  // ignore: unused_field
  final $Res Function(SubCategoryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? hsnCode = freezed,
    Object? subCategoryName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      hsnCode: hsnCode == freezed
          ? _value.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as int?,
      subCategoryName: subCategoryName == freezed
          ? _value.subCategoryName
          : subCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$SubCategoryModelCopyWith<$Res>
    implements $SubCategoryModelCopyWith<$Res> {
  factory _$SubCategoryModelCopyWith(
          _SubCategoryModel value, $Res Function(_SubCategoryModel) then) =
      __$SubCategoryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id, int? hsnCode, String? subCategoryName, DateTime createdAt});
}

/// @nodoc
class __$SubCategoryModelCopyWithImpl<$Res>
    extends _$SubCategoryModelCopyWithImpl<$Res>
    implements _$SubCategoryModelCopyWith<$Res> {
  __$SubCategoryModelCopyWithImpl(
      _SubCategoryModel _value, $Res Function(_SubCategoryModel) _then)
      : super(_value, (v) => _then(v as _SubCategoryModel));

  @override
  _SubCategoryModel get _value => super._value as _SubCategoryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? hsnCode = freezed,
    Object? subCategoryName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_SubCategoryModel(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      hsnCode == freezed
          ? _value.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as int?,
      subCategoryName == freezed
          ? _value.subCategoryName
          : subCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubCategoryModel implements _SubCategoryModel {
  const _$_SubCategoryModel(
      this.id, this.hsnCode, this.subCategoryName, this.createdAt);

  factory _$_SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_SubCategoryModelFromJson(json);

  @override
  final String? id;
  @override
  final int? hsnCode;
  @override
  final String? subCategoryName;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'SubCategoryModel(id: $id, hsnCode: $hsnCode, subCategoryName: $subCategoryName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubCategoryModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.hsnCode, hsnCode) &&
            const DeepCollectionEquality()
                .equals(other.subCategoryName, subCategoryName) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(hsnCode),
      const DeepCollectionEquality().hash(subCategoryName),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$SubCategoryModelCopyWith<_SubCategoryModel> get copyWith =>
      __$SubCategoryModelCopyWithImpl<_SubCategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubCategoryModelToJson(this);
  }
}

abstract class _SubCategoryModel implements SubCategoryModel {
  const factory _SubCategoryModel(String? id, int? hsnCode,
      String? subCategoryName, DateTime createdAt) = _$_SubCategoryModel;

  factory _SubCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_SubCategoryModel.fromJson;

  @override
  String? get id;
  @override
  int? get hsnCode;
  @override
  String? get subCategoryName;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$SubCategoryModelCopyWith<_SubCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
