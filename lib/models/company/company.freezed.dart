// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) {
  return _CompanyModel.fromJson(json);
}

/// @nodoc
class _$CompanyModelTearOff {
  const _$CompanyModelTearOff();

  _CompanyModel call(
      {required String id,
      required String name,
      required String address,
      int? companyNo,
      String? email = "",
      String? website = "",
      String? licNO = "",
      String? placeOfDispatch = "",
      String? pan = "",
      required String mobileNoList,
      String? gstin = "",
      String? bankId = "",
      bool? isNormalPurchaseBill = true,
      required DateTime createdAt}) {
    return _CompanyModel(
      id: id,
      name: name,
      address: address,
      companyNo: companyNo,
      email: email,
      website: website,
      licNO: licNO,
      placeOfDispatch: placeOfDispatch,
      pan: pan,
      mobileNoList: mobileNoList,
      gstin: gstin,
      bankId: bankId,
      isNormalPurchaseBill: isNormalPurchaseBill,
      createdAt: createdAt,
    );
  }

  CompanyModel fromJson(Map<String, Object?> json) {
    return CompanyModel.fromJson(json);
  }
}

/// @nodoc
const $CompanyModel = _$CompanyModelTearOff();

/// @nodoc
mixin _$CompanyModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int? get companyNo => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get licNO => throw _privateConstructorUsedError;
  String? get placeOfDispatch => throw _privateConstructorUsedError;
  String? get pan => throw _privateConstructorUsedError;
  String get mobileNoList => throw _privateConstructorUsedError;
  String? get gstin => throw _privateConstructorUsedError;
  String? get bankId => throw _privateConstructorUsedError;
  bool? get isNormalPurchaseBill => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyModelCopyWith<CompanyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyModelCopyWith<$Res> {
  factory $CompanyModelCopyWith(
          CompanyModel value, $Res Function(CompanyModel) then) =
      _$CompanyModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String address,
      int? companyNo,
      String? email,
      String? website,
      String? licNO,
      String? placeOfDispatch,
      String? pan,
      String mobileNoList,
      String? gstin,
      String? bankId,
      bool? isNormalPurchaseBill,
      DateTime createdAt});
}

/// @nodoc
class _$CompanyModelCopyWithImpl<$Res> implements $CompanyModelCopyWith<$Res> {
  _$CompanyModelCopyWithImpl(this._value, this._then);

  final CompanyModel _value;
  // ignore: unused_field
  final $Res Function(CompanyModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? companyNo = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? licNO = freezed,
    Object? placeOfDispatch = freezed,
    Object? pan = freezed,
    Object? mobileNoList = freezed,
    Object? gstin = freezed,
    Object? bankId = freezed,
    Object? isNormalPurchaseBill = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      companyNo: companyNo == freezed
          ? _value.companyNo
          : companyNo // ignore: cast_nullable_to_non_nullable
              as int?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      licNO: licNO == freezed
          ? _value.licNO
          : licNO // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfDispatch: placeOfDispatch == freezed
          ? _value.placeOfDispatch
          : placeOfDispatch // ignore: cast_nullable_to_non_nullable
              as String?,
      pan: pan == freezed
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNoList: mobileNoList == freezed
          ? _value.mobileNoList
          : mobileNoList // ignore: cast_nullable_to_non_nullable
              as String,
      gstin: gstin == freezed
          ? _value.gstin
          : gstin // ignore: cast_nullable_to_non_nullable
              as String?,
      bankId: bankId == freezed
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String?,
      isNormalPurchaseBill: isNormalPurchaseBill == freezed
          ? _value.isNormalPurchaseBill
          : isNormalPurchaseBill // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$CompanyModelCopyWith<$Res>
    implements $CompanyModelCopyWith<$Res> {
  factory _$CompanyModelCopyWith(
          _CompanyModel value, $Res Function(_CompanyModel) then) =
      __$CompanyModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String address,
      int? companyNo,
      String? email,
      String? website,
      String? licNO,
      String? placeOfDispatch,
      String? pan,
      String mobileNoList,
      String? gstin,
      String? bankId,
      bool? isNormalPurchaseBill,
      DateTime createdAt});
}

