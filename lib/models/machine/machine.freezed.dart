// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'machine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MachineModel _$MachineModelFromJson(Map<String, dynamic> json) {
  return _MachineModel.fromJson(json);
}

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
      _$MachineModelCopyWithImpl<$Res, MachineModel>;
  @useResult
  $Res call({String id, String machineName});
}

/// @nodoc
class _$MachineModelCopyWithImpl<$Res, $Val extends MachineModel>
    implements $MachineModelCopyWith<$Res> {
  _$MachineModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? machineName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      machineName: null == machineName
          ? _value.machineName
          : machineName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MachineModelImplCopyWith<$Res>
    implements $MachineModelCopyWith<$Res> {
  factory _$$MachineModelImplCopyWith(
          _$MachineModelImpl value, $Res Function(_$MachineModelImpl) then) =
      __$$MachineModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String machineName});
}

/// @nodoc
class __$$MachineModelImplCopyWithImpl<$Res>
    extends _$MachineModelCopyWithImpl<$Res, _$MachineModelImpl>
    implements _$$MachineModelImplCopyWith<$Res> {
  __$$MachineModelImplCopyWithImpl(
      _$MachineModelImpl _value, $Res Function(_$MachineModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? machineName = null,
  }) {
    return _then(_$MachineModelImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == machineName
          ? _value.machineName
          : machineName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MachineModelImpl implements _MachineModel {
  const _$MachineModelImpl(this.id, this.machineName);

  factory _$MachineModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MachineModelImplFromJson(json);

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
            other is _$MachineModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.machineName, machineName) ||
                other.machineName == machineName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, machineName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MachineModelImplCopyWith<_$MachineModelImpl> get copyWith =>
      __$$MachineModelImplCopyWithImpl<_$MachineModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MachineModelImplToJson(
      this,
    );
  }
}

abstract class _MachineModel implements MachineModel {
  const factory _MachineModel(final String id, final String machineName) =
      _$MachineModelImpl;

  factory _MachineModel.fromJson(Map<String, dynamic> json) =
      _$MachineModelImpl.fromJson;

  @override
  String get id;
  @override
  String get machineName;
  @override
  @JsonKey(ignore: true)
  _$$MachineModelImplCopyWith<_$MachineModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
