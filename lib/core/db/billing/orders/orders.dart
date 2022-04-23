import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/models/failure/failure.dart';
import 'package:annai_store/models/orders/order.dart';
import 'package:flutter/material.dart';

class OrdersDB {
  final storage = Database().storage;

  Future<void> clearAll() async {
    await Database().storage.setItem("orders", []);
  }

  List<OrderModel> getAllOrder() {
    final data = Database().storage.getItem('orders');
    // debugPrint('Order Item: $data');

    final List<OrderModel> datas = [];
    if (data != null) {
      for (final item in data as List) {
        // debugPrint('OrderModel Item: $item');
        datas.add(OrderModel.fromJson(item as Map<String, dynamic>));
      }
    }
    return datas;
  }

  Future<void> addOrderToDb(OrderModel orderModel) async {
    debugPrint("This Order Details : $orderModel");
    try {
      // final _billModelList = getAllOrder();
      // final datas = [..._billModelList, orderModel];
      // debugPrint("Datas : $datas");
      // await updateOrderToDB(datas);

      final billModelList = getAllOrder();
      final matchedOrder = billModelList
          .where((element) => element.orderNo == orderModel.orderNo)
          .toList();
      if (matchedOrder.isNotEmpty) {
        throw Failure(
          "Order with same Order No ${orderModel.orderNo} Already Exists !",
        );
      }
      final datas = [...billModelList, orderModel];
      await updateOrderToDB(datas);
    } catch (e) {
      debugPrint("error : $e");
      throw Failure("$e");
    }
  }

  Future<void> updateOrderToDB(List<OrderModel> billModelList) async {
    final billModelListMap = getOrderListJson(billModelList);
    debugPrint("billModelListMap: $billModelListMap");
    await storage.setItem("orders", billModelListMap);
  }

  Future<void> deleteOrder(OrderModel orderModel) async {
    final datas = getAllOrder();
    datas.remove(orderModel);
    updateOrderToDB(datas);
  }

  Future<void> updateOrder(OrderModel orderModel) async {
    final billsList = getAllOrder();
    final datas =
        billsList.where((element) => element.id == orderModel.id).toList();
    final index = billsList.indexOf(datas[0]);
    billsList[index] = orderModel;
    updateOrderToDB(billsList);
  }

  OrderModel getOrderModelById(String id) {
    return getAllOrder().where((element) => element.id == id).toList()[0];
  }

  Future<void> resetOrder() async {
    await storage.setItem("orders", []);
  }
}
