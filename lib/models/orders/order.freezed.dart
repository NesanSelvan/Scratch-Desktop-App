// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
class _$OrderModelTearOff {
  const _$OrderModelTearOff();

  _OrderModel call(
      {@JsonKey(name: "id") required String id,
      required String orderNo,
      bool isTax = true,
      required double price,
      required List<SalesProductModel> productList,
      required CustomerModel customerModel,
      required DateTime dateTime,
      String? note,
      required DateTime createdAt}) {
    return _OrderModel(
      id: id,
      orderNo: orderNo,
      isTax: isTax,
      price: price,
      productList: productList,
      customerModel: customerModel,
      dateTime: dateTime,
      note: note,
      createdAt: createdAt,
    );
  }

  OrderModel fromJson(Map<String, Object?> json) {
    return OrderModel.fromJson(json);
  }
}

/// @nodoc
const $OrderModel = _$OrderModelTearOff();

/// @nodoc
mixin _$OrderModel {
  @JsonKey(name: "id")
  String get id => throw _privateConstructorUsedError;
  String get orderNo => throw _privateConstructorUsedError;
  bool get isTax => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<SalesProductModel> get productList => throw _privateConstructorUsedError;
  CustomerModel get customerModel => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") String id,
      String orderNo,
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
class _$OrderModelCopyWithImpl<$Res> implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  final OrderModel _value;
  // ignore: unused_field
  final $Res Function(OrderModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderNo = freezed,
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
      orderNo: orderNo == freezed
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
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
abstract class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(
          _OrderModel value, $Res Function(_OrderModel) then) =
      __$OrderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") String id,
      String orderNo,
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
class __$OrderModelCopyWithImpl<$Res> extends _$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(
      _OrderModel _value, $Res Function(_OrderModel) _then)
      : super(_value, (v) => _then(v as _OrderModel));

  @override
  _OrderModel get _value => super._value as _OrderModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderNo = freezed,
    Object? isTax = freezed,
    Object? price = freezed,
    Object? productList = freezed,
    Object? customerModel = freezed,
    Object? dateTime = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_OrderModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNo: orderNo == freezed
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
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
class _$_OrderModel implements _OrderModel {
  const _$_OrderModel(
      {@JsonKey(name: "id") required this.id,
      required this.orderNo,
      this.isTax = true,
      required this.price,
      required this.productList,
      required this.customerModel,
      required this.dateTime,
      this.note,
      required this.createdAt});

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderModelFromJson(json);

  @override
  @JsonKey(name: "id")
  final String id;
  @override
  final String orderNo;
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
    return 'OrderModel(id: $id, orderNo: $orderNo, isTax: $isTax, price: $price, productList: $productList, customerModel: $customerModel, dateTime: $dateTime, note: $note, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.orderNo, orderNo) &&
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
      const DeepCollectionEquality().hash(orderNo),
      const DeepCollectionEquality().hash(isTax),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(productList),
      const DeepCollectionEquality().hash(customerModel),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderModelToJson(this);
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {@JsonKey(name: "id") required String id,
      required String orderNo,
      bool isTax,
      required double price,
      required List<SalesProductModel> productList,
      required CustomerModel customerModel,
      required DateTime dateTime,
      String? note,
      required DateTime createdAt}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  @JsonKey(name: "id")
  String get id;
  @override
  String get orderNo;
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
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
