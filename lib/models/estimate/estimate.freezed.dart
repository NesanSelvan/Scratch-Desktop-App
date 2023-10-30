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
  String get estimateNo => throw _privateConstructorUsedError;
  String? get billId => throw _privateConstructorUsedError;
  bool get isTax => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<SalesProductModel> get productList => throw _privateConstructorUsedError;
  CustomerModel get customerModel => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  double? get givenAmount => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

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
          ? _value._productList
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
  const _$EstimateModelImpl(
      {@JsonKey(name: "id") required this.id,
      required this.estimateNo,
      this.billId = "",
      this.isTax = true,
      required this.price,
      required final List<SalesProductModel> productList,
      required this.customerModel,
      required this.dateTime,
      this.givenAmount = 0,
      this.note,
      required this.createdAt})
      : _productList = productList;

  factory _$EstimateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstimateModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String id;
  @override
  final String estimateNo;
  @override
  @JsonKey()
  final String? billId;
  @override
  @JsonKey()
  final bool isTax;
  @override
  final double price;
  final List<SalesProductModel> _productList;
  @override
  List<SalesProductModel> get productList {
    if (_productList is EqualUnmodifiableListView) return _productList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productList);
  }

  @override
  final CustomerModel customerModel;
  @override
  final DateTime dateTime;
  @override
  @JsonKey()
  final double? givenAmount;
  @override
  final String? note;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'EstimateModel(id: $id, estimateNo: $estimateNo, billId: $billId, isTax: $isTax, price: $price, productList: $productList, customerModel: $customerModel, dateTime: $dateTime, givenAmount: $givenAmount, note: $note, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstimateModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.estimateNo, estimateNo) ||
                other.estimateNo == estimateNo) &&
            (identical(other.billId, billId) || other.billId == billId) &&
            (identical(other.isTax, isTax) || other.isTax == isTax) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList) &&
            (identical(other.customerModel, customerModel) ||
                other.customerModel == customerModel) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.givenAmount, givenAmount) ||
                other.givenAmount == givenAmount) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      estimateNo,
      billId,
      isTax,
      price,
      const DeepCollectionEquality().hash(_productList),
      customerModel,
      dateTime,
      givenAmount,
      note,
      createdAt);

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
  const factory _EstimateModel(
      {@JsonKey(name: "id") required final String id,
      required final String estimateNo,
      final String? billId,
      final bool isTax,
      required final double price,
      required final List<SalesProductModel> productList,
      required final CustomerModel customerModel,
      required final DateTime dateTime,
      final double? givenAmount,
      final String? note,
      required final DateTime createdAt}) = _$EstimateModelImpl;

  factory _EstimateModel.fromJson(Map<String, dynamic> json) =
      _$EstimateModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String get id;
  @override
  String get estimateNo;
  @override
  String? get billId;
  @override
  bool get isTax;
  @override
  double get price;
  @override
  List<SalesProductModel> get productList;
  @override
  CustomerModel get customerModel;
  @override
  DateTime get dateTime;
  @override
  double? get givenAmount;
  @override
  String? get note;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$EstimateModelImplCopyWith<_$EstimateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
