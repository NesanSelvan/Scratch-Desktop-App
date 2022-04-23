// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'machine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MachineModel _$MachineModelFromJson(Map<String, dynamic> json) {
  return _MachineModel.fromJson(json);
}

/// @nodoc
class _$MachineModelTearOff {
  const _$MachineModelTearOff();

  _MachineModel call(String id, String machineName) {
    return _MachineModel(
      id,
      machineName,
    );
  }

  MachineModel fromJson(Map<String, Object?> json) {
    return MachineModel.fromJson(json);
  }
}

/// @nodoc
const $MachineModel = _$MachineModelTearOff();

/// @nodoc
mixin _$MachineModel {
  String get id => throw _privateConstructorUsedError;
  String get machineName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MachineModelCopyWith<MachineModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineModelCopyWith<$Res> {
  factory $MachineModelCopyWith(
          MachineModel value, $Res Function(MachineModel) then) =
      _$MachineModelCopyWithImpl<$Res>;
  $Res call({String id, String machineName});
}

/// @nodoc
class _$MachineModelCopyWithImpl<$Res> implements $MachineModelCopyWith<$Res> {
  _$MachineModelCopyWithImpl(this._value, this._then);

  final MachineModel _value;
  // ignore: unused_field
  final $Res Function(MachineModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? machineName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      machineName: machineName == freezed
          ? _value.machineName
          : machineName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MachineModelCopyWith<$Res>
    implements $MachineModelCopyWith<$Res> {
  factory _$MachineModelCopyWith(
          _MachineModel value, $Res Function(_MachineModel) then) =
      __$MachineModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String machineName});
}

/// @nodoc
class __$MachineModelCopyWithImpl<$Res> extends _$MachineModelCopyWithImpl<$Res>
    implements _$MachineModelCopyWith<$Res> {
  __$MachineModelCopyWithImpl(
      _MachineModel _value, $Res Function(_MachineModel) _then)
      : super(_value, (v) => _then(v as _MachineModel));

  @override
  _MachineModel get _value => super._value as _MachineModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? machineName = freezed,
  }) {
    return _then(_MachineModel(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      machineName == freezed
          ? _value.machineName
          : machineName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MachineModel implements _MachineModel {
  const _$_MachineModel(this.id, this.machineName);

  factory _$_MachineModel.fromJson(Map<String, dynamic> json) =>
      _$$_MachineModelFromJson(json);

  @override
  final String id;
  @override
  final String machineName;

  @override
  String toString() {
    return 'MachineModel(id: $id, machineName: $machineName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MachineModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.machineName, machineName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(machineName));

  @JsonKey(ignore: true)
  @override
  _$MachineModelCopyWith<_MachineModel> get copyWith =>
      __$MachineModelCopyWithImpl<_MachineModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MachineModelToJson(this);
  }
}

abstract class _MachineModel implements MachineModel {
  const factory _MachineModel(String id, String machineName) = _$_MachineModel;

  factory _MachineModel.fromJson(Map<String, dynamic> json) =
      _$_MachineModel.fromJson;

  @override
  String get id;
  @override
  String get machineName;
  @override
  @JsonKey(ignore: true)
  _$MachineModelCopyWith<_MachineModel> get copyWith =>
      throw _privateConstructorUsedError;
}
