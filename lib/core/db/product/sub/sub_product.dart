import 'package:annai_store/core/db/db.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';

import '../../../../models/product/sub/sub_product.dart';

class SubProductDB {
  final storage = Database().storage;

  List<SubProductModel> getAllSubProducts() {
    try {
      final data = storage.getItem('sub_products');
      debugPrint('Thread Company Item: $data');

      final List<SubProductModel> datas = [];
      if (data != null) {
        for (final item in data as List) {
          debugPrint('Thread Company Item: $item');
          datas.add(SubProductModel.fromJson(item as Map<String, dynamic>));
        }
      }
      return datas;
    } catch (e) {
      debugPrint('Thread Company Fetcjing Error: $e');
      return [];
    }
  }

  Future<void> clearAll() async {
    await Database().storage.setItem("sub_products", []);
  }

  Future<void> addSubProductToDb(SubProductModel stockModel) async {
    final datas = [...getAllSubProducts(), stockModel];
    await updateSubProductToDB(datas);
  }

  Future<void> updateSubProductToDB(
      List<SubProductModel> stockModelList) async {
    final unitModelListMap = getSubProductListJson(stockModelList);
    await storage.setItem("sub_products", unitModelListMap);
  }

  Future<void> deleteSubProduct(SubProductModel stockModel) async {
    final datas = getAllSubProducts();
    datas.remove(stockModel);
    await updateSubProductToDB(datas);
  }

  Future<void> updateSubProduct(SubProductModel stockModel) async {
    final stockList = getAllSubProducts();
    final datas =
        stockList.where((element) => element.id == stockModel.id).toList();
    if (datas.isNotEmpty) {
      final index = stockList.indexOf(datas[0]);
      stockList[index] = stockModel;
      await updateSubProductToDB(stockList);
      return;
    }
    CustomUtilies.customFailureSnackBar("Error", "Thread Company not updated");
  }

  SubProductModel getSubProductModelById(String id) {
    return getAllSubProducts().where((element) => element.id == id).toList()[0];
  }

  SubProductModel? getSubProductModelByProductId(String productId) {
    try {
      return getAllSubProducts()
          .where((element) => element.productModel.id == productId)
          .toList()[0];
    } catch (e) {
      return null;
    }
  }
}
