// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitModel _$UnitModelFromJson(Map<String, dynamic> json) {
  return _UnitModel.fromJson(json);
}

/// @nodoc
class _$UnitModelTearOff {
  const _$UnitModelTearOff();

  _UnitModel call(String? id, String? symbol, String? formalName, int? unitNo,
      DateTime? dateTime) {
    return _UnitModel(
      id,
      symbol,
      formalName,
      unitNo,
      dateTime,
    );
  }

  UnitModel fromJson(Map<String, Object?> json) {
    return UnitModel.fromJson(json);
  }
}

/// @nodoc
const $UnitModel = _$UnitModelTearOff();

/// @nodoc
mixin _$UnitModel {
  String? get id => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  String? get formalName => throw _privateConstructorUsedError;
  int? get unitNo => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitModelCopyWith<UnitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitModelCopyWith<$Res> {
  factory $UnitModelCopyWith(UnitModel value, $Res Function(UnitModel) then) =
      _$UnitModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? symbol,
      String? formalName,
      int? unitNo,
      DateTime? dateTime});
}

/// @nodoc
class _$UnitModelCopyWithImpl<$Res> implements $UnitModelCopyWith<$Res> {
  _$UnitModelCopyWithImpl(this._value, this._then);

  final UnitModel _value;
  // ignore: unused_field
  final $Res Function(UnitModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? symbol = freezed,
    Object? formalName = freezed,
    Object? unitNo = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      formalName: formalName == freezed
          ? _value.formalName
          : formalName // ignore: cast_nullable_to_non_nullable
              as String?,
      unitNo: unitNo == freezed
          ? _value.unitNo
          : unitNo // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$UnitModelCopyWith<$Res> implements $UnitModelCopyWith<$Res> {
  factory _$UnitModelCopyWith(
          _UnitModel value, $Res Function(_UnitModel) then) =
      __$UnitModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? symbol,
      String? formalName,
      int? unitNo,
      DateTime? dateTime});
}

/// @nodoc
class __$UnitModelCopyWithImpl<$Res> extends _$UnitModelCopyWithImpl<$Res>
    implements _$UnitModelCopyWith<$Res> {
  __$UnitModelCopyWithImpl(_UnitModel _value, $Res Function(_UnitModel) _then)
      : super(_value, (v) => _then(v as _UnitModel));

  @override
  _UnitModel get _value => super._value as _UnitModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? symbol = freezed,
    Object? formalName = freezed,
    Object? unitNo = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_UnitModel(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      formalName == freezed
          ? _value.formalName
          : formalName // ignore: cast_nullable_to_non_nullable
              as String?,
      unitNo == freezed
          ? _value.unitNo
          : unitNo // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitModel implements _UnitModel {
  const _$_UnitModel(
      this.id, this.symbol, this.formalName, this.unitNo, this.dateTime);

  factory _$_UnitModel.fromJson(Map<String, dynamic> json) =>
      _$$_UnitModelFromJson(json);

  @override
  final String? id;
  @override
  final String? symbol;
  @override
  final String? formalName;
  @override
  final int? unitNo;
  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return '$symbol';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality()
                .equals(other.formalName, formalName) &&
            const DeepCollectionEquality().equals(other.unitNo, unitNo) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(formalName),
      const DeepCollectionEquality().hash(unitNo),
      const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$UnitModelCopyWith<_UnitModel> get copyWith =>
      __$UnitModelCopyWithImpl<_UnitModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitModelToJson(this);
  }
}

abstract class _UnitModel implements UnitModel {
  const factory _UnitModel(String? id, String? symbol, String? formalName,
      int? unitNo, DateTime? dateTime) = _$_UnitModel;

  factory _UnitModel.fromJson(Map<String, dynamic> json) =
      _$_UnitModel.fromJson;

  @override
  String? get id;
  @override
  String? get symbol;
  @override
  String? get formalName;
  @override
  int? get unitNo;
  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$UnitModelCopyWith<_UnitModel> get copyWith =>
      throw _privateConstructorUsedError;
}
