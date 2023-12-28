// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchaseProductModel _$PurchaseProductModelFromJson(Map<String, dynamic> json) {
  return _PurchaseProductModel.fromJson(json);
}

/// @nodoc
mixin _$PurchaseProductModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  CategoryModel get categoryModel => throw _privateConstructorUsedError;
  set categoryModel(CategoryModel value) => throw _privateConstructorUsedError;
  ProductModel get productModel => throw _privateConstructorUsedError;
  set productModel(ProductModel value) => throw _privateConstructorUsedError;
  double get qty => throw _privateConstructorUsedError;
  set qty(double value) => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  set rate(double value) => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  set amount(double value) => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  set discount(double value) => throw _privateConstructorUsedError;
  double get lorryFright => throw _privateConstructorUsedError;
  set lorryFright(double value) => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  set tax(double value) => throw _privateConstructorUsedError;
  double get taxableValue => throw _privateConstructorUsedError;
  set taxableValue(double value) => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  set totalAmount(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseProductModelCopyWith<PurchaseProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseProductModelCopyWith<$Res> {
  factory $PurchaseProductModelCopyWith(PurchaseProductModel value,
          $Res Function(PurchaseProductModel) then) =
      _$PurchaseProductModelCopyWithImpl<$Res, PurchaseProductModel>;
  @useResult
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
class _$PurchaseProductModelCopyWithImpl<$Res,
        $Val extends PurchaseProductModel>
    implements $PurchaseProductModelCopyWith<$Res> {
  _$PurchaseProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryModel = null,
    Object? productModel = null,
    Object? qty = null,
    Object? rate = null,
    Object? amount = null,
    Object? discount = null,
    Object? lorryFright = null,
    Object? tax = null,
    Object? taxableValue = null,
    Object? totalAmount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryModel: null == categoryModel
          ? _value.categoryModel
          : categoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      productModel: null == productModel
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      lorryFright: null == lorryFright
          ? _value.lorryFright
          : lorryFright // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      taxableValue: null == taxableValue
          ? _value.taxableValue
          : taxableValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get categoryModel {
    return $CategoryModelCopyWith<$Res>(_value.categoryModel, (value) {
      return _then(_value.copyWith(categoryModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get productModel {
    return $ProductModelCopyWith<$Res>(_value.productModel, (value) {
      return _then(_value.copyWith(productModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseProductModelImplCopyWith<$Res>
    implements $PurchaseProductModelCopyWith<$Res> {
  factory _$$PurchaseProductModelImplCopyWith(_$PurchaseProductModelImpl value,
          $Res Function(_$PurchaseProductModelImpl) then) =
      __$$PurchaseProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$PurchaseProductModelImplCopyWithImpl<$Res>
    extends _$PurchaseProductModelCopyWithImpl<$Res, _$PurchaseProductModelImpl>
    implements _$$PurchaseProductModelImplCopyWith<$Res> {
  __$$PurchaseProductModelImplCopyWithImpl(_$PurchaseProductModelImpl _value,
      $Res Function(_$PurchaseProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryModel = null,
    Object? productModel = null,
    Object? qty = null,
    Object? rate = null,
    Object? amount = null,
    Object? discount = null,
    Object? lorryFright = null,
    Object? tax = null,
    Object? taxableValue = null,
    Object? totalAmount = null,
  }) {
    return _then(_$PurchaseProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryModel: null == categoryModel
          ? _value.categoryModel
          : categoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      productModel: null == productModel
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      lorryFright: null == lorryFright
          ? _value.lorryFright
          : lorryFright // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      taxableValue: null == taxableValue
          ? _value.taxableValue
          : taxableValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PurchaseProductModelImpl implements _PurchaseProductModel {
  _$PurchaseProductModelImpl(
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

  factory _$PurchaseProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseProductModelImplFromJson(json);

  @override
  String id;
  @override
  CategoryModel categoryModel;
  @override
  ProductModel productModel;
  @override
  double qty;
  @override
  double rate;
  @override
  double amount;
  @override
  double discount;
  @override
  double lorryFright;
  @override
  double tax;
  @override
  double taxableValue;
  @override
  double totalAmount;

  @override
  String toString() {
    return 'PurchaseProductModel(id: $id, categoryModel: $categoryModel, productModel: $productModel, qty: $qty, rate: $rate, amount: $amount, discount: $discount, lorryFright: $lorryFright, tax: $tax, taxableValue: $taxableValue, totalAmount: $totalAmount)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseProductModelImplCopyWith<_$PurchaseProductModelImpl>
      get copyWith =>
          __$$PurchaseProductModelImplCopyWithImpl<_$PurchaseProductModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseProductModelImplToJson(
      this,
    );
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
      required double totalAmount}) = _$PurchaseProductModelImpl;

  factory _PurchaseProductModel.fromJson(Map<String, dynamic> json) =
      _$PurchaseProductModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  CategoryModel get categoryModel;
  set categoryModel(CategoryModel value);
  @override
  ProductModel get productModel;
  set productModel(ProductModel value);
  @override
  double get qty;
  set qty(double value);
  @override
  double get rate;
  set rate(double value);
  @override
  double get amount;
  set amount(double value);
  @override
  double get discount;
  set discount(double value);
  @override
  double get lorryFright;
  set lorryFright(double value);
  @override
  double get tax;
  set tax(double value);
  @override
  double get taxableValue;
  set taxableValue(double value);
  @override
  double get totalAmount;
  set totalAmount(double value);
  @override
  @JsonKey(ignore: true)
  _$$PurchaseProductModelImplCopyWith<_$PurchaseProductModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
