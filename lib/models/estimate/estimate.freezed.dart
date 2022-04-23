// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'estimate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EstimateModel _$EstimateModelFromJson(Map<String, dynamic> json) {
  return _EstimateModel.fromJson(json);
}

/// @nodoc
class _$EstimateModelTearOff {
  const _$EstimateModelTearOff();

  _EstimateModel call(
      {@JsonKey(name: "id") required String id,
      required String estimateNo,
      String? billId = "",
      bool isTax = true,
      required double price,
      required List<SalesProductModel> productList,
      required CustomerModel customerModel,
      required DateTime dateTime,
      String? note,
      required DateTime createdAt}) {
    return _EstimateModel(
      id: id,
      estimateNo: estimateNo,
      billId: billId,
      isTax: isTax,
      price: price,
      productList: productList,
      customerModel: customerModel,
      dateTime: dateTime,
      note: note,
      createdAt: createdAt,
    );
  }

  EstimateModel fromJson(Map<String, Object?> json) {
    return EstimateModel.fromJson(json);
  }
}

/// @nodoc
const $EstimateModel = _$EstimateModelTearOff();

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
      _$EstimateModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") String id,
      String estimateNo,
      String? billId,
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
class _$EstimateModelCopyWithImpl<$Res>
    implements $EstimateModelCopyWith<$Res> {
  _$EstimateModelCopyWithImpl(this._value, this._then);

  final EstimateModel _value;
  // ignore: unused_field
  final $Res Function(EstimateModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? estimateNo = freezed,
    Object? billId = freezed,
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
      estimateNo: estimateNo == freezed
          ? _value.estimateNo
          : estimateNo // ignore: cast_nullable_to_non_nullable
              as String,
      billId: billId == freezed
          ? _value.billId
          : billId // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$EstimateModelCopyWith<$Res>
    implements $EstimateModelCopyWith<$Res> {
  factory _$EstimateModelCopyWith(
          _EstimateModel value, $Res Function(_EstimateModel) then) =
      __$EstimateModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") String id,
      String estimateNo,
      String? billId,
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
class __$EstimateModelCopyWithImpl<$Res>
    extends _$EstimateModelCopyWithImpl<$Res>
    implements _$EstimateModelCopyWith<$Res> {
  __$EstimateModelCopyWithImpl(
      _EstimateModel _value, $Res Function(_EstimateModel) _then)
      : super(_value, (v) => _then(v as _EstimateModel));

  @override
  _EstimateModel get _value => super._value as _EstimateModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? estimateNo = freezed,
    Object? billId = freezed,
    Object? isTax = freezed,
    Object? price = freezed,
    Object? productList = freezed,
    Object? customerModel = freezed,
    Object? dateTime = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_EstimateModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      estimateNo: estimateNo == freezed
          ? _value.estimateNo
          : estimateNo // ignore: cast_nullable_to_non_nullable
              as String,
      billId: billId == freezed
          ? _value.billId
          : billId // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_EstimateModel implements _EstimateModel {
  const _$_EstimateModel(
      {@JsonKey(name: "id") required this.id,
      required this.estimateNo,
      this.billId = "",
      this.isTax = true,
      required this.price,
      required this.productList,
      required this.customerModel,
      required this.dateTime,
      this.note,
      required this.createdAt});

  factory _$_EstimateModel.fromJson(Map<String, dynamic> json) =>
      _$$_EstimateModelFromJson(json);

  @override
  @JsonKey(name: "id")
  final String id;
  @override
  final String estimateNo;
  @JsonKey()
  @override
  final String? billId;
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
    return 'EstimateModel(id: $id, estimateNo: $estimateNo, billId: $billId, isTax: $isTax, price: $price, productList: $productList, customerModel: $customerModel, dateTime: $dateTime, note: $note, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EstimateModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.estimateNo, estimateNo) &&
            const DeepCollectionEquality().equals(other.billId, billId) &&
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
      const DeepCollectionEquality().hash(estimateNo),
      const DeepCollectionEquality().hash(billId),
      const DeepCollectionEquality().hash(isTax),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(productList),
      const DeepCollectionEquality().hash(customerModel),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$EstimateModelCopyWith<_EstimateModel> get copyWith =>
      __$EstimateModelCopyWithImpl<_EstimateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EstimateModelToJson(this);
  }
}

abstract class _EstimateModel implements EstimateModel {
  const factory _EstimateModel(
      {@JsonKey(name: "id") required String id,
      required String estimateNo,
      String? billId,
      bool isTax,
      required double price,
      required List<SalesProductModel> productList,
      required CustomerModel customerModel,
      required DateTime dateTime,
      String? note,
      required DateTime createdAt}) = _$_EstimateModel;

  factory _EstimateModel.fromJson(Map<String, dynamic> json) =
      _$_EstimateModel.fromJson;

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
  String? get note;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$EstimateModelCopyWith<_EstimateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
