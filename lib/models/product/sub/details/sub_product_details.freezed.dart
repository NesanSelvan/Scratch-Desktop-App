// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sub_product_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubProductDetailsModel _$SubProductDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _SubProductDetailsModel.fromJson(json);
}

/// @nodoc
class _$SubProductDetailsModelTearOff {
  const _$SubProductDetailsModelTearOff();

  _SubProductDetailsModel call(
      {required String id,
      required String productNumber,
      String name = "",
      required int stock,
      List<String> imagesList = const [],
      required DateTime createdAt}) {
    return _SubProductDetailsModel(
      id: id,
      productNumber: productNumber,
      name: name,
      stock: stock,
      imagesList: imagesList,
      createdAt: createdAt,
    );
  }

  SubProductDetailsModel fromJson(Map<String, Object?> json) {
    return SubProductDetailsModel.fromJson(json);
  }
}

/// @nodoc
const $SubProductDetailsModel = _$SubProductDetailsModelTearOff();

/// @nodoc
mixin _$SubProductDetailsModel {
  String get id => throw _privateConstructorUsedError;
  String get productNumber => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  List<String> get imagesList => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubProductDetailsModelCopyWith<SubProductDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubProductDetailsModelCopyWith<$Res> {
  factory $SubProductDetailsModelCopyWith(SubProductDetailsModel value,
          $Res Function(SubProductDetailsModel) then) =
      _$SubProductDetailsModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String productNumber,
      String name,
      int stock,
      List<String> imagesList,
      DateTime createdAt});
}

/// @nodoc
class _$SubProductDetailsModelCopyWithImpl<$Res>
    implements $SubProductDetailsModelCopyWith<$Res> {
  _$SubProductDetailsModelCopyWithImpl(this._value, this._then);

  final SubProductDetailsModel _value;
  // ignore: unused_field
  final $Res Function(SubProductDetailsModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? productNumber = freezed,
    Object? name = freezed,
    Object? stock = freezed,
    Object? imagesList = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productNumber: productNumber == freezed
          ? _value.productNumber
          : productNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      imagesList: imagesList == freezed
          ? _value.imagesList
          : imagesList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$SubProductDetailsModelCopyWith<$Res>
    implements $SubProductDetailsModelCopyWith<$Res> {
  factory _$SubProductDetailsModelCopyWith(_SubProductDetailsModel value,
          $Res Function(_SubProductDetailsModel) then) =
      __$SubProductDetailsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String productNumber,
      String name,
      int stock,
      List<String> imagesList,
      DateTime createdAt});
}

/// @nodoc
class __$SubProductDetailsModelCopyWithImpl<$Res>
    extends _$SubProductDetailsModelCopyWithImpl<$Res>
    implements _$SubProductDetailsModelCopyWith<$Res> {
  __$SubProductDetailsModelCopyWithImpl(_SubProductDetailsModel _value,
      $Res Function(_SubProductDetailsModel) _then)
      : super(_value, (v) => _then(v as _SubProductDetailsModel));

  @override
  _SubProductDetailsModel get _value => super._value as _SubProductDetailsModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? productNumber = freezed,
    Object? name = freezed,
    Object? stock = freezed,
    Object? imagesList = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_SubProductDetailsModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productNumber: productNumber == freezed
          ? _value.productNumber
          : productNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      imagesList: imagesList == freezed
          ? _value.imagesList
          : imagesList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SubProductDetailsModel implements _SubProductDetailsModel {
  const _$_SubProductDetailsModel(
      {required this.id,
      required this.productNumber,
      this.name = "",
      required this.stock,
      this.imagesList = const [],
      required this.createdAt});

  factory _$_SubProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$$_SubProductDetailsModelFromJson(json);

  @override
  final String id;
  @override
  final String productNumber;
  @JsonKey()
  @override
  final String name;
  @override
  final int stock;
  @JsonKey()
  @override
  final List<String> imagesList;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'SubProductDetailsModel(id: $id, productNumber: $productNumber, name: $name, stock: $stock, imagesList: $imagesList, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubProductDetailsModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.productNumber, productNumber) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.stock, stock) &&
            const DeepCollectionEquality()
                .equals(other.imagesList, imagesList) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(productNumber),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(stock),
      const DeepCollectionEquality().hash(imagesList),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$SubProductDetailsModelCopyWith<_SubProductDetailsModel> get copyWith =>
      __$SubProductDetailsModelCopyWithImpl<_SubProductDetailsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubProductDetailsModelToJson(this);
  }
}

abstract class _SubProductDetailsModel implements SubProductDetailsModel {
  const factory _SubProductDetailsModel(
      {required String id,
      required String productNumber,
      String name,
      required int stock,
      List<String> imagesList,
      required DateTime createdAt}) = _$_SubProductDetailsModel;

  factory _SubProductDetailsModel.fromJson(Map<String, dynamic> json) =
      _$_SubProductDetailsModel.fromJson;

  @override
  String get id;
  @override
  String get productNumber;
  @override
  String get name;
  @override
  int get stock;
  @override
  List<String> get imagesList;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$SubProductDetailsModelCopyWith<_SubProductDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
