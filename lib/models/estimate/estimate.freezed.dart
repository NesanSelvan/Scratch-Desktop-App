// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estimate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EstimateModel _$EstimateModelFromJson(Map<String, dynamic> json) {
  return _EstimateModel.fromJson(json);
}

/// @nodoc
mixin _$EstimateModel {
  @JsonKey(name: "id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  set id(String value) => throw _privateConstructorUsedError;
  String get estimateNo => throw _privateConstructorUsedError;
  set estimateNo(String value) => throw _privateConstructorUsedError;
  String? get billId => throw _privateConstructorUsedError;
  set billId(String? value) => throw _privateConstructorUsedError;
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
  double? get givenAmount => throw _privateConstructorUsedError;
  set givenAmount(double? value) => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  set note(String? value) => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EstimateModelCopyWith<EstimateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstimateModelCopyWith<$Res> {
  factory $EstimateModelCopyWith(
          EstimateModel value, $Res Function(EstimateModel) then) =
      _$EstimateModelCopyWithImpl<$Res, EstimateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String id,
      String estimateNo,
      String? billId,
      bool isTax,
      double price,
      List<SalesProductModel> productList,
      CustomerModel customerModel,
      DateTime dateTime,
      double? givenAmount,
      String? note,
      DateTime createdAt});

  $CustomerModelCopyWith<$Res> get customerModel;
}

/// @nodoc
class _$EstimateModelCopyWithImpl<$Res, $Val extends EstimateModel>
    implements $EstimateModelCopyWith<$Res> {
  _$EstimateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? estimateNo = null,
    Object? billId = freezed,
    Object? isTax = null,
    Object? price = null,
    Object? productList = null,
    Object? customerModel = null,
    Object? dateTime = null,
    Object? givenAmount = freezed,
    Object? note = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      estimateNo: null == estimateNo
          ? _value.estimateNo
          : estimateNo // ignore: cast_nullable_to_non_nullable
              as String,
      billId: freezed == billId
          ? _value.billId
          : billId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      givenAmount: freezed == givenAmount
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double?,
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
abstract class _$$EstimateModelImplCopyWith<$Res>
    implements $EstimateModelCopyWith<$Res> {
  factory _$$EstimateModelImplCopyWith(
          _$EstimateModelImpl value, $Res Function(_$EstimateModelImpl) then) =
      __$$EstimateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String id,
      String estimateNo,
      String? billId,
      bool isTax,
      double price,
      List<SalesProductModel> productList,
      CustomerModel customerModel,
      DateTime dateTime,
      double? givenAmount,
      String? note,
      DateTime createdAt});

  @override
  $CustomerModelCopyWith<$Res> get customerModel;
}

/// @nodoc
class __$$EstimateModelImplCopyWithImpl<$Res>
    extends _$EstimateModelCopyWithImpl<$Res, _$EstimateModelImpl>
    implements _$$EstimateModelImplCopyWith<$Res> {
  __$$EstimateModelImplCopyWithImpl(
      _$EstimateModelImpl _value, $Res Function(_$EstimateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? estimateNo = null,
    Object? billId = freezed,
    Object? isTax = null,
    Object? price = null,
    Object? productList = null,
    Object? customerModel = null,
    Object? dateTime = null,
    Object? givenAmount = freezed,
    Object? note = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$EstimateModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      estimateNo: null == estimateNo
          ? _value.estimateNo
          : estimateNo // ignore: cast_nullable_to_non_nullable
              as String,
      billId: freezed == billId
          ? _value.billId
          : billId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      givenAmount: freezed == givenAmount
          ? _value.givenAmount
          : givenAmount // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _$EstimateModelImpl implements _EstimateModel {
  _$EstimateModelImpl(
      {@JsonKey(name: "id") required this.id,
      required this.estimateNo,
      this.billId = "",
      this.isTax = true,
      required this.price,
      required this.productList,
      required this.customerModel,
      required this.dateTime,
      this.givenAmount = 0,
      this.note,
      required this.createdAt});

  factory _$EstimateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstimateModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  String id;
  @override
  String estimateNo;
  @override
  @JsonKey()
  String? billId;
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
  @JsonKey()
  double? givenAmount;
  @override
  String? note;
  @override
  DateTime createdAt;

  @override
  String toString() {
    return 'EstimateModel(id: $id, estimateNo: $estimateNo, billId: $billId, isTax: $isTax, price: $price, productList: $productList, customerModel: $customerModel, dateTime: $dateTime, givenAmount: $givenAmount, note: $note, createdAt: $createdAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EstimateModelImplCopyWith<_$EstimateModelImpl> get copyWith =>
      __$$EstimateModelImplCopyWithImpl<_$EstimateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstimateModelImplToJson(
      this,
    );
  }
}

abstract class _EstimateModel implements EstimateModel {
  factory _EstimateModel(
      {@JsonKey(name: "id") required String id,
      required String estimateNo,
      String? billId,
      bool isTax,
      required double price,
      required List<SalesProductModel> productList,
      required CustomerModel customerModel,
      required DateTime dateTime,
      double? givenAmount,
      String? note,
      required DateTime createdAt}) = _$EstimateModelImpl;

  factory _EstimateModel.fromJson(Map<String, dynamic> json) =
      _$EstimateModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String get id;
  @JsonKey(name: "id")
  set id(String value);
  @override
  String get estimateNo;
  set estimateNo(String value);
  @override
  String? get billId;
  set billId(String? value);
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
  double? get givenAmount;
  set givenAmount(double? value);
  @override
  String? get note;
  set note(String? value);
  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$EstimateModelImplCopyWith<_$EstimateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
