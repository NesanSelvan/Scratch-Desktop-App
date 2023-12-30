import 'dart:developer';
import 'dart:typed_data';
import 'dart:convert';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'barcode_state.dart';

class BarcodeCubit extends Cubit<BarcodeState> {
  BarcodeCubit() : super(BarcodeState(allProducts: productDB.getAllProduct()));

  void getAllProducts() {
    final allProducts = productDB.getAllProduct();
    emit(state.copyWith(allProducts: allProducts));
  }

  void setSelectedProduct(ProductModel productModel) {
    emit(state.copyWith(selectedProduct: productModel));
  }
}
