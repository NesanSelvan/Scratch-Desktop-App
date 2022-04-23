import 'package:flutter/material.dart';

import '../screens/billing/estimate/estimate.dart';
import '../screens/billing/orders/orders.dart';
import '../screens/billing/purchase/purchase.dart';
import '../screens/billing/quotation/quotation.dart';
import '../screens/billing/sales/kajjabutton.dart';
import '../screens/billing/sales/sales.dart';
import '../screens/history/estimate/estimate.dart';
import '../screens/history/orders/orders.dart';
import '../screens/history/purchase/purchase.dart';
import '../screens/history/quotation/quotation.dart';
import '../screens/history/sales/sales.dart';

enum BillingEnum { Sales, Purchase, Quotation, Orders, Estimate, KajjaButton }

Widget getWidgetOfBilling(BillingEnum billingEnum) {
  switch (billingEnum) {
    case BillingEnum.Quotation:
      return QuotationScreen();
    case BillingEnum.Sales:
      return SalesScreen();
    case BillingEnum.Purchase:
      return const PurchaseScreen();
    case BillingEnum.Orders:
      return OrderScreen();
    case BillingEnum.Estimate:
      return EstimateScreen();
    case BillingEnum.KajjaButton:
      return const KajjaButtonBilling();
    default:
      return SalesScreen();
  }
}

Widget getWidgetOfHistory(BillingEnum billingEnum) {
  switch (billingEnum) {
    case BillingEnum.Quotation:
      return const QuotationHistory();
    case BillingEnum.Sales:
      return const SalesHistory();
    case BillingEnum.Purchase:
      return const PurchaseHistory();
    case BillingEnum.Orders:
      return OrderHistory();
    case BillingEnum.Estimate:
      return const EstimateHistory();
    default:
      return SalesScreen();
  }
}

String getStrofAddBilling(BillingEnum billingEnum) {
  switch (billingEnum) {
    case BillingEnum.Quotation:
      return "Quotation";
    case BillingEnum.Sales:
      return "Sales";
    case BillingEnum.Purchase:
      return "Purchase";
    case BillingEnum.Orders:
      return "Orders";
    case BillingEnum.Estimate:
      return "Estimate";
    case BillingEnum.KajjaButton:
      return "Kajja Button";
    default:
      return "";
  }
}
