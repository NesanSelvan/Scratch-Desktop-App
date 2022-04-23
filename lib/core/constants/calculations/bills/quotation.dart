import 'package:annai_store/core/constants/calculations/calculations.dart';
import 'package:annai_store/models/quotations/quotations.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:annai_store/models/tax_cal/tax_cal.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class QuoatationCalculations {
  static List<TaxCalModel> getQuotationTaxCalModel(QuotationModel billModel) {
    final List<TaxCalModel> taxCalList = [];

    for (final item in billModel.productList) {
      final amount = getAmount(item, billModel.customerModel);

      final taxCalModel = TaxCalModel(
        hsnCode: item.categoryModel!.hsnCode,
        taxableVal: amount,
        amount: double.parse(
          calculateTaxWithSalesProductModel(amount, item).toStringAsFixed(2),
        ),
        rate: item.categoryModel!.tax,
        totalTaxAmount: double.parse(
          calculateTaxWithSalesProductModel(amount, item).toStringAsFixed(2),
        ),
      );
      taxCalList.add(taxCalModel);
    }

    return taxCalList;
  }

  static double getTaxThermalBQuotationillRate(
      SalesProductModel salesProductModel, QuotationModel billModel) {
    final amount = getAmount(salesProductModel, billModel.customerModel);
    debugPrint("Amount : $amount");

    return double.parse(
      ((calculateTaxWithSalesProductModel(
                    amount,
                    salesProductModel,
                  ) +
                  getDiscountAmount(
                    salesProductModel,
                    billModel.customerModel,
                  ) +
                  amount) /
              salesProductModel.qty!)
          .toStringAsFixed(2),
    );
  }

  static double getTaxThermalBillRate(
      SalesProductModel salesProductModel, QuotationModel billModel) {
    final amount = getAmount(salesProductModel, billModel.customerModel);

    return double.parse(
      ((calculateTaxWithSalesProductModel(
                    amount,
                    salesProductModel,
                  ) +
                  getDiscountAmount(
                    salesProductModel,
                    billModel.customerModel,
                  ) +
                  amount) /
              salesProductModel.qty!)
          .toStringAsFixed(2),
    );
  }

  static double getTotalAmountForTaxThermal(QuotationModel billModel) {
    double totalAmount = 0;
    for (final salesProductModel in billModel.productList) {
      totalAmount += salesProductModel.qty! *
          getTaxThermalBillRate(salesProductModel, billModel);
    }

    return totalAmount;
  }

  static double getTotalDiscountForTaxThermal(QuotationModel billModel) {
    double totalDis = 0;
    for (final salesProductModel in billModel.productList) {
      totalDis += getDiscountAmount(salesProductModel, billModel.customerModel);
    }
    return totalDis;
  }
}
