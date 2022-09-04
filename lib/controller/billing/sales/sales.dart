import 'dart:developer';
import 'dart:io';

import 'package:annai_store/core/constants/calculations/calculations.dart';
import 'package:annai_store/core/db/db.dart';
import 'package:annai_store/enum/printer/printer.dart';
import 'package:annai_store/models/bill/bill.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:annai_store/models/stocks/stock.dart';
import 'package:annai_store/screens/billing/sales/components/sales_four.dart';
import 'package:annai_store/screens/billing/sales/components/sales_one.dart';
import 'package:annai_store/screens/billing/sales/components/sales_three.dart';
import 'package:annai_store/screens/billing/sales/components/sales_two.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/printer/printer.dart';
import 'package:annai_store/utils/upi.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:uuid/uuid.dart';

final categoryDB = Database().categoryDB;
final stocksDB = Database().stocksDB;
final productDB = Database().productDB;
final companyDB = Database().companyDB;
final customerDB = Database().customerDB;
final employeeDB = Database().employeeDB;
final salesDB = Database().salesDB;
final sewingServiceDB = Database().sewingServiceDB;
final bankDB = Database().bankDB;
final receiptDB = Database().receiptDB;
final voucherDB = Database().voucherDB;
final quotationDB = Database().quotationDB;
final purchaseDB = Database().purchaseDB;
final paymentDB = Database().paymentDB;
final orderDB = Database().ordersDB;
final estimateDB = Database().estimateDB;
final pathsDB = Database().pathsDB;
final threadCompanyDB = Database().threadCompanyDB;
final subProductsDB = Database().subProductsDB;
final estimateReceiptDB = Database().estimateReceiptDB;

class SalesBillingController extends GetxController {
  int salesCurrentScreen = 01;

  final screenshotController = ScreenshotController();
  Widget currentSalesWidget = SalesScreen1();

  Widget getScreen(int no) {
    if (no == 1) {
      return SalesScreen1();
    } else if (no == 2) {
      return SalesScreen2();
    } else if (no == 3) {
      return SalesScreen3();
    } else {
      return SalesScreen4();
    }
  }

  void updateCurrentSalesWidgetToNext() {
    debugPrint("Updating...");

    if (salesCurrentScreen >= 4) {
      salesCurrentScreen = 01;
      currentSalesWidget = getScreen(salesCurrentScreen);
    } else {
      salesCurrentScreen++;
      currentSalesWidget = getScreen(salesCurrentScreen);
    }
    debugPrint("Number : $salesCurrentScreen");

    update();
  }

  void updateCurrentSalesWidget(int no) {
    salesCurrentScreen = no;
    currentSalesWidget = getScreen(no);
    update();
  }

  Future<void> updateStockAndPendingAmount(
    CustomerModel customerModel,
    List<SalesProductModel> productList,
  ) async {
    //Updating Customer Pending Amount
    await customerDB.updateCustomer(
      customerModel.copyWith(
        pendingAmount: customerModel.pendingAmount +
            getGrandTotal(productList, customerModel),
      ),
    );

    // Updating Stocks
    for (final item in productList) {
      final stock = stocksDB.getStockModelByProductId(item.productModel!.id);
      if (stock == null) {
        await stocksDB.addStockToDb(
          StockModel(
            const Uuid().v4(),
            item.productModel!.id,
            item.productModel!.code,
            0,
            DateTime.now(),
          ),
        );
      } else {
        await stocksDB.updateStock(
          StockModel(
            stock.id,
            item.productModel!.id,
            item.productModel!.code,
            stock.qty - (item.qty ?? 1),
            DateTime.now(),
          ),
        );
      }
    }
  }

  Future<void> updateBill(BillModel updatedBill) async {
    log("Updating Bill Customer: ${updatedBill.customerModel.name}");
    final ogBill = salesDB.getBillModelById(updatedBill.id);
    final cust = customerDB.getCustomerModelById(updatedBill.customerModel.id);

    await salesDB.updateBill(updatedBill);

    final List<SalesProductModel> productList = [];

    for (final item in updatedBill.productList!) {
      final data = ogBill.productList!
          .where((element) => element.productModel!.id == item.productModel!.id)
          .toList();
      if (data.isEmpty) {
        productList.add(item);
      } else {
        final index = ogBill.productList!.indexOf(data[0]);
        debugPrint("OG Bill Qty : ${ogBill.productList![index].qty!}");
        debugPrint("Updated Bill Qty : ${item.qty!}");
        final qty = (ogBill.productList![index].qty! - item.qty!).abs();
        if (qty != 0) {
          item.qty = qty;
          productList.add(item);
        }
      }
    }

    for (final item in productList) {
      debugPrint("Item: ${item.toJson()}");
    }

    await updateStockAndPendingAmount(cust, productList);
  }

  Future<void> addBillToDB(
    String invoiceNo,
    CustomerModel? customerModel,
    List<SalesProductModel> salesProductModelList,
    String note,
    String supplierRef,
    String orderDate,
    String dispatchDocNo,
    String destination,
    Function performInit,
    Function clearAll,
    DateTime dateTime,
    PrinterEnum printerEnum, {
    String? billID,
    bool? isUpdatedBill,
  }) async {
    if (salesProductModelList.isEmpty) {
      CustomUtilies.customFailureSnackBar("Error", "Please add products");
      return;
    } else if (customerModel == null) {
      CustomUtilies.customFailureSnackBar("Error", "Customer cannot be null");
      return;
    }
    final billModel = BillModel(
      id: billID ?? const Uuid().v4(),
      billNo: invoiceNo,
      customerModel: customerModel,
      givenAmount: 0.0,
      isPaid: false,
      isTax: true,
      paidId: "",
      price: getGrandTotal(salesProductModelList, customerModel),
      productList: salesProductModelList,
      dateTime: dateTime,
      borrowId: "",
      discount: 0.0,
      note: note,
      supplierRef: supplierRef,
      buyerOrderNo: orderDate,
      buyerOrderDate: DateTime.now(),
      dispatchDocumentNo: dispatchDocNo,
      destination: destination,
    );

    await updateStockAndPendingAmount(customerModel, salesProductModelList);

    try {
      if (printerEnum == PrinterEnum.Normal) {
        await salesDB.addBillToDb(billModel.copyWith(isA4Printed: true));
      } else {
        await salesDB.addBillToDb(billModel);
      }
      if (printerEnum != PrinterEnum.None) {
        if (printerEnum == PrinterEnum.Normal) {
          final data = await PDFGenerator.generateBill(
            billModel,
            UPIDetails(billModel.price).toStr(),
          );
          final file = File(data);
          await PrinterUtility.normalPrint(file);
        } else {
          final data = await PDFGenerator.generateThermalBillForSales(
            billModel,
            UPIDetails(billModel.price).toStr(),
          );
          final file = File(data);
          await PrinterUtility.thermalPrint(file);
        }
      }
      // CustomUtilies.customSuccessSnackBar(
      //     "Added SuccessFull", "Bill Added Successfully");
      performInit();
    } catch (e) {
      debugPrint("$e");
      CustomUtilies.customFailureSnackBar("Error in Adding Category", "$e");
    }
    clearAll();
    // BillModel(const Uuid().v4(), invoiceNumberController.text , "" , selectedCustomerModel!.id , 0.0 , false , true , "" , getGrandTotal(salesProductModelList) , salesProductModelList , DateTime.now() , 0.0 , noteController.text ,  supplierRefController.text , orderDateController.text , DateTime.now() , dis , dispatchThrough, destination)
  }
}
