// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'thread_company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThreadCompanyModel _$ThreadCompanyModelFromJson(Map<String, dynamic> json) {
  return _ThreadCompanyModel.fromJson(json);
}

/// @nodoc
class _$ThreadCompanyModelTearOff {
  const _$ThreadCompanyModelTearOff();

  _ThreadCompanyModel call(
      {required String id,
      required CompanyModel companyModel,
      required ThreadProductModel threadProduct,
      required DateTime createdAt}) {
    return _ThreadCompanyModel(
      id: id,
      companyModel: companyModel,
      threadProduct: threadProduct,
      createdAt: createdAt,
    );
  }

  ThreadCompanyModel fromJson(Map<String, Object?> json) {
    return ThreadCompanyModel.fromJson(json);
  }
}

/// @nodoc
const $ThreadCompanyModel = _$ThreadCompanyModelTearOff();

/// @nodoc
mixin _$ThreadCompanyModel {
  String get id => throw _privateConstructorUsedError;
  CompanyModel get companyModel => throw _privateConstructorUsedError;
  ThreadProductModel get threadProduct => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThreadCompanyModelCopyWith<ThreadCompanyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadCompanyModelCopyWith<$Res> {
  factory $ThreadCompanyModelCopyWith(
          ThreadCompanyModel value, $Res Function(ThreadCompanyModel) then) =
      _$ThreadCompanyModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      CompanyModel companyModel,
      ThreadProductModel threadProduct,
      DateTime createdAt});

  $CompanyModelCopyWith<$Res> get companyModel;
  $ThreadProductModelCopyWith<$Res> get threadProduct;
}

/// @nodoc
class _$ThreadCompanyModelCopyWithImpl<$Res>
    implements $ThreadCompanyModelCopyWith<$Res> {
  _$ThreadCompanyModelCopyWithImpl(this._value, this._then);

  final ThreadCompanyModel _value;
  // ignore: unused_field
  final $Res Function(ThreadCompanyModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? companyModel = freezed,
    Object? threadProduct = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      companyModel: companyModel == freezed
          ? _value.companyModel
          : companyModel // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      threadProduct: threadProduct == freezed
          ? _value.threadProduct
          : threadProduct // ignore: cast_nullable_to_non_nullable
              as ThreadProductModel,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $CompanyModelCopyWith<$Res> get companyModel {
    return $CompanyModelCopyWith<$Res>(_value.companyModel, (value) {
      return _then(_value.copyWith(companyModel: value));
    });
  }

  @override
  $ThreadProductModelCopyWith<$Res> get threadProduct {
    return $ThreadProductModelCopyWith<$Res>(_value.threadProduct, (value) {
      return _then(_value.copyWith(threadProduct: value));
    });
  }
}

/// @nodoc
abstract class _$ThreadCompanyModelCopyWith<$Res>
    implements $ThreadCompanyModelCopyWith<$Res> {
  factory _$ThreadCompanyModelCopyWith(
          _ThreadCompanyModel value, $Res Function(_ThreadCompanyModel) then) =
      __$ThreadCompanyModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      CompanyModel companyModel,
      ThreadProductModel threadProduct,
      DateTime createdAt});

  @override
  $CompanyModelCopyWith<$Res> get companyModel;
  @override
  $ThreadProductModelCopyWith<$Res> get threadProduct;
}

/// @nodoc
class __$ThreadCompanyModelCopyWithImpl<$Res>
    extends _$ThreadCompanyModelCopyWithImpl<$Res>
    implements _$ThreadCompanyModelCopyWith<$Res> {
  __$ThreadCompanyModelCopyWithImpl(
      _ThreadCompanyModel _value, $Res Function(_ThreadCompanyModel) _then)
      : super(_value, (v) => _then(v as _ThreadCompanyModel));

  @override
  _ThreadCompanyModel get _value => super._value as _ThreadCompanyModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? companyModel = freezed,
    Object? threadProduct = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_ThreadCompanyModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      companyModel: companyModel == freezed
          ? _value.companyModel
          : companyModel // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      threadProduct: threadProduct == freezed
          ? _value.threadProduct
          : threadProduct // ignore: cast_nullable_to_non_nullable
              as ThreadProductModel,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ThreadCompanyModel implements _ThreadCompanyModel {
  _$_ThreadCompanyModel(
      {required this.id,
      required this.companyModel,
      required this.threadProduct,
      required this.createdAt});

  factory _$_ThreadCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$$_ThreadCompanyModelFromJson(json);

  @override
  final String id;
  @override
  final CompanyModel companyModel;
  @override
  final ThreadProductModel threadProduct;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ThreadCompanyModel(id: $id, companyModel: $companyModel, threadProduct: $threadProduct, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThreadCompanyModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.companyModel, companyModel) &&
            const DeepCollectionEquality()
                .equals(other.threadProduct, threadProduct) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(companyModel),
      const DeepCollectionEquality().hash(threadProduct),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$ThreadCompanyModelCopyWith<_ThreadCompanyModel> get copyWith =>
      __$ThreadCompanyModelCopyWithImpl<_ThreadCompanyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThreadCompanyModelToJson(this);
  }
}

abstract class _ThreadCompanyModel implements ThreadCompanyModel {
  factory _ThreadCompanyModel(
      {required String id,
      required CompanyModel companyModel,
      required ThreadProductModel threadProduct,
      required DateTime createdAt}) = _$_ThreadCompanyModel;

  factory _ThreadCompanyModel.fromJson(Map<String, dynamic> json) =
      _$_ThreadCompanyModel.fromJson;

  @override
  String get id;
  @override
  CompanyModel get companyModel;
  @override
  ThreadProductModel get threadProduct;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$ThreadCompanyModelCopyWith<_ThreadCompanyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
