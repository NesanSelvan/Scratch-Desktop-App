// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'thread_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThreadProductModel _$ThreadProductModelFromJson(Map<String, dynamic> json) {
  return _ThreadProductModel.fromJson(json);
}

/// @nodoc
class _$ThreadProductModelTearOff {
  const _$ThreadProductModelTearOff();

  _ThreadProductModel call(
      {required String id,
      required ProductModel product,
      List<ThreadsModel> threads = const [],
      required DateTime createdAt}) {
    return _ThreadProductModel(
      id: id,
      product: product,
      threads: threads,
      createdAt: createdAt,
    );
  }

  ThreadProductModel fromJson(Map<String, Object?> json) {
    return ThreadProductModel.fromJson(json);
  }
}

/// @nodoc
const $ThreadProductModel = _$ThreadProductModelTearOff();

/// @nodoc
mixin _$ThreadProductModel {
  String get id => throw _privateConstructorUsedError;
  ProductModel get product => throw _privateConstructorUsedError;
  List<ThreadsModel> get threads => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThreadProductModelCopyWith<ThreadProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadProductModelCopyWith<$Res> {
  factory $ThreadProductModelCopyWith(
          ThreadProductModel value, $Res Function(ThreadProductModel) then) =
      _$ThreadProductModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      ProductModel product,
      List<ThreadsModel> threads,
      DateTime createdAt});

  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$ThreadProductModelCopyWithImpl<$Res>
    implements $ThreadProductModelCopyWith<$Res> {
  _$ThreadProductModelCopyWithImpl(this._value, this._then);

  final ThreadProductModel _value;
  // ignore: unused_field
  final $Res Function(ThreadProductModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? threads = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      threads: threads == freezed
          ? _value.threads
          : threads // ignore: cast_nullable_to_non_nullable
              as List<ThreadsModel>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc
abstract class _$ThreadProductModelCopyWith<$Res>
    implements $ThreadProductModelCopyWith<$Res> {
  factory _$ThreadProductModelCopyWith(
          _ThreadProductModel value, $Res Function(_ThreadProductModel) then) =
      __$ThreadProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      ProductModel product,
      List<ThreadsModel> threads,
      DateTime createdAt});

  @override
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$ThreadProductModelCopyWithImpl<$Res>
    extends _$ThreadProductModelCopyWithImpl<$Res>
    implements _$ThreadProductModelCopyWith<$Res> {
  __$ThreadProductModelCopyWithImpl(
      _ThreadProductModel _value, $Res Function(_ThreadProductModel) _then)
      : super(_value, (v) => _then(v as _ThreadProductModel));

  @override
  _ThreadProductModel get _value => super._value as _ThreadProductModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? threads = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_ThreadProductModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      threads: threads == freezed
          ? _value.threads
          : threads // ignore: cast_nullable_to_non_nullable
              as List<ThreadsModel>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ThreadProductModel implements _ThreadProductModel {
  _$_ThreadProductModel(
      {required this.id,
      required this.product,
      this.threads = const [],
      required this.createdAt});

  factory _$_ThreadProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ThreadProductModelFromJson(json);

  @override
  final String id;
  @override
  final ProductModel product;
  @JsonKey()
  @override
  final List<ThreadsModel> threads;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ThreadProductModel(id: $id, product: $product, threads: $threads, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThreadProductModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.product, product) &&
            const DeepCollectionEquality().equals(other.threads, threads) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(product),
      const DeepCollectionEquality().hash(threads),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$ThreadProductModelCopyWith<_ThreadProductModel> get copyWith =>
      __$ThreadProductModelCopyWithImpl<_ThreadProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThreadProductModelToJson(this);
  }
}

abstract class _ThreadProductModel implements ThreadProductModel {
  factory _ThreadProductModel(
      {required String id,
      required ProductModel product,
      List<ThreadsModel> threads,
      required DateTime createdAt}) = _$_ThreadProductModel;

  factory _ThreadProductModel.fromJson(Map<String, dynamic> json) =
      _$_ThreadProductModel.fromJson;

  @override
  String get id;
  @override
  ProductModel get product;
  @override
  List<ThreadsModel> get threads;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$ThreadProductModelCopyWith<_ThreadProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
