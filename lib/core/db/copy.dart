import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../../controller/billing/sales/sales.dart';
import '../../models/bank/bank.dart';
import '../../models/bill/bill.dart';
import '../../models/company/company.dart';
import '../../models/estimate/estimate.dart';
import '../../models/orders/order.dart';
import '../../models/payment/payment.dart';
import '../../models/persons/employee/employee.dart';
import '../../models/purchase/purchase.dart';
import '../../models/quotations/quotations.dart';
import '../../models/stocks/stock.dart';

// ignore: avoid_classes_with_only_static_members
class CopyDB {
  static Future copyDB(String fileName) async {
    final storage = LocalStorage(fileName);
    debugPrint("FileName : $fileName");

    ///Category Copying...
    final data = storage.getItem('category');
    debugPrint("Category From COPYDB: $data");
    final List<CategoryModel> datas = [];
    if (data != null) {
      for (final item in data as List) {
        datas.add(CategoryModel.fromJson(item as Map<String, dynamic>));
      }
    }
    await categoryDB.updateCategoryToDB(datas);

    ///Bank Copying...
    final bank = storage.getItem('bank');
    debugPrint("Category From COPYDB: $bank");
    final List<BankModel> bankList = [];
    if (bank != null) {
      if (bank is List) {
        for (final item in bank) {
          bankList.add(BankModel.fromJson(item as Map<String, dynamic>));
        }
      }
    }
    await bankDB.updateBankToDB(bankList);

    ///Sales Copying...
    final sales = storage.getItem('sales');
    debugPrint("Category From COPYDB: $sales");
    final List<BillModel> billList = [];
    if (sales != null) {
      if (sales is List)
        for (final item in sales) {
          billList.add(BillModel.fromJson(item as Map<String, dynamic>));
        }
    }
    await salesDB.updateBillToDB(billList);

    ///Sales Copying...
    final estimate = storage.getItem('estimate');
    debugPrint("Category From COPYDB: $estimate");
    final List<EstimateModel> estimateList = [];
    if (estimate != null) {
      if (estimate is List)
        for (final item in estimate) {
          estimateList
              .add(EstimateModel.fromJson(item as Map<String, dynamic>));
        }
    }
    await estimateDB.updateEstimateToDB(estimateList);

    ///Sales Copying...
    final orders = storage.getItem('orders');
    debugPrint("Category From COPYDB: $orders");
    final List<OrderModel> orderList = [];
    if (orders != null) {
      if (orders is List)
        for (final item in orders) {
          orderList.add(OrderModel.fromJson(item as Map<String, dynamic>));
        }
    }
    await orderDB.updateOrderToDB(orderList);

    ///Sales Copying...
    final purchase = storage.getItem('purchase');
    debugPrint("Category From COPYDB: $purchase");
    final List<PurchaseModel> purchaseList = [];
    if (purchase != null) {
      if (purchase is List)
        for (final item in purchase) {
          purchaseList
              .add(PurchaseModel.fromJson(item as Map<String, dynamic>));
        }
    }
    await purchaseDB.updatePurchaseToDB(purchaseList);

    ///quotation Copying...
    final quotation = storage.getItem('quotation');
    debugPrint("Category From COPYDB: $quotation");
    final List<QuotationModel> quotationList = [];
    if (quotation != null) {
      if (quotation is List)
        for (final item in quotation) {
          quotationList
              .add(QuotationModel.fromJson(item as Map<String, dynamic>));
        }
    }
    await quotationDB.updateQuotationToDB(quotationList);

    ///company Copying...
    final company = storage.getItem('company');
    debugPrint("company From COPYDB: $company");
    final List<CompanyModel> companyList = [];
    if (company != null) {
      if (company is List)
        for (final item in company) {
          companyList.add(CompanyModel.fromJson(item as Map<String, dynamic>));
        }
    }
    await companyDB.updateCompanyToDB(companyList);

    ///customers Copying...
    final customers = storage.getItem('customers');
    debugPrint("customers From COPYDB: $customers");
    final List<CustomerModel> custList = [];
    if (customers != null) {
      if (customers is List)
        for (final item in customers) {
          custList.add(CustomerModel.fromJson(item as Map<String, dynamic>));
        }
    }
    await customerDB.updateCustomerToDB(custList);

    ///company Copying...
    final employees = storage.getItem('employees');
    debugPrint("employees From COPYDB: $employees");
    final List<EmployeeModel> empList = [];
    if (employees != null) {
      if (employees is List)
        for (final item in employees) {
          empList.add(EmployeeModel.fromJson(item as Map<String, dynamic>));
        }
    }
    await employeeDB.updateEmployeeToDB(empList);

    ///payments Copying...
    final payments = storage.getItem('payments');
    debugPrint("payments From COPYDB: $payments");
    final List<PaymentModel> payList = [];
    if (payments != null) {
      if (payments is List)
        for (final item in payments) {
          payList.add(PaymentModel.fromJson(item as Map<String, dynamic>));
        }
    }
    await paymentDB.updatePaymentToDB(payList);

    ///products Copying...
    final products = storage.getItem('products');
    debugPrint("products From COPYDB: $products");
    final List<ProductModel> productList = [];
    if (products != null) {
      if (products is List)
        for (final item in products) {
          productList.add(ProductModel.fromJson(item as Map<String, dynamic>));
        }
    }
    await productDB.updateProductToDB(productList);

    ///company Copying...
    final stocks = storage.getItem('stocks');
    debugPrint("stocks From COPYDB: $stocks");
    final List<StockModel> stockList = [];
    if (stocks != null) {
      if (stocks is List)
        for (final item in stocks) {
          stockList.add(StockModel.fromJson(item as Map<String, dynamic>));
        }
    }
    await stocksDB.updateStockToDB(stockList);
  }
}
