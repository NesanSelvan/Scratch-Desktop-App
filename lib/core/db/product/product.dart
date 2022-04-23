import 'package:annai_store/core/db/db.dart';
import 'package:flutter/material.dart';

import '../../../models/failure/failure.dart';
import '../../../models/price/price.dart';
import '../../../models/product/product.dart';

class ProductDB {
  final storage = Database().storage;
  List<ProductModel> getAllProduct() {
    try {
      final data = Database().storage.getItem('products');
      // debugPrint('Product Item: $data');

      final List<ProductModel> datas = [];
      if (data != null) {
        for (final item in data as List) {
          // debugPrint('ProductModel Item: $item');
          datas.add(ProductModel.fromJson(item as Map<String, dynamic>));
        }
      }
      return datas;
    } catch (e) {
      debugPrint('Product Fetcjing Error: $e');
      return [];
    }
  }

  Future<void> clearAll() async {
    await Database().storage.setItem("products", []);
  }

  void checkProductIfExists(String code) {
    final companyModelList = getAllProduct();
    final matchedProduct =
        companyModelList.where((element) => element.code == code).toList();
    if (matchedProduct.isNotEmpty) {
      throw Failure("Product with same Code $code Already Exists !");
    }
  }

  Future<void> addProductToDb(ProductModel productModel) async {
    try {
      checkProductIfExists(productModel.code);
      final datas = [...getAllProduct(), productModel];
      await updateProductToDB(datas);
    } catch (e) {
      throw Failure("$e");
    }
  }

  Future<void> updateProductToDB(List<ProductModel> companyModelList) async {
    final companyModelListMap = getProductListJson(companyModelList);
    await storage.setItem("products", companyModelListMap);
  }

  Future<void> deleteProduct(ProductModel productModel) async {
    final datas = getAllProduct();
    datas.remove(productModel);
    updateProductToDB(datas);
  }

  Future<void> updateDifferentPriceModelList(
      double mrp,
      double retail,
      double wholesale,
      ProductModel productModel,
      PriceModel priceModel) async {
    final List<PriceModel> difPriceList = [];
    for (final item in productModel.differentPriceList ?? []) {
      item as PriceModel;
      if (priceModel.unitModel.id == item.unitModel.id) {
        difPriceList.add(
          priceModel.copyWith(
            mrp: mrp,
            retail: retail,
            wholesale: wholesale,
          ),
        );
      } else {
        difPriceList.add(item);
      }
    }
    debugPrint(
      "Product : ${productModel.copyWith(differentPriceList: difPriceList)}",
    );
    if (productModel.unitId == priceModel.unitModel.id) {
      await updateProduct(
        productModel.copyWith(
          sellingPrice: mrp,
          retail: retail,
          wholesale: wholesale,
        ),
      );
      return;
    }
    await updateProduct(
      productModel.copyWith(differentPriceList: difPriceList),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    final List<PriceModel> priceModelList = [];
    for (final item in productModel.differentPriceList ?? []) {
      item as PriceModel;
      if (productModel.unitId == item.unitModel.id) {
        // priceModelList.add(PriceModel(
        //     id: const Uuid().v4(),
        //     unitModel: item.unitModel,
        //     mrp: productModel.sellingPrice,
        //     unitQty: double.parse("${productModel.unitQty}"),
        //     retail: productModel.retail,
        //     wholesale: productModel.wholesale,
        //     createdAt: DateTime.now()));

      } else {
        priceModelList.add(item);
      }
    }
    final newProductModel =
        productModel.copyWith(differentPriceList: priceModelList);
    final productList = getAllProduct();
    final datas =
        productList.where((element) => element.id == productModel.id).toList();
    final index = productList.indexOf(datas[0]);
    productList[index] = newProductModel;
    await updateProductToDB(productList);
  }

  ProductModel? getProductModelById(String id) {
    if (getAllProduct().where((element) => element.id == id).toList().isEmpty) {
      return null;
    }
    return getAllProduct().where((element) => element.id == id).toList().first;
  }

  ProductModel getProductModelByCode(String code) {
    return getAllProduct()
        .where((element) => element.code == code)
        .toList()
        .first;
  }

  List<ProductModel> getProductsByCompany(String companyId) {
    return getAllProduct()
        .where((element) => element.companyId == companyId)
        .toList();
  }

  List<ProductModel> getProductsWithoutCompanyId() {
    return getAllProduct()
        .where((element) => element.companyId == null)
        .toList();
  }

  List<ProductModel> getAllProductByCategoryId(String catId) {
    return getAllProduct()
        .where((element) => element.categoryId == catId)
        .toList();
  }
}
