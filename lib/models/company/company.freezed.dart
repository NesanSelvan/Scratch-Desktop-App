// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) {
  return _CompanyModel.fromJson(json);
}

/// @nodoc
mixin _$CompanyModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  set address(String value) => throw _privateConstructorUsedError;
  int? get companyNo => throw _privateConstructorUsedError;
  set companyNo(int? value) => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  set email(String? value) => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  set website(String? value) => throw _privateConstructorUsedError;
  String? get licNO => throw _privateConstructorUsedError;
  set licNO(String? value) => throw _privateConstructorUsedError;
  String? get placeOfDispatch => throw _privateConstructorUsedError;
  set placeOfDispatch(String? value) => throw _privateConstructorUsedError;
  String? get pan => throw _privateConstructorUsedError;
  set pan(String? value) => throw _privateConstructorUsedError;
  String get mobileNoList => throw _privateConstructorUsedError;
  set mobileNoList(String value) => throw _privateConstructorUsedError;
  String? get gstin => throw _privateConstructorUsedError;
  set gstin(String? value) => throw _privateConstructorUsedError;
  String? get bankId => throw _privateConstructorUsedError;
  set bankId(String? value) => throw _privateConstructorUsedError;
  bool? get isNormalPurchaseBill => throw _privateConstructorUsedError;
  set isNormalPurchaseBill(bool? value) => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyModelCopyWith<CompanyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyModelCopyWith<$Res> {
  factory $CompanyModelCopyWith(
          CompanyModel value, $Res Function(CompanyModel) then) =
      _$CompanyModelCopyWithImpl<$Res, CompanyModel>;
  @useResult
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
class _$CompanyModelCopyWithImpl<$Res, $Val extends CompanyModel>
    implements $CompanyModelCopyWith<$Res> {
  _$CompanyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? companyNo = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? licNO = freezed,
    Object? placeOfDispatch = freezed,
    Object? pan = freezed,
    Object? mobileNoList = null,
    Object? gstin = freezed,
    Object? bankId = freezed,
    Object? isNormalPurchaseBill = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      companyNo: freezed == companyNo
          ? _value.companyNo
          : companyNo // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      licNO: freezed == licNO
          ? _value.licNO
          : licNO // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfDispatch: freezed == placeOfDispatch
          ? _value.placeOfDispatch
          : placeOfDispatch // ignore: cast_nullable_to_non_nullable
              as String?,
      pan: freezed == pan
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNoList: null == mobileNoList
          ? _value.mobileNoList
          : mobileNoList // ignore: cast_nullable_to_non_nullable
              as String,
      gstin: freezed == gstin
          ? _value.gstin
          : gstin // ignore: cast_nullable_to_non_nullable
              as String?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String?,
      isNormalPurchaseBill: freezed == isNormalPurchaseBill
          ? _value.isNormalPurchaseBill
          : isNormalPurchaseBill // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyModelImplCopyWith<$Res>
    implements $CompanyModelCopyWith<$Res> {
  factory _$$CompanyModelImplCopyWith(
          _$CompanyModelImpl value, $Res Function(_$CompanyModelImpl) then) =
      __$$CompanyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$CompanyModelImplCopyWithImpl<$Res>
    extends _$CompanyModelCopyWithImpl<$Res, _$CompanyModelImpl>
    implements _$$CompanyModelImplCopyWith<$Res> {
  __$$CompanyModelImplCopyWithImpl(
      _$CompanyModelImpl _value, $Res Function(_$CompanyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? companyNo = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? licNO = freezed,
    Object? placeOfDispatch = freezed,
    Object? pan = freezed,
    Object? mobileNoList = null,
    Object? gstin = freezed,
    Object? bankId = freezed,
    Object? isNormalPurchaseBill = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$CompanyModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      companyNo: freezed == companyNo
          ? _value.companyNo
          : companyNo // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      licNO: freezed == licNO
          ? _value.licNO
          : licNO // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfDispatch: freezed == placeOfDispatch
          ? _value.placeOfDispatch
          : placeOfDispatch // ignore: cast_nullable_to_non_nullable
              as String?,
      pan: freezed == pan
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNoList: null == mobileNoList
          ? _value.mobileNoList
          : mobileNoList // ignore: cast_nullable_to_non_nullable
              as String,
      gstin: freezed == gstin
          ? _value.gstin
          : gstin // ignore: cast_nullable_to_non_nullable
              as String?,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String?,
      isNormalPurchaseBill: freezed == isNormalPurchaseBill
          ? _value.isNormalPurchaseBill
          : isNormalPurchaseBill // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CompanyModelImpl implements _CompanyModel {
  _$CompanyModelImpl(
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

  factory _$CompanyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyModelImplFromJson(json);

  @override
  String id;
  @override
  String name;
  @override
  String address;
  @override
  int? companyNo;
  @override
  @JsonKey()
  String? email;
  @override
  @JsonKey()
  String? website;
  @override
  @JsonKey()
  String? licNO;
  @override
  @JsonKey()
  String? placeOfDispatch;
  @override
  @JsonKey()
  String? pan;
  @override
  String mobileNoList;
  @override
  @JsonKey()
  String? gstin;
  @override
  @JsonKey()
  String? bankId;
  @override
  @JsonKey()
  bool? isNormalPurchaseBill;
  @override
  DateTime createdAt;

  @override
  String toString() {
    return 'CompanyModel(id: $id, name: $name, address: $address, companyNo: $companyNo, email: $email, website: $website, licNO: $licNO, placeOfDispatch: $placeOfDispatch, pan: $pan, mobileNoList: $mobileNoList, gstin: $gstin, bankId: $bankId, isNormalPurchaseBill: $isNormalPurchaseBill, createdAt: $createdAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyModelImplCopyWith<_$CompanyModelImpl> get copyWith =>
      __$$CompanyModelImplCopyWithImpl<_$CompanyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyModelImplToJson(
      this,
    );
  }
}

abstract class _CompanyModel implements CompanyModel {
  factory _CompanyModel(
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
      required DateTime createdAt}) = _$CompanyModelImpl;

  factory _CompanyModel.fromJson(Map<String, dynamic> json) =
      _$CompanyModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  String get address;
  set address(String value);
  @override
  int? get companyNo;
  set companyNo(int? value);
  @override
  String? get email;
  set email(String? value);
  @override
  String? get website;
  set website(String? value);
  @override
  String? get licNO;
  set licNO(String? value);
  @override
  String? get placeOfDispatch;
  set placeOfDispatch(String? value);
  @override
  String? get pan;
  set pan(String? value);
  @override
  String get mobileNoList;
  set mobileNoList(String value);
  @override
  String? get gstin;
  set gstin(String? value);
  @override
  String? get bankId;
  set bankId(String? value);
  @override
  bool? get isNormalPurchaseBill;
  set isNormalPurchaseBill(bool? value);
  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$CompanyModelImplCopyWith<_$CompanyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
