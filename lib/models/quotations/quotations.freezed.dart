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
  String get quotationNo => throw _privateConstructorUsedError;
  bool get isTax => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<SalesProductModel> get productList => throw _privateConstructorUsedError;
  CustomerModel get customerModel => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

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
      required final List<SalesProductModel> productList,
      required this.customerModel,
      required this.dateTime,
      this.note,
      required this.createdAt})
      : _productList = productList;

  factory _$QuotationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuotationModelImplFromJson(json);

  @override
  final String id;
  @override
  final String quotationNo;
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
  final String? note;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'QuotationModel(id: $id, quotationNo: $quotationNo, isTax: $isTax, price: $price, productList: $productList, customerModel: $customerModel, dateTime: $dateTime, note: $note, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuotationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quotationNo, quotationNo) ||
                other.quotationNo == quotationNo) &&
            (identical(other.isTax, isTax) || other.isTax == isTax) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList) &&
            (identical(other.customerModel, customerModel) ||
                other.customerModel == customerModel) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quotationNo,
      isTax,
      price,
      const DeepCollectionEquality().hash(_productList),
      customerModel,
      dateTime,
      note,
      createdAt);

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
      {required final String id,
      required final String quotationNo,
      final bool isTax,
      required final double price,
      required final List<SalesProductModel> productList,
      required final CustomerModel customerModel,
      required final DateTime dateTime,
      final String? note,
      required final DateTime createdAt}) = _$QuotationModelImpl;

  factory _QuotationModel.fromJson(Map<String, dynamic> json) =
      _$QuotationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get quotationNo;
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
  String? get note;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$QuotationModelImplCopyWith<_$QuotationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
