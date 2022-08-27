// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quotations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuotationModel _$QuotationModelFromJson(Map<String, dynamic> json) {
  return _QuotationModel.fromJson(json);
}

/// @nodoc
class _$QuotationModelTearOff {
  const _$QuotationModelTearOff();

  _QuotationModel call(
      {required String id,
      required String quotationNo,
      bool isTax = true,
      required double price,
      required List<SalesProductModel> productList,
      required CustomerModel customerModel,
      required DateTime dateTime,
      String? note,
      required DateTime createdAt}) {
    return _QuotationModel(
      id: id,
      quotationNo: quotationNo,
      isTax: isTax,
      price: price,
      productList: productList,
      customerModel: customerModel,
      dateTime: dateTime,
      note: note,
      createdAt: createdAt,
    );
  }

  QuotationModel fromJson(Map<String, Object?> json) {
    return QuotationModel.fromJson(json);
  }
}

/// @nodoc
const $QuotationModel = _$QuotationModelTearOff();

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
      _$QuotationModelCopyWithImpl<$Res>;
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
class _$QuotationModelCopyWithImpl<$Res>
    implements $QuotationModelCopyWith<$Res> {
  _$QuotationModelCopyWithImpl(this._value, this._then);

  final QuotationModel _value;
  // ignore: unused_field
  final $Res Function(QuotationModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? quotationNo = freezed,
    Object? isTax = freezed,
    Object? price = freezed,
    Object? productList = freezed,
    Object? customerModel = freezed,
    Object? dateTime = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quotationNo: quotationNo == freezed
          ? _value.quotationNo
          : quotationNo // ignore: cast_nullable_to_non_nullable
              as String,
      isTax: isTax == freezed
          ? _value.isTax
          : isTax // ignore: cast_nullable_to_non_nullable
              as bool,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      productList: productList == freezed
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<SalesProductModel>,
      customerModel: customerModel == freezed
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $CustomerModelCopyWith<$Res> get customerModel {
    return $CustomerModelCopyWith<$Res>(_value.customerModel, (value) {
      return _then(_value.copyWith(customerModel: value));
    });
  }
}

/// @nodoc
abstract class _$QuotationModelCopyWith<$Res>
    implements $QuotationModelCopyWith<$Res> {
  factory _$QuotationModelCopyWith(
          _QuotationModel value, $Res Function(_QuotationModel) then) =
      __$QuotationModelCopyWithImpl<$Res>;
  @override
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
class __$QuotationModelCopyWithImpl<$Res>
    extends _$QuotationModelCopyWithImpl<$Res>
    implements _$QuotationModelCopyWith<$Res> {
  __$QuotationModelCopyWithImpl(
      _QuotationModel _value, $Res Function(_QuotationModel) _then)
      : super(_value, (v) => _then(v as _QuotationModel));

  @override
  _QuotationModel get _value => super._value as _QuotationModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? quotationNo = freezed,
    Object? isTax = freezed,
    Object? price = freezed,
    Object? productList = freezed,
    Object? customerModel = freezed,
    Object? dateTime = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_QuotationModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quotationNo: quotationNo == freezed
          ? _value.quotationNo
          : quotationNo // ignore: cast_nullable_to_non_nullable
              as String,
      isTax: isTax == freezed
          ? _value.isTax
          : isTax // ignore: cast_nullable_to_non_nullable
              as bool,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      productList: productList == freezed
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<SalesProductModel>,
      customerModel: customerModel == freezed
          ? _value.customerModel
          : customerModel // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
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
class _$_QuotationModel implements _QuotationModel {
  _$_QuotationModel(
      {required this.id,
      required this.quotationNo,
      this.isTax = true,
      required this.price,
      required this.productList,
      required this.customerModel,
      required this.dateTime,
      this.note,
      required this.createdAt});

  factory _$_QuotationModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuotationModelFromJson(json);

  @override
  final String id;
  @override
  final String quotationNo;
  @JsonKey()
  @override
  final bool isTax;
  @override
  final double price;
  @override
  final List<SalesProductModel> productList;
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
            other is _QuotationModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.quotationNo, quotationNo) &&
            const DeepCollectionEquality().equals(other.isTax, isTax) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.productList, productList) &&
            const DeepCollectionEquality()
                .equals(other.customerModel, customerModel) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(quotationNo),
      const DeepCollectionEquality().hash(isTax),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(productList),
      const DeepCollectionEquality().hash(customerModel),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$QuotationModelCopyWith<_QuotationModel> get copyWith =>
      __$QuotationModelCopyWithImpl<_QuotationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuotationModelToJson(this);
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
      required DateTime createdAt}) = _$_QuotationModel;

  factory _QuotationModel.fromJson(Map<String, dynamic> json) =
      _$_QuotationModel.fromJson;

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
  _$QuotationModelCopyWith<_QuotationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
