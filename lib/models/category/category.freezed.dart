// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
class _$CategoryModelTearOff {
  const _$CategoryModelTearOff();

  _CategoryModel call(
      {required String id,
      String? catSymbol,
      required int hsnCode,
      int? categoryNo,
      required String category,
      required double tax,
      required DateTime dateTime}) {
    return _CategoryModel(
      id: id,
      catSymbol: catSymbol,
      hsnCode: hsnCode,
      categoryNo: categoryNo,
      category: category,
      tax: tax,
      dateTime: dateTime,
    );
  }

  CategoryModel fromJson(Map<String, Object?> json) {
    return CategoryModel.fromJson(json);
  }
}

/// @nodoc
const $CategoryModel = _$CategoryModelTearOff();

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
      _$CategoryModelCopyWithImpl<$Res>;
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
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  final CategoryModel _value;
  // ignore: unused_field
  final $Res Function(CategoryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? catSymbol = freezed,
    Object? hsnCode = freezed,
    Object? categoryNo = freezed,
    Object? category = freezed,
    Object? tax = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      catSymbol: catSymbol == freezed
          ? _value.catSymbol
          : catSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      hsnCode: hsnCode == freezed
          ? _value.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as int,
      categoryNo: categoryNo == freezed
          ? _value.categoryNo
          : categoryNo // ignore: cast_nullable_to_non_nullable
              as int?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$CategoryModelCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(
          _CategoryModel value, $Res Function(_CategoryModel) then) =
      __$CategoryModelCopyWithImpl<$Res>;
  @override
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
class __$CategoryModelCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(
      _CategoryModel _value, $Res Function(_CategoryModel) _then)
      : super(_value, (v) => _then(v as _CategoryModel));

  @override
  _CategoryModel get _value => super._value as _CategoryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? catSymbol = freezed,
    Object? hsnCode = freezed,
    Object? categoryNo = freezed,
    Object? category = freezed,
    Object? tax = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_CategoryModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      catSymbol: catSymbol == freezed
          ? _value.catSymbol
          : catSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      hsnCode: hsnCode == freezed
          ? _value.hsnCode
          : hsnCode // ignore: cast_nullable_to_non_nullable
              as int,
      categoryNo: categoryNo == freezed
          ? _value.categoryNo
          : categoryNo // ignore: cast_nullable_to_non_nullable
              as int?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryModel implements _CategoryModel {
  const _$_CategoryModel(
      {required this.id,
      this.catSymbol,
      required this.hsnCode,
      this.categoryNo,
      required this.category,
      required this.tax,
      required this.dateTime});

  factory _$_CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryModelFromJson(json);

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
    return '$category';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.catSymbol, catSymbol) &&
            const DeepCollectionEquality().equals(other.hsnCode, hsnCode) &&
            const DeepCollectionEquality()
                .equals(other.categoryNo, categoryNo) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.tax, tax) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(catSymbol),
      const DeepCollectionEquality().hash(hsnCode),
      const DeepCollectionEquality().hash(categoryNo),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(tax),
      const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$CategoryModelCopyWith<_CategoryModel> get copyWith =>
      __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryModelToJson(this);
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel(
      {required String id,
      String? catSymbol,
      required int hsnCode,
      int? categoryNo,
      required String category,
      required double tax,
      required DateTime dateTime}) = _$_CategoryModel;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryModel.fromJson;

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
  _$CategoryModelCopyWith<_CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
