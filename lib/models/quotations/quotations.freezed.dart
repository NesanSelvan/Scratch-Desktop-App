// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuotationModel _$QuotationModelFromJson(Map<String, dynamic> json) {
  return _QuotationModel.fromJson(json);
}

/// @nodoc
mixin _$QuotationModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get quotationNo => throw _privateConstructorUsedError;
  set quotationNo(String value) => throw _privateConstructorUsedError;
  bool get isTax => throw _privateConstructorUsedError;
  set isTax(bool value) => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  set price(double value) => throw _privateConstructorUsedError;
  List<SalesProductModel> get productList => throw _privateConstructorUsedError;
  set productList(List<SalesProductModel> value) =>
      throw _privateConstructorUsedError;
  CustomerModel get customerModel => throw _privateConstructorUsedError;
  set customerModel(CustomerModel value) => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  set dateTime(DateTime value) => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  set note(String? value) => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuotationModelCopyWith<QuotationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotationModelCopyWith<$Res> {
  factory $QuotationModelCopyWith(
          QuotationModel value, $Res Function(QuotationModel) then) =
      _$QuotationModelCopyWithImpl<$Res, QuotationModel>;
  @useResult
  $Res call(
      {String id,
      String quotationNo,
      bool isTax,
      double price,
      List<SalesProductModel> productList,
      CustomerModel customerModel,
      DateTime dateTime,
      String? note,
      DateTime createdAt});

  $CustomerModelCopyWith<$Res> get customerModel;
}

/// @nodoc
class _$QuotationModelCopyWithImpl<$Res, $Val extends QuotationModel>
    implements $QuotationModelCopyWith<$Res> {
  _$QuotationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quotationNo = null,
    Object? isTax = null,
    Object? price = null,
    Object? productList = null,
    Object? customerModel = null,
    Object? dateTime = null,
    Object? note = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quotationNo: null == quotationNo
          ? _value.quotationNo
          : quotationNo // ignore: cast_nullable_to_non_nullable
              as String,
      isTax: null == isTax
          ? _value.isTax
          : isTax // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      productList: null == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<SalesProductModel>,
      customerModel: null == customerModel
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerModelCopyWith<$Res> get customerModel {
    return $CustomerModelCopyWith<$Res>(_value.customerModel, (value) {
      return _then(_value.copyWith(customerModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuotationModelImplCopyWith<$Res>
    implements $QuotationModelCopyWith<$Res> {
  factory _$$QuotationModelImplCopyWith(_$QuotationModelImpl value,
          $Res Function(_$QuotationModelImpl) then) =
      __$$QuotationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String quotationNo,
      bool isTax,
      double price,
      List<SalesProductModel> productList,
      CustomerModel customerModel,
      DateTime dateTime,
      String? note,
      DateTime createdAt});

  @override
  $CustomerModelCopyWith<$Res> get customerModel;
}

/// @nodoc
class __$$QuotationModelImplCopyWithImpl<$Res>
    extends _$QuotationModelCopyWithImpl<$Res, _$QuotationModelImpl>
    implements _$$QuotationModelImplCopyWith<$Res> {
  __$$QuotationModelImplCopyWithImpl(
      _$QuotationModelImpl _value, $Res Function(_$QuotationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quotationNo = null,
    Object? isTax = null,
    Object? price = null,
    Object? productList = null,
    Object? customerModel = null,
    Object? dateTime = null,
    Object? note = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$QuotationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quotationNo: null == quotationNo
          ? _value.quotationNo
          : quotationNo // ignore: cast_nullable_to_non_nullable
              as String,
      isTax: null == isTax
          ? _value.isTax
          : isTax // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      productList: null == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<SalesProductModel>,
      customerModel: null == customerModel
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$QuotationModelImpl implements _QuotationModel {
  _$QuotationModelImpl(
      {required this.id,
      required this.quotationNo,
      this.isTax = true,
      required this.price,
      required this.productList,
      required this.customerModel,
      required this.dateTime,
      this.note,
      required this.createdAt});

  factory _$QuotationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuotationModelImplFromJson(json);

  @override
  String id;
  @override
  String quotationNo;
  @override
  @JsonKey()
  bool isTax;
  @override
  double price;
  @override
  List<SalesProductModel> productList;
  @override
  CustomerModel customerModel;
  @override
  DateTime dateTime;
  @override
  String? note;
  @override
  DateTime createdAt;

  @override
  String toString() {
    return 'QuotationModel(id: $id, quotationNo: $quotationNo, isTax: $isTax, price: $price, productList: $productList, customerModel: $customerModel, dateTime: $dateTime, note: $note, createdAt: $createdAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuotationModelImplCopyWith<_$QuotationModelImpl> get copyWith =>
      __$$QuotationModelImplCopyWithImpl<_$QuotationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuotationModelImplToJson(
      this,
    );
  }
}

abstract class _QuotationModel implements QuotationModel {
  factory _QuotationModel(
      {required String id,
      required String quotationNo,
      bool isTax,
      required double price,
      required List<SalesProductModel> productList,
      required CustomerModel customerModel,
      required DateTime dateTime,
      String? note,
      required DateTime createdAt}) = _$QuotationModelImpl;

  factory _QuotationModel.fromJson(Map<String, dynamic> json) =
      _$QuotationModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get quotationNo;
  set quotationNo(String value);
  @override
  bool get isTax;
  set isTax(bool value);
  @override
  double get price;
  set price(double value);
  @override
  List<SalesProductModel> get productList;
  set productList(List<SalesProductModel> value);
  @override
  CustomerModel get customerModel;
  set customerModel(CustomerModel value);
  @override
  DateTime get dateTime;
  set dateTime(DateTime value);
  @override
  String? get note;
  set note(String? value);
  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$QuotationModelImplCopyWith<_$QuotationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
