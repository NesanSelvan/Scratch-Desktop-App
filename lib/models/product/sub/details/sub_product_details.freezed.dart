// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_product_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubProductDetailsModel _$SubProductDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _SubProductDetailsModel.fromJson(json);
}

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
      _$SubProductDetailsModelCopyWithImpl<$Res, SubProductDetailsModel>;
  @useResult
  $Res call(
      {String id,
      String productNumber,
      String name,
      int stock,
      List<String> imagesList,
      DateTime createdAt});
}

/// @nodoc
class _$SubProductDetailsModelCopyWithImpl<$Res,
        $Val extends SubProductDetailsModel>
    implements $SubProductDetailsModelCopyWith<$Res> {
  _$SubProductDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productNumber = null,
    Object? name = null,
    Object? stock = null,
    Object? imagesList = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productNumber: null == productNumber
          ? _value.productNumber
          : productNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      imagesList: null == imagesList
          ? _value.imagesList
          : imagesList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubProductDetailsModelImplCopyWith<$Res>
    implements $SubProductDetailsModelCopyWith<$Res> {
  factory _$$SubProductDetailsModelImplCopyWith(
          _$SubProductDetailsModelImpl value,
          $Res Function(_$SubProductDetailsModelImpl) then) =
      __$$SubProductDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productNumber,
      String name,
      int stock,
      List<String> imagesList,
      DateTime createdAt});
}

/// @nodoc
class __$$SubProductDetailsModelImplCopyWithImpl<$Res>
    extends _$SubProductDetailsModelCopyWithImpl<$Res,
        _$SubProductDetailsModelImpl>
    implements _$$SubProductDetailsModelImplCopyWith<$Res> {
  __$$SubProductDetailsModelImplCopyWithImpl(
      _$SubProductDetailsModelImpl _value,
      $Res Function(_$SubProductDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productNumber = null,
    Object? name = null,
    Object? stock = null,
    Object? imagesList = null,
    Object? createdAt = null,
  }) {
    return _then(_$SubProductDetailsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productNumber: null == productNumber
          ? _value.productNumber
          : productNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      imagesList: null == imagesList
          ? _value._imagesList
          : imagesList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SubProductDetailsModelImpl implements _SubProductDetailsModel {
  const _$SubProductDetailsModelImpl(
      {required this.id,
      required this.productNumber,
      this.name = "",
      required this.stock,
      final List<String> imagesList = const [],
      required this.createdAt})
      : _imagesList = imagesList;

  factory _$SubProductDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubProductDetailsModelImplFromJson(json);

  @override
  final String id;
  @override
  final String productNumber;
  @override
  @JsonKey()
  final String name;
  @override
  final int stock;
  final List<String> _imagesList;
  @override
  @JsonKey()
  List<String> get imagesList {
    if (_imagesList is EqualUnmodifiableListView) return _imagesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesList);
  }

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
            other is _$SubProductDetailsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productNumber, productNumber) ||
                other.productNumber == productNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            const DeepCollectionEquality()
                .equals(other._imagesList, _imagesList) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, productNumber, name, stock,
      const DeepCollectionEquality().hash(_imagesList), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubProductDetailsModelImplCopyWith<_$SubProductDetailsModelImpl>
      get copyWith => __$$SubProductDetailsModelImplCopyWithImpl<
          _$SubProductDetailsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubProductDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _SubProductDetailsModel implements SubProductDetailsModel {
  const factory _SubProductDetailsModel(
      {required final String id,
      required final String productNumber,
      final String name,
      required final int stock,
      final List<String> imagesList,
      required final DateTime createdAt}) = _$SubProductDetailsModelImpl;

  factory _SubProductDetailsModel.fromJson(Map<String, dynamic> json) =
      _$SubProductDetailsModelImpl.fromJson;

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
  _$$SubProductDetailsModelImplCopyWith<_$SubProductDetailsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
