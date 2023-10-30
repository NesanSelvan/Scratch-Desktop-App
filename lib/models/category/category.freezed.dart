// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  String get id => throw _privateConstructorUsedError;
  String? get catSymbol => throw _privateConstructorUsedError;
  int get hsnCode => throw _privateConstructorUsedError;
  int? get categoryNo => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call(
      {String id,
      String? catSymbol,
      int hsnCode,
      int? categoryNo,
      String category,
      double tax,
      DateTime dateTime});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? catSymbol = freezed,
    Object? hsnCode = null,
    Object? categoryNo = freezed,
    Object? category = null,
    Object? tax = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      catSymbol: freezed == catSymbol
          ? _value.catSymbol
          : catSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      hsnCode: null == hsnCode
          ? _value.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as int,
      categoryNo: freezed == categoryNo
          ? _value.categoryNo
          : categoryNo // ignore: cast_nullable_to_non_nullable
              as int?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? catSymbol,
      int hsnCode,
      int? categoryNo,
      String category,
      double tax,
      DateTime dateTime});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? catSymbol = freezed,
    Object? hsnCode = null,
    Object? categoryNo = freezed,
    Object? category = null,
    Object? tax = null,
    Object? dateTime = null,
  }) {
    return _then(_$CategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      catSymbol: freezed == catSymbol
          ? _value.catSymbol
          : catSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      hsnCode: null == hsnCode
          ? _value.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as int,
      categoryNo: freezed == categoryNo
          ? _value.categoryNo
          : categoryNo // ignore: cast_nullable_to_non_nullable
              as int?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl(
      {required this.id,
      this.catSymbol,
      required this.hsnCode,
      this.categoryNo,
      required this.category,
      required this.tax,
      required this.dateTime});

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? catSymbol;
  @override
  final int hsnCode;
  @override
  final int? categoryNo;
  @override
  final String category;
  @override
  final double tax;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'CategoryModel(id: $id, catSymbol: $catSymbol, hsnCode: $hsnCode, categoryNo: $categoryNo, category: $category, tax: $tax, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.catSymbol, catSymbol) ||
                other.catSymbol == catSymbol) &&
            (identical(other.hsnCode, hsnCode) || other.hsnCode == hsnCode) &&
            (identical(other.categoryNo, categoryNo) ||
                other.categoryNo == categoryNo) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, catSymbol, hsnCode, categoryNo, category, tax, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel(
      {required final String id,
      final String? catSymbol,
      required final int hsnCode,
      final int? categoryNo,
      required final String category,
      required final double tax,
      required final DateTime dateTime}) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get catSymbol;
  @override
  int get hsnCode;
  @override
  int? get categoryNo;
  @override
  String get category;
  @override
  double get tax;
  @override
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