/// @nodoc
class __$CompanyModelCopyWithImpl<$Res> extends _$CompanyModelCopyWithImpl<$Res>
    implements _$CompanyModelCopyWith<$Res> {
  __$CompanyModelCopyWithImpl(
      _CompanyModel _value, $Res Function(_CompanyModel) _then)
      : super(_value, (v) => _then(v as _CompanyModel));

  @override
  _CompanyModel get _value => super._value as _CompanyModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? companyNo = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? licNO = freezed,
    Object? placeOfDispatch = freezed,
    Object? pan = freezed,
    Object? mobileNoList = freezed,
    Object? gstin = freezed,
    Object? bankId = freezed,
    Object? isNormalPurchaseBill = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_CompanyModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      companyNo: companyNo == freezed
          ? _value.companyNo
          : companyNo // ignore: cast_nullable_to_non_nullable
              as int?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      licNO: licNO == freezed
          ? _value.licNO
          : licNO // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfDispatch: placeOfDispatch == freezed
          ? _value.placeOfDispatch
          : placeOfDispatch // ignore: cast_nullable_to_non_nullable
              as String?,
      pan: pan == freezed
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNoList: mobileNoList == freezed
          ? _value.mobileNoList
          : mobileNoList // ignore: cast_nullable_to_non_nullable
              as String,
      gstin: gstin == freezed
          ? _value.gstin
          : gstin // ignore: cast_nullable_to_non_nullable
              as String?,
      bankId: bankId == freezed
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String?,
      isNormalPurchaseBill: isNormalPurchaseBill == freezed
          ? _value.isNormalPurchaseBill
          : isNormalPurchaseBill // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CompanyModel implements _CompanyModel {
  const _$_CompanyModel(
      {required this.id,
      required this.name,
      required this.address,
      this.companyNo,
      this.email = "",
      this.website = "",
      this.licNO = "",
      this.placeOfDispatch = "",
      this.pan = "",
      required this.mobileNoList,
      this.gstin = "",
      this.bankId = "",
      this.isNormalPurchaseBill = true,
      required this.createdAt});

  factory _$_CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$$_CompanyModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final int? companyNo;
  @JsonKey()
  @override
  final String? email;
  @JsonKey()
  @override
  final String? website;
  @JsonKey()
  @override
  final String? licNO;
  @JsonKey()
  @override
  final String? placeOfDispatch;
  @JsonKey()
  @override
  final String? pan;
  @override
  final String mobileNoList;
  @JsonKey()
  @override
  final String? gstin;
  @JsonKey()
  @override
  final String? bankId;
  @JsonKey()
  @override
  final bool? isNormalPurchaseBill;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'CompanyModel(id: $id, name: $name, address: $address, companyNo: $companyNo, email: $email, website: $website, licNO: $licNO, placeOfDispatch: $placeOfDispatch, pan: $pan, mobileNoList: $mobileNoList, gstin: $gstin, bankId: $bankId, isNormalPurchaseBill: $isNormalPurchaseBill, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompanyModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.companyNo, companyNo) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.website, website) &&
            const DeepCollectionEquality().equals(other.licNO, licNO) &&
            const DeepCollectionEquality()
                .equals(other.placeOfDispatch, placeOfDispatch) &&
            const DeepCollectionEquality().equals(other.pan, pan) &&
            const DeepCollectionEquality()
                .equals(other.mobileNoList, mobileNoList) &&
            const DeepCollectionEquality().equals(other.gstin, gstin) &&
            const DeepCollectionEquality().equals(other.bankId, bankId) &&
            const DeepCollectionEquality()
                .equals(other.isNormalPurchaseBill, isNormalPurchaseBill) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(companyNo),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(website),
      const DeepCollectionEquality().hash(licNO),
      const DeepCollectionEquality().hash(placeOfDispatch),
      const DeepCollectionEquality().hash(pan),
      const DeepCollectionEquality().hash(mobileNoList),
      const DeepCollectionEquality().hash(gstin),
      const DeepCollectionEquality().hash(bankId),
      const DeepCollectionEquality().hash(isNormalPurchaseBill),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$CompanyModelCopyWith<_CompanyModel> get copyWith =>
      __$CompanyModelCopyWithImpl<_CompanyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompanyModelToJson(this);
  }
}

abstract class _CompanyModel implements CompanyModel {
  const factory _CompanyModel(
      {required String id,
      required String name,
      required String address,
      int? companyNo,
      String? email,
      String? website,
      String? licNO,
      String? placeOfDispatch,
      String? pan,
      required String mobileNoList,
      String? gstin,
      String? bankId,
      bool? isNormalPurchaseBill,
      required DateTime createdAt}) = _$_CompanyModel;

  factory _CompanyModel.fromJson(Map<String, dynamic> json) =
      _$_CompanyModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  int? get companyNo;
  @override
  String? get email;
  @override
  String? get website;
  @override
  String? get licNO;
  @override
  String? get placeOfDispatch;
  @override
  String? get pan;
  @override
  String get mobileNoList;
  @override
  String? get gstin;
  @override
  String? get bankId;
  @override
  bool? get isNormalPurchaseBill;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$CompanyModelCopyWith<_CompanyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
