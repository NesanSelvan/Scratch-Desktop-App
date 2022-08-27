// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'purchase_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchaseProductModel _$PurchaseProductModelFromJson(Map<String, dynamic> json) {
  return _PurchaseProductModel.fromJson(json);
}

/// @nodoc
class _$PurchaseProductModelTearOff {
  const _$PurchaseProductModelTearOff();

  _PurchaseProductModel call(
      {required String id,
      required CategoryModel categoryModel,
      required ProductModel productModel,
      required double qty,
      required double rate,
      required double amount,
      required double discount,
      required double lorryFright,
      required double tax,
      required double taxableValue,
      required double totalAmount}) {
    return _PurchaseProductModel(
      id: id,
      categoryModel: categoryModel,
      productModel: productModel,
      qty: qty,
      rate: rate,
      amount: amount,
      discount: discount,
      lorryFright: lorryFright,
      tax: tax,
      taxableValue: taxableValue,
      totalAmount: totalAmount,
    );
  }

  PurchaseProductModel fromJson(Map<String, Object?> json) {
    return PurchaseProductModel.fromJson(json);
  }
}

/// @nodoc
const $PurchaseProductModel = _$PurchaseProductModelTearOff();

/// @nodoc
mixin _$PurchaseProductModel {
  String get id => throw _privateConstructorUsedError;
  CategoryModel get categoryModel => throw _privateConstructorUsedError;
  ProductModel get productModel => throw _privateConstructorUsedError;
  double get qty => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get lorryFright => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get taxableValue => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseProductModelCopyWith<PurchaseProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseProductModelCopyWith<$Res> {
  factory $PurchaseProductModelCopyWith(PurchaseProductModel value,
          $Res Function(PurchaseProductModel) then) =
      _$PurchaseProductModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      CategoryModel categoryModel,
      ProductModel productModel,
      double qty,
      double rate,
      double amount,
      double discount,
      double lorryFright,
      double tax,
      double taxableValue,
      double totalAmount});

  $CategoryModelCopyWith<$Res> get categoryModel;
  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class _$PurchaseProductModelCopyWithImpl<$Res>
    implements $PurchaseProductModelCopyWith<$Res> {
  _$PurchaseProductModelCopyWithImpl(this._value, this._then);

  final PurchaseProductModel _value;
  // ignore: unused_field
  final $Res Function(PurchaseProductModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryModel = freezed,
    Object? productModel = freezed,
    Object? qty = freezed,
    Object? rate = freezed,
    Object? amount = freezed,
    Object? discount = freezed,
    Object? lorryFright = freezed,
    Object? tax = freezed,
    Object? taxableValue = freezed,
    Object? totalAmount = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryModel: categoryModel == freezed
          ? _value.categoryModel
          : categoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      productModel: productModel == freezed
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      lorryFright: lorryFright == freezed
          ? _value.lorryFright
          : lorryFright // ignore: cast_nullable_to_non_nullable
              as double,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      taxableValue: taxableValue == freezed
          ? _value.taxableValue
          : taxableValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  $CategoryModelCopyWith<$Res> get categoryModel {
    return $CategoryModelCopyWith<$Res>(_value.categoryModel, (value) {
      return _then(_value.copyWith(categoryModel: value));
    });
  }

  @override
  $ProductModelCopyWith<$Res> get productModel {
    return $ProductModelCopyWith<$Res>(_value.productModel, (value) {
      return _then(_value.copyWith(productModel: value));
    });
  }
}

/// @nodoc
abstract class _$PurchaseProductModelCopyWith<$Res>
    implements $PurchaseProductModelCopyWith<$Res> {
  factory _$PurchaseProductModelCopyWith(_PurchaseProductModel value,
          $Res Function(_PurchaseProductModel) then) =
      __$PurchaseProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      CategoryModel categoryModel,
      ProductModel productModel,
      double qty,
      double rate,
      double amount,
      double discount,
      double lorryFright,
      double tax,
      double taxableValue,
      double totalAmount});

  @override
  $CategoryModelCopyWith<$Res> get categoryModel;
  @override
  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class __$PurchaseProductModelCopyWithImpl<$Res>
    extends _$PurchaseProductModelCopyWithImpl<$Res>
    implements _$PurchaseProductModelCopyWith<$Res> {
  __$PurchaseProductModelCopyWithImpl(
      _PurchaseProductModel _value, $Res Function(_PurchaseProductModel) _then)
      : super(_value, (v) => _then(v as _PurchaseProductModel));

  @override
  _PurchaseProductModel get _value => super._value as _PurchaseProductModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryModel = freezed,
    Object? productModel = freezed,
    Object? qty = freezed,
    Object? rate = freezed,
    Object? amount = freezed,
    Object? discount = freezed,
    Object? lorryFright = freezed,
    Object? tax = freezed,
    Object? taxableValue = freezed,
    Object? totalAmount = freezed,
  }) {
    return _then(_PurchaseProductModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryModel: categoryModel == freezed
          ? _value.categoryModel
          : categoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      productModel: productModel == freezed
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      lorryFright: lorryFright == freezed
          ? _value.lorryFright
          : lorryFright // ignore: cast_nullable_to_non_nullable
              as double,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      taxableValue: taxableValue == freezed
          ? _value.taxableValue
          : taxableValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PurchaseProductModel implements _PurchaseProductModel {
  _$_PurchaseProductModel(
      {required this.id,
      required this.categoryModel,
      required this.productModel,
      required this.qty,
      required this.rate,
      required this.amount,
      required this.discount,
      required this.lorryFright,
      required this.tax,
      required this.taxableValue,
      required this.totalAmount});

  factory _$_PurchaseProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_PurchaseProductModelFromJson(json);

  @override
  final String id;
  @override
  final CategoryModel categoryModel;
  @override
  final ProductModel productModel;
  @override
  final double qty;
  @override
  final double rate;
  @override
  final double amount;
  @override
  final double discount;
  @override
  final double lorryFright;
  @override
  final double tax;
  @override
  final double taxableValue;
  @override
  final double totalAmount;

  @override
  String toString() {
    return 'PurchaseProductModel(id: $id, categoryModel: $categoryModel, productModel: $productModel, qty: $qty, rate: $rate, amount: $amount, discount: $discount, lorryFright: $lorryFright, tax: $tax, taxableValue: $taxableValue, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseProductModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.categoryModel, categoryModel) &&
            const DeepCollectionEquality()
                .equals(other.productModel, productModel) &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.discount, discount) &&
            const DeepCollectionEquality()
                .equals(other.lorryFright, lorryFright) &&
            const DeepCollectionEquality().equals(other.tax, tax) &&
            const DeepCollectionEquality()
                .equals(other.taxableValue, taxableValue) &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(categoryModel),
      const DeepCollectionEquality().hash(productModel),
      const DeepCollectionEquality().hash(qty),
      const DeepCollectionEquality().hash(rate),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(discount),
      const DeepCollectionEquality().hash(lorryFright),
      const DeepCollectionEquality().hash(tax),
      const DeepCollectionEquality().hash(taxableValue),
      const DeepCollectionEquality().hash(totalAmount));

  @JsonKey(ignore: true)
  @override
  _$PurchaseProductModelCopyWith<_PurchaseProductModel> get copyWith =>
      __$PurchaseProductModelCopyWithImpl<_PurchaseProductModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PurchaseProductModelToJson(this);
  }
}

abstract class _PurchaseProductModel implements PurchaseProductModel {
  factory _PurchaseProductModel(
      {required String id,
      required CategoryModel categoryModel,
      required ProductModel productModel,
      required double qty,
      required double rate,
      required double amount,
      required double discount,
      required double lorryFright,
      required double tax,
      required double taxableValue,
      required double totalAmount}) = _$_PurchaseProductModel;

  factory _PurchaseProductModel.fromJson(Map<String, dynamic> json) =
      _$_PurchaseProductModel.fromJson;

  @override
  String get id;
  @override
  CategoryModel get categoryModel;
  @override
  ProductModel get productModel;
  @override
  double get qty;
  @override
  double get rate;
  @override
  double get amount;
  @override
  double get discount;
  @override
  double get lorryFright;
  @override
  double get tax;
  @override
  double get taxableValue;
  @override
  double get totalAmount;
  @override
  @JsonKey(ignore: true)
  _$PurchaseProductModelCopyWith<_PurchaseProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
