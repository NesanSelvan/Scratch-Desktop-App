import 'dart:developer';

import 'package:annai_store/controller/billing/sales/sales.dart';

// ignore: avoid_classes_with_only_static_members
class ReportCalculations {
  static double getPreviousBillsCalulations(
    DateTime startDate,
    String customerId,
  ) {
    double amount = 0;
    final bills = salesDB.getBillByPreviousDateAndCustomer(
      startDate,
      customerId,
    );
    print("Bills ${bills.length}");
    for (final bill in bills) {
      amount += bill.price;
    }
    return amount;
  }

  static double getPreviousReceiptCalulations(
    DateTime startDate,
    String customerId,
  ) {
    double amount = 0;
    final bills = receiptDB.getBillByPreviousDateAndCustomer(
      startDate,
      customerId,
    );
    for (final bill in bills) {
      amount += bill.givenAmount;
    }
    return amount;
  }

  static double getPreviousBalance(
    DateTime startDate,
    String customerId,
  ) {
    final billAmount = getPreviousBillsCalulations(startDate, customerId);
    final receiptAmount = getPreviousReceiptCalulations(startDate, customerId);
    log("Amount $billAmount, $receiptAmount $startDate");
    return billAmount - receiptAmount;
  }

  static double getStartBillsCalulations(
    DateTime startDate,
    String customerId,
  ) {
    double amount = 0;
    final bills = salesDB.getBillByStartDateAndCustomer(
      startDate,
      customerId,
    );
    for (final bill in bills) {
      amount += bill.price;
    }
    log("Bills ${bills.length} $amount");
    return amount;
  }

  static double getStartReceiptCalulations(
    DateTime startDate,
    String customerId,
  ) {
    double amount = 0;
    final bills = receiptDB.getBillByStartDateAndCustomer(
      startDate,
      customerId,
    );
    for (final bill in bills) {
      amount += bill.givenAmount;
    }
    return amount;
  }

  static double getStartBalance(
    DateTime startDate,
    String customerId,
  ) {
    final billAmount = getStartBillsCalulations(startDate, customerId);
    final receiptAmount = getStartReceiptCalulations(startDate, customerId);
    log("Amount $billAmount, $receiptAmount $startDate");
    return billAmount - receiptAmount;
  }

  // static List<CustomerReport> getReportList(
  //   DateTime startDate,
  //   DateTime endDate,
  //   String customerId,
  // ) {
  //   final bills =
  //       salesDB.getBillByDateAndCustomer(startDate, endDate, customerId);
  // }
}
