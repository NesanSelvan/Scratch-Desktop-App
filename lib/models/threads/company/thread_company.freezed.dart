// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThreadCompanyModel _$ThreadCompanyModelFromJson(Map<String, dynamic> json) {
  return _ThreadCompanyModel.fromJson(json);
}

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
      _$ThreadCompanyModelCopyWithImpl<$Res, ThreadCompanyModel>;
  @useResult
  $Res call(
      {String id,
      CompanyModel companyModel,
      ThreadProductModel threadProduct,
      DateTime createdAt});

  $CompanyModelCopyWith<$Res> get companyModel;
  $ThreadProductModelCopyWith<$Res> get threadProduct;
}

/// @nodoc
class _$ThreadCompanyModelCopyWithImpl<$Res, $Val extends ThreadCompanyModel>
    implements $ThreadCompanyModelCopyWith<$Res> {
  _$ThreadCompanyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyModel = null,
    Object? threadProduct = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      companyModel: null == companyModel
          ? _value.companyModel
          : companyModel // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      threadProduct: null == threadProduct
          ? _value.threadProduct
          : threadProduct // ignore: cast_nullable_to_non_nullable
              as ThreadProductModel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompanyModelCopyWith<$Res> get companyModel {
    return $CompanyModelCopyWith<$Res>(_value.companyModel, (value) {
      return _then(_value.copyWith(companyModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ThreadProductModelCopyWith<$Res> get threadProduct {
    return $ThreadProductModelCopyWith<$Res>(_value.threadProduct, (value) {
      return _then(_value.copyWith(threadProduct: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThreadCompanyModelImplCopyWith<$Res>
    implements $ThreadCompanyModelCopyWith<$Res> {
  factory _$$ThreadCompanyModelImplCopyWith(_$ThreadCompanyModelImpl value,
          $Res Function(_$ThreadCompanyModelImpl) then) =
      __$$ThreadCompanyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$ThreadCompanyModelImplCopyWithImpl<$Res>
    extends _$ThreadCompanyModelCopyWithImpl<$Res, _$ThreadCompanyModelImpl>
    implements _$$ThreadCompanyModelImplCopyWith<$Res> {
  __$$ThreadCompanyModelImplCopyWithImpl(_$ThreadCompanyModelImpl _value,
      $Res Function(_$ThreadCompanyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyModel = null,
    Object? threadProduct = null,
    Object? createdAt = null,
  }) {
    return _then(_$ThreadCompanyModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      companyModel: null == companyModel
          ? _value.companyModel
          : companyModel // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      threadProduct: null == threadProduct
          ? _value.threadProduct
          : threadProduct // ignore: cast_nullable_to_non_nullable
              as ThreadProductModel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ThreadCompanyModelImpl implements _ThreadCompanyModel {
  _$ThreadCompanyModelImpl(
      {required this.id,
      required this.companyModel,
      required this.threadProduct,
      required this.createdAt});

  factory _$ThreadCompanyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreadCompanyModelImplFromJson(json);

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
            other is _$ThreadCompanyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyModel, companyModel) ||
                other.companyModel == companyModel) &&
            (identical(other.threadProduct, threadProduct) ||
                other.threadProduct == threadProduct) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, companyModel, threadProduct, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadCompanyModelImplCopyWith<_$ThreadCompanyModelImpl> get copyWith =>
      __$$ThreadCompanyModelImplCopyWithImpl<_$ThreadCompanyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreadCompanyModelImplToJson(
      this,
    );
  }
}

abstract class _ThreadCompanyModel implements ThreadCompanyModel {
  factory _ThreadCompanyModel(
      {required final String id,
      required final CompanyModel companyModel,
      required final ThreadProductModel threadProduct,
      required final DateTime createdAt}) = _$ThreadCompanyModelImpl;

  factory _ThreadCompanyModel.fromJson(Map<String, dynamic> json) =
      _$ThreadCompanyModelImpl.fromJson;

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
  _$$ThreadCompanyModelImplCopyWith<_$ThreadCompanyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
