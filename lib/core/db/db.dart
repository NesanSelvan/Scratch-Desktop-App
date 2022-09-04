import 'package:annai_store/core/db/bank/bank.dart';
import 'package:annai_store/core/db/billing/estimate/estimate.dart';
import 'package:annai_store/core/db/billing/orders/orders.dart';
import 'package:annai_store/core/db/billing/purchase/purchase.dart';
import 'package:annai_store/core/db/billing/quotation/quotation.dart';
import 'package:annai_store/core/db/billing/sales/sales.dart';
import 'package:annai_store/core/db/billing/sewing_service/sewing_service.dart';
import 'package:annai_store/core/db/category/category.dart';
import 'package:annai_store/core/db/company/company.dart';
import 'package:annai_store/core/db/customer/customer.dart';
import 'package:annai_store/core/db/employee/employee.dart';
import 'package:annai_store/core/db/paths/paths.dart';
import 'package:annai_store/core/db/payments/estimate_receipt/estimate_receipt.dart';
import 'package:annai_store/core/db/payments/payment/payment.dart';
import 'package:annai_store/core/db/payments/receipt/receipt.dart';
import 'package:annai_store/core/db/payments/voucher/voucher.dart';
import 'package:annai_store/core/db/product/product.dart';
import 'package:annai_store/core/db/product/sub/sub_product.dart';
import 'package:annai_store/core/db/stock/stock.dart';
import 'package:annai_store/core/db/threads/thread_compant.dart';
import 'package:annai_store/models/unit/unit.dart';
import 'package:annai_store/utils/file/file.dart';
import 'package:annai_store/utils/folder/folder.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class Database {
  LocalStorage storage = LocalStorage(
    FileUtility.getDBFileName(),
    FolderUtility.getDBFolderLocation(),
  );
  Future initialize() async {
    final _storage = LocalStorage(
      FileUtility.getDBFileName(),
      FolderUtility.getDBFolderLocation(),
    );
    // debugPrint("Storage : ${await _storage.getItem('units')}");

    storage = _storage;
  }

  void dispose() {
    storage.dispose();
  }

  CategoryDB get categoryDB => CategoryDB();

  CustomerDB get customerDB => CustomerDB();

  EmployeeDB get employeeDB => EmployeeDB();

  CompanyDB get companyDB => CompanyDB();

  ProductDB get productDB => ProductDB();

  SalesDB get salesDB => SalesDB();

  SewingServicesDB get sewingServiceDB => SewingServicesDB();

  QuotationDB get quotationDB => QuotationDB();

  StockDB get stocksDB => StockDB();

  ThreadCompanyDB get threadCompanyDB => ThreadCompanyDB();
  SubProductDB get subProductsDB => SubProductDB();

  OrdersDB get ordersDB => OrdersDB();

  EstimateDB get estimateDB => EstimateDB();

  ReceiptDB get receiptDB => ReceiptDB();

  VoucherDB get voucherDB => VoucherDB();

  PurchaseDB get purchaseDB => PurchaseDB();

  PaymentDB get paymentDB => PaymentDB();

  PathsDB get pathsDB => PathsDB();

  BankDB get bankDB => BankDB();

  EstimateReceiptDB get estimateReceiptDB => EstimateReceiptDB();

  List<UnitModel> getAllUnits() {
    try {
      final data = storage.getItem('units');
      // debugPrint('Unit Item: $data');

      final List<UnitModel> datas = [];
      if (data != null) {
        for (final item in data as List) {
          // debugPrint('Unit Item: $item');
          datas.add(UnitModel.fromJson(item as Map<String, dynamic>));
        }
      }
      return datas;
    } catch (e) {
      debugPrint('Unit Fetcjing Error: $e');
      return [];
    }
  }

  Future<void> addUnitToDb(UnitModel unitModel) async {
    final datas = [...getAllUnits(), unitModel];
    await updateUnitToDB(datas);
  }

  Future<void> updateUnitToDB(List<UnitModel> unitModelList) async {
    final unitModelListMap = getUnitListJson(unitModelList);
    await storage.setItem("units", unitModelListMap);
  }

  Future<void> deleteUnit(UnitModel unitModel) async {
    final datas = getAllUnits();
    datas.remove(unitModel);
    updateUnitToDB(datas);
  }

  Future<void> updateUnit(UnitModel unitModel) async {
    final unitList = getAllUnits();
    final datas = unitList
        .where(
          (element) =>
              element.formalName == unitModel.formalName ||
              element.symbol == unitModel.symbol,
        )
        .toList();
    final index = unitList.indexOf(datas[0]);
    unitList[index] = unitModel;
    updateUnitToDB(unitList);
  }

  UnitModel? getUnitModelById(String id) {
    final allUnits =
        getAllUnits().where((element) => element.id == id).toList();
    if (allUnits.isEmpty) {
      return null;
    }

    return getAllUnits().where((element) => element.id == id).toList()[0];
  }

  Future<void> deleteCustomerRelatedData() async {
    await customerDB.clearAll();
    await ordersDB.resetOrder();
    await salesDB.resetSales();
    await quotationDB.resetQuotation();
    await estimateDB.resetEstimate();
  }
}
