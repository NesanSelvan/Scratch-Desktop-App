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
    log("Amount $billAmount, $receiptAmount");
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
