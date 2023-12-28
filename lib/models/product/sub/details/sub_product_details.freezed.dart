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
  set id(String value) => throw _privateConstructorUsedError;
  String get productNumber => throw _privateConstructorUsedError;
  set productNumber(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  set stock(int value) => throw _privateConstructorUsedError;
  List<String> get imagesList => throw _privateConstructorUsedError;
  set imagesList(List<String> value) => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime value) => throw _privateConstructorUsedError;

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
          ? _value.imagesList
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
  _$SubProductDetailsModelImpl(
      {required this.id,
      required this.productNumber,
      this.name = "",
      required this.stock,
      this.imagesList = const [],
      required this.createdAt});

  factory _$SubProductDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubProductDetailsModelImplFromJson(json);

  @override
  String id;
  @override
  String productNumber;
  @override
  @JsonKey()
  String name;
  @override
  int stock;
  @override
  @JsonKey()
  List<String> imagesList;
  @override
  DateTime createdAt;

  @override
  String toString() {
    return 'SubProductDetailsModel(id: $id, productNumber: $productNumber, name: $name, stock: $stock, imagesList: $imagesList, createdAt: $createdAt)';
  }

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
  factory _SubProductDetailsModel(
      {required String id,
      required String productNumber,
      String name,
      required int stock,
      List<String> imagesList,
      required DateTime createdAt}) = _$SubProductDetailsModelImpl;

  factory _SubProductDetailsModel.fromJson(Map<String, dynamic> json) =
      _$SubProductDetailsModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get productNumber;
  set productNumber(String value);
  @override
  String get name;
  set name(String value);
  @override
  int get stock;
  set stock(int value);
  @override
  List<String> get imagesList;
  set imagesList(List<String> value);
  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$SubProductDetailsModelImplCopyWith<_$SubProductDetailsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
