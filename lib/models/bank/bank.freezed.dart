// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankModel _$BankModelFromJson(Map<String, dynamic> json) {
  return _BankModel.fromJson(json);
}

/// @nodoc
class _$BankModelTearOff {
  const _$BankModelTearOff();

  _BankModel call(
      {required String id,
      required String accountNo,
      required String bankHolderName,
      required String ifscCode,
      required String bankName,
      String? branch = "",
      required DateTime createdAt}) {
    return _BankModel(
      id: id,
      accountNo: accountNo,
      bankHolderName: bankHolderName,
      ifscCode: ifscCode,
      bankName: bankName,
      branch: branch,
      createdAt: createdAt,
    );
  }

  BankModel fromJson(Map<String, Object?> json) {
    return BankModel.fromJson(json);
  }
}

/// @nodoc
const $BankModel = _$BankModelTearOff();

/// @nodoc
mixin _$BankModel {
  String get id => throw _privateConstructorUsedError;
  String get accountNo => throw _privateConstructorUsedError;
  String get bankHolderName => throw _privateConstructorUsedError;
  String get ifscCode => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;
  String? get branch => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankModelCopyWith<BankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankModelCopyWith<$Res> {
  factory $BankModelCopyWith(BankModel value, $Res Function(BankModel) then) =
      _$BankModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String accountNo,
      String bankHolderName,
      String ifscCode,
      String bankName,
      String? branch,
      DateTime createdAt});
}

/// @nodoc
class _$BankModelCopyWithImpl<$Res> implements $BankModelCopyWith<$Res> {
  _$BankModelCopyWithImpl(this._value, this._then);

  final BankModel _value;
  // ignore: unused_field
  final $Res Function(BankModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? accountNo = freezed,
    Object? bankHolderName = freezed,
    Object? ifscCode = freezed,
    Object? bankName = freezed,
    Object? branch = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountNo: accountNo == freezed
          ? _value.accountNo
          : accountNo // ignore: cast_nullable_to_non_nullable
              as String,
      bankHolderName: bankHolderName == freezed
          ? _value.bankHolderName
          : bankHolderName // ignore: cast_nullable_to_non_nullable
              as String,
      ifscCode: ifscCode == freezed
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: bankName == freezed
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      branch: branch == freezed
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$BankModelCopyWith<$Res> implements $BankModelCopyWith<$Res> {
  factory _$BankModelCopyWith(
          _BankModel value, $Res Function(_BankModel) then) =
      __$BankModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String accountNo,
      String bankHolderName,
      String ifscCode,
      String bankName,
      String? branch,
      DateTime createdAt});
}

/// @nodoc
class __$BankModelCopyWithImpl<$Res> extends _$BankModelCopyWithImpl<$Res>
    implements _$BankModelCopyWith<$Res> {
  __$BankModelCopyWithImpl(_BankModel _value, $Res Function(_BankModel) _then)
      : super(_value, (v) => _then(v as _BankModel));

  @override
  _BankModel get _value => super._value as _BankModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? accountNo = freezed,
    Object? bankHolderName = freezed,
    Object? ifscCode = freezed,
    Object? bankName = freezed,
    Object? branch = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_BankModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountNo: accountNo == freezed
          ? _value.accountNo
          : accountNo // ignore: cast_nullable_to_non_nullable
              as String,
      bankHolderName: bankHolderName == freezed
          ? _value.bankHolderName
          : bankHolderName // ignore: cast_nullable_to_non_nullable
              as String,
      ifscCode: ifscCode == freezed
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: bankName == freezed
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      branch: branch == freezed
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BankModel implements _BankModel {
  _$_BankModel(
      {required this.id,
      required this.accountNo,
      required this.bankHolderName,
      required this.ifscCode,
      required this.bankName,
      this.branch = "",
      required this.createdAt});

  factory _$_BankModel.fromJson(Map<String, dynamic> json) =>
      _$$_BankModelFromJson(json);

  @override
  final String id;
  @override
  final String accountNo;
  @override
  final String bankHolderName;
  @override
  final String ifscCode;
  @override
  final String bankName;
  @JsonKey()
  @override
  final String? branch;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'BankModel(id: $id, accountNo: $accountNo, bankHolderName: $bankHolderName, ifscCode: $ifscCode, bankName: $bankName, branch: $branch, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BankModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.accountNo, accountNo) &&
            const DeepCollectionEquality()
                .equals(other.bankHolderName, bankHolderName) &&
            const DeepCollectionEquality().equals(other.ifscCode, ifscCode) &&
            const DeepCollectionEquality().equals(other.bankName, bankName) &&
            const DeepCollectionEquality().equals(other.branch, branch) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(accountNo),
      const DeepCollectionEquality().hash(bankHolderName),
      const DeepCollectionEquality().hash(ifscCode),
      const DeepCollectionEquality().hash(bankName),
      const DeepCollectionEquality().hash(branch),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$BankModelCopyWith<_BankModel> get copyWith =>
      __$BankModelCopyWithImpl<_BankModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BankModelToJson(this);
  }
}

abstract class _BankModel implements BankModel {
  factory _BankModel(
      {required String id,
      required String accountNo,
      required String bankHolderName,
      required String ifscCode,
      required String bankName,
      String? branch,
      required DateTime createdAt}) = _$_BankModel;

  factory _BankModel.fromJson(Map<String, dynamic> json) =
      _$_BankModel.fromJson;

  @override
  String get id;
  @override
  String get accountNo;
  @override
  String get bankHolderName;
  @override
  String get ifscCode;
  @override
  String get bankName;
  @override
  String? get branch;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$BankModelCopyWith<_BankModel> get copyWith =>
      throw _privateConstructorUsedError;
}
