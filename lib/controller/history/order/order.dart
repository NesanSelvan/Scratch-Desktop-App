import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/models/orders/order.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderHistoryNotifier extends GetxController {
  // final orderDB = Database().orderDB;

  void performInit() {
    final allOrders = orderDB.getAllOrder();
    if (allOrders.isNotEmpty) {
      setOrdersModelList = allOrders;
      setSelectedOrderModel = allOrders[0];
    }
  }

  @override
  void onInit() {
    performInit();
    super.onInit();
  }

  Future clearAllOrders() async {
    return orderDB.clearAll();
  }

  OrderModel? _selectedOrderModel;
  OrderModel? get selectedOrderModel => _selectedOrderModel;

  // ignore: avoid_setters_without_getters
  set setSelectedOrderModel(OrderModel OrderModel) {
    _selectedOrderModel = OrderModel;
    update();
  }

  List<OrderModel>? _OrdersList;
  List<OrderModel>? get OrdersList => _OrdersList;
  // ignore: avoid_setters_without_getters
  set setOrdersModelList(List<OrderModel> OrderModel) {
    _OrdersList = OrderModel;
    update();
  }

  void updateSelectedOrderModel() {
    int index = _OrdersList!.indexOf(selectedOrderModel!);
    if (index == (_OrdersList!.length - 1)) {
      index = 0;
    } else {
      index++;
    }
    setSelectedOrderModel = _OrdersList![index];
    debugPrint("Selected Order NO: ${selectedOrderModel!.orderNo}");
  }

  void updateUpSelectedOrderModel() {
    int index = _OrdersList!.indexOf(selectedOrderModel!);
    if (index == 0) {
      index = _OrdersList!.length - 1;
    } else {
      index--;
    }
    setSelectedOrderModel = _OrdersList![index];
    debugPrint("Selected Order NO: ${selectedOrderModel!.orderNo}");
  }

  DateTime startDateTime = DateTime.now();
  DateTime endDateTime = DateTime.now().add(const Duration(days: 2));

  void setPickedStartDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      startDateTime = dateTime;
    }
    update();
  }

  void setPickedEndDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      endDateTime = dateTime;
    }
    update();
  }

  void searchOrder() {
    final allOrder = orderDB.getAllOrder();
    allOrder.where((element) => element.dateTime == startDateTime);
  }

  Future<void> viewOrder(OrderModel orderModel) async {
    final data = await PDFGenerator.generateOrderBuffer(orderModel);
    PDFGenerator.openBufferPdf(data,
        "order_${orderModel.orderNo.replaceAll('/', '-').replaceAll(" ", "-")}");
    // homeController.setCurrentSelectedWidget(PdfViewer(filePath: data));
    // CustomUtilies.navigatePage(
    //     context, PdfViewer(filePath: data));
  }

  Future<void> viewThermal(OrderModel billModel) async {
    final data =
        await PDFGenerator.generateThermalBillForOrdersBuffer(billModel);
    PDFGenerator.openBufferPdf(data,
        "order_${billModel.orderNo.replaceAll('/', '-').replaceAll(" ", "-")}");
  }
}
