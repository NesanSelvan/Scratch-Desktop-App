// ignore: avoid_classes_with_only_static_members
import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/models/payment/payment.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class PaymentCalculation {
  static List<PaymentModel> _getStartingBillOfPayment(List<PaymentModel> data) {
    data.sort((a, b) {
      return a.createdAt.compareTo(b.createdAt);
    });
    debugPrint("SprtedData : $data");
    return data;
  }

  static List<PaymentModel> _getPaymentBillBySelectedPayment(
      List<PaymentModel> paymentList, PaymentModel selectedPaymentModel) {
    final sortedPayment = _getStartingBillOfPayment(paymentList);
    List<PaymentModel> list = [];
    for (final payment in sortedPayment) {
      if (payment.id == selectedPaymentModel.id) {
        list.add(payment);
        break;
      } else {
        list.add(payment);
      }
    }
    return list;
  }

  static double getPendingAmount(
      String purchaseID, PaymentModel? selectedPaymentModel) {
    double givenAmount = 0;

    final purchase = purchaseDB.getPurchaseModelById(purchaseID);
    if (purchase != null) {
      final paymentList = paymentDB.getPaymentByPurchaseID(purchaseID);
      if (selectedPaymentModel == null) {
        for (final item in paymentList) {
          givenAmount += item.givenAmount;
        }
        return purchase.grandTotal - givenAmount;
      } else {
        final list =
            _getPaymentBillBySelectedPayment(paymentList, selectedPaymentModel);
        for (var i = 0; i < list.length - 1; i++) {
          givenAmount += list[i].givenAmount;
        }
        return purchase.grandTotal - givenAmount;
      }
    }
    return 0;
  }
}
