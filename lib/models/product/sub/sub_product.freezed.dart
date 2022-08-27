// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sub_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubProductModel _$SubProductModelFromJson(Map<String, dynamic> json) {
  return _SubProductModel.fromJson(json);
}

/// @nodoc
class _$SubProductModelTearOff {
  const _$SubProductModelTearOff();

  _SubProductModel call(
      {required String id,
      required ProductModel productModel,
      List<SubProductDetailsModel> subProducts = const [],
      required DateTime createdAt}) {
    return _SubProductModel(
      id: id,
      productModel: productModel,
      subProducts: subProducts,
      createdAt: createdAt,
    );
  }

  SubProductModel fromJson(Map<String, Object?> json) {
    return SubProductModel.fromJson(json);
  }
}

/// @nodoc
const $SubProductModel = _$SubProductModelTearOff();

/// @nodoc
mixin _$SubProductModel {
  String get id => throw _privateConstructorUsedError;
  ProductModel get productModel => throw _privateConstructorUsedError;
  List<SubProductDetailsModel> get subProducts =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubProductModelCopyWith<SubProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubProductModelCopyWith<$Res> {
  factory $SubProductModelCopyWith(
          SubProductModel value, $Res Function(SubProductModel) then) =
      _$SubProductModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      ProductModel productModel,
      List<SubProductDetailsModel> subProducts,
      DateTime createdAt});

  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class _$SubProductModelCopyWithImpl<$Res>
    implements $SubProductModelCopyWith<$Res> {
  _$SubProductModelCopyWithImpl(this._value, this._then);

  final SubProductModel _value;
  // ignore: unused_field
  final $Res Function(SubProductModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? productModel = freezed,
    Object? subProducts = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productModel: productModel == freezed
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      subProducts: subProducts == freezed
          ? _value.subProducts
          : subProducts // ignore: cast_nullable_to_non_nullable
              as List<SubProductDetailsModel>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $ProductModelCopyWith<$Res> get productModel {
    return $ProductModelCopyWith<$Res>(_value.productModel, (value) {
      return _then(_value.copyWith(productModel: value));
    });
  }
}

/// @nodoc
abstract class _$SubProductModelCopyWith<$Res>
    implements $SubProductModelCopyWith<$Res> {
  factory _$SubProductModelCopyWith(
          _SubProductModel value, $Res Function(_SubProductModel) then) =
      __$SubProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      ProductModel productModel,
      List<SubProductDetailsModel> subProducts,
      DateTime createdAt});

  @override
  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class __$SubProductModelCopyWithImpl<$Res>
    extends _$SubProductModelCopyWithImpl<$Res>
    implements _$SubProductModelCopyWith<$Res> {
  __$SubProductModelCopyWithImpl(
      _SubProductModel _value, $Res Function(_SubProductModel) _then)
      : super(_value, (v) => _then(v as _SubProductModel));

  @override
  _SubProductModel get _value => super._value as _SubProductModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? productModel = freezed,
    Object? subProducts = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_SubProductModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productModel: productModel == freezed
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      subProducts: subProducts == freezed
          ? _value.subProducts
          : subProducts // ignore: cast_nullable_to_non_nullable
              as List<SubProductDetailsModel>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SubProductModel implements _SubProductModel {
  const _$_SubProductModel(
      {required this.id,
      required this.productModel,
      this.subProducts = const [],
      required this.createdAt});

  factory _$_SubProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_SubProductModelFromJson(json);

  @override
  final String id;
  @override
  final ProductModel productModel;
  @JsonKey()
  @override
  final List<SubProductDetailsModel> subProducts;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'SubProductModel(id: $id, productModel: $productModel, subProducts: $subProducts, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubProductModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.productModel, productModel) &&
            const DeepCollectionEquality()
                .equals(other.subProducts, subProducts) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(productModel),
      const DeepCollectionEquality().hash(subProducts),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$SubProductModelCopyWith<_SubProductModel> get copyWith =>
      __$SubProductModelCopyWithImpl<_SubProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubProductModelToJson(this);
  }
}

abstract class _SubProductModel implements SubProductModel {
  const factory _SubProductModel(
      {required String id,
      required ProductModel productModel,
      List<SubProductDetailsModel> subProducts,
      required DateTime createdAt}) = _$_SubProductModel;

  factory _SubProductModel.fromJson(Map<String, dynamic> json) =
      _$_SubProductModel.fromJson;

  @override
  String get id;
  @override
  ProductModel get productModel;
  @override
  List<SubProductDetailsModel> get subProducts;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$SubProductModelCopyWith<_SubProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
