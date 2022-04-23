import 'package:annai_store/core/db/db.dart';
import 'package:flutter/material.dart';

import '../../../models/stocks/stock.dart';

class StockDB {
  final storage = Database().storage;

  Future<void> clearAll() async {
    await Database().storage.setItem("stocks", []);
  }

  List<StockModel> getAllStocks() {
    try {
      final data = storage.getItem('stocks');
      debugPrint('Stock Item: $data');

      final List<StockModel> datas = [];
      if (data != null) {
        for (final item in data as List) {
          debugPrint('Stock Item: $item');
          datas.add(StockModel.fromJson(item as Map<String, dynamic>));
        }
      }
      return datas;
    } catch (e) {
      debugPrint('Stock Fetcjing Error: $e');
      return [];
    }
  }

  Future<void> addStockToDb(StockModel stockModel) async {
    final datas = [...getAllStocks(), stockModel];
    await updateStockToDB(datas);
  }

  Future<void> updateStockToDB(List<StockModel> stockModelList) async {
    final unitModelListMap = getStockListJson(stockModelList);
    await storage.setItem("stocks", unitModelListMap);
  }

  Future<void> deleteStock(StockModel stockModel) async {
    final datas = getAllStocks();
    datas.remove(stockModel);
    updateStockToDB(datas);
  }

  Future<void> updateStock(StockModel stockModel) async {
    final stockList = getAllStocks();
    final datas =
        stockList.where((element) => element.id == stockModel.id).toList();
    final index = stockList.indexOf(datas[0]);
    stockList[index] = stockModel;
    await updateStockToDB(stockList);
  }

  StockModel getStockModelById(String id) {
    return getAllStocks().where((element) => element.id == id).toList()[0];
  }

  StockModel? getStockModelByProductId(String id) {
    final data =
        getAllStocks().where((element) => element.productId == id).toList();
    if (data.isEmpty) {
      return null;
    }

    return data[0];
  }

  Future<void> resetAllStock() async {
    final _allStocks = getAllStocks();
    final List<StockModel> _allDatas = [];
    for (final item in _allStocks) {
      _allDatas.add(item.copyWith(qty: 0));
    }
    await updateStockToDB(_allDatas);
  }

  Future<void> resetOnlyNegativeStock() async {
    final _allStocks = getAllStocks();
    final List<StockModel> _allDatas = [];
    for (final item in _allStocks) {
      if (item.qty < 0) {
        _allDatas.add(item.copyWith(qty: 0));
      } else {
        _allDatas.add(item);
      }
    }
    await updateStockToDB(_allDatas);
  }
}
