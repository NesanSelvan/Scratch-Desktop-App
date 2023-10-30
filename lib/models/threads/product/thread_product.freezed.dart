// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThreadProductModel _$ThreadProductModelFromJson(Map<String, dynamic> json) {
  return _ThreadProductModel.fromJson(json);
}

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
      _$ThreadProductModelCopyWithImpl<$Res, ThreadProductModel>;
  @useResult
  $Res call(
      {String id,
      ProductModel product,
      List<ThreadsModel> threads,
      DateTime createdAt});

  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$ThreadProductModelCopyWithImpl<$Res, $Val extends ThreadProductModel>
    implements $ThreadProductModelCopyWith<$Res> {
  _$ThreadProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? threads = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      threads: null == threads
          ? _value.threads
          : threads // ignore: cast_nullable_to_non_nullable
              as List<ThreadsModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThreadProductModelImplCopyWith<$Res>
    implements $ThreadProductModelCopyWith<$Res> {
  factory _$$ThreadProductModelImplCopyWith(_$ThreadProductModelImpl value,
          $Res Function(_$ThreadProductModelImpl) then) =
      __$$ThreadProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ProductModel product,
      List<ThreadsModel> threads,
      DateTime createdAt});

  @override
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$ThreadProductModelImplCopyWithImpl<$Res>
    extends _$ThreadProductModelCopyWithImpl<$Res, _$ThreadProductModelImpl>
    implements _$$ThreadProductModelImplCopyWith<$Res> {
  __$$ThreadProductModelImplCopyWithImpl(_$ThreadProductModelImpl _value,
      $Res Function(_$ThreadProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? threads = null,
    Object? createdAt = null,
  }) {
    return _then(_$ThreadProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      threads: null == threads
          ? _value._threads
          : threads // ignore: cast_nullable_to_non_nullable
              as List<ThreadsModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ThreadProductModelImpl implements _ThreadProductModel {
  _$ThreadProductModelImpl(
      {required this.id,
      required this.product,
      final List<ThreadsModel> threads = const [],
      required this.createdAt})
      : _threads = threads;

  factory _$ThreadProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreadProductModelImplFromJson(json);

  @override
  final String id;
  @override
  final ProductModel product;
  final List<ThreadsModel> _threads;
  @override
  @JsonKey()
  List<ThreadsModel> get threads {
    if (_threads is EqualUnmodifiableListView) return _threads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_threads);
  }

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
            other is _$ThreadProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality().equals(other._threads, _threads) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, product,
      const DeepCollectionEquality().hash(_threads), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadProductModelImplCopyWith<_$ThreadProductModelImpl> get copyWith =>
      __$$ThreadProductModelImplCopyWithImpl<_$ThreadProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreadProductModelImplToJson(
      this,
    );
  }
}

abstract class _ThreadProductModel implements ThreadProductModel {
  factory _ThreadProductModel(
      {required final String id,
      required final ProductModel product,
      final List<ThreadsModel> threads,
      required final DateTime createdAt}) = _$ThreadProductModelImpl;

  factory _ThreadProductModel.fromJson(Map<String, dynamic> json) =
      _$ThreadProductModelImpl.fromJson;

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
  _$$ThreadProductModelImplCopyWith<_$ThreadProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
