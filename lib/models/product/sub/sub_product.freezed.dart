// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubProductModel _$SubProductModelFromJson(Map<String, dynamic> json) {
  return _SubProductModel.fromJson(json);
}

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
      _$SubProductModelCopyWithImpl<$Res, SubProductModel>;
  @useResult
  $Res call(
      {String id,
      ProductModel productModel,
      List<SubProductDetailsModel> subProducts,
      DateTime createdAt});

  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class _$SubProductModelCopyWithImpl<$Res, $Val extends SubProductModel>
    implements $SubProductModelCopyWith<$Res> {
  _$SubProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productModel = null,
    Object? subProducts = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productModel: null == productModel
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      subProducts: null == subProducts
          ? _value.subProducts
          : subProducts // ignore: cast_nullable_to_non_nullable
              as List<SubProductDetailsModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get productModel {
    return $ProductModelCopyWith<$Res>(_value.productModel, (value) {
      return _then(_value.copyWith(productModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubProductModelImplCopyWith<$Res>
    implements $SubProductModelCopyWith<$Res> {
  factory _$$SubProductModelImplCopyWith(_$SubProductModelImpl value,
          $Res Function(_$SubProductModelImpl) then) =
      __$$SubProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ProductModel productModel,
      List<SubProductDetailsModel> subProducts,
      DateTime createdAt});

  @override
  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class __$$SubProductModelImplCopyWithImpl<$Res>
    extends _$SubProductModelCopyWithImpl<$Res, _$SubProductModelImpl>
    implements _$$SubProductModelImplCopyWith<$Res> {
  __$$SubProductModelImplCopyWithImpl(
      _$SubProductModelImpl _value, $Res Function(_$SubProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productModel = null,
    Object? subProducts = null,
    Object? createdAt = null,
  }) {
    return _then(_$SubProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productModel: null == productModel
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      subProducts: null == subProducts
          ? _value._subProducts
          : subProducts // ignore: cast_nullable_to_non_nullable
              as List<SubProductDetailsModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SubProductModelImpl implements _SubProductModel {
  const _$SubProductModelImpl(
      {required this.id,
      required this.productModel,
      final List<SubProductDetailsModel> subProducts = const [],
      required this.createdAt})
      : _subProducts = subProducts;

  factory _$SubProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubProductModelImplFromJson(json);

  @override
  final String id;
  @override
  final ProductModel productModel;
  final List<SubProductDetailsModel> _subProducts;
  @override
  @JsonKey()
  List<SubProductDetailsModel> get subProducts {
    if (_subProducts is EqualUnmodifiableListView) return _subProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subProducts);
  }

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
            other is _$SubProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productModel, productModel) ||
                other.productModel == productModel) &&
            const DeepCollectionEquality()
                .equals(other._subProducts, _subProducts) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, productModel,
      const DeepCollectionEquality().hash(_subProducts), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubProductModelImplCopyWith<_$SubProductModelImpl> get copyWith =>
      __$$SubProductModelImplCopyWithImpl<_$SubProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubProductModelImplToJson(
      this,
    );
  }
}

abstract class _SubProductModel implements SubProductModel {
  const factory _SubProductModel(
      {required final String id,
      required final ProductModel productModel,
      final List<SubProductDetailsModel> subProducts,
      required final DateTime createdAt}) = _$SubProductModelImpl;

  factory _SubProductModel.fromJson(Map<String, dynamic> json) =
      _$SubProductModelImpl.fromJson;

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
  _$$SubProductModelImplCopyWith<_$SubProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
