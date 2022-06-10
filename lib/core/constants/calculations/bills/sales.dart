import 'package:annai_store/core/constants/calculations/calculations.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/extensions/date_time.dart';
import 'package:annai_store/models/bill/bill.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:annai_store/models/tax_cal/tax_cal.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

// ignore: avoid_classes_with_only_static_members
class SalesCalculation {
  static double getSalesRateByCustomer(
      SalesProductModel productModel, CustomerModel? customerModel) {
    if (customerModel == null) {
      return 0;
    }
    //MRP
    if (customerModel.type == customerType[0]) {
      return productModel.productModel!.sellingPrice;
    }
    //Tailor
    else if (customerModel.type == customerType[1]) {
      return productModel.productModel!.retail;
    }
    //Wholesale
    else {
      return productModel.productModel!.wholesale;
    }
  }

  static double getSalesPrice(
      SalesProductModel productModel, CustomerModel? customerModel) {
    return (productModel.qty ?? 0) * (productModel.rate ?? 0);
    if (productModel.rate == null) {
      if (customerModel == null) {
        return 0;
      }
      return productModel.qty! *
          getSalesRateByCustomer(productModel, customerModel);
    } else {
      return productModel.qty! * productModel.rate!;
    }
  }

  static List<TaxCalModel> getTaxCalModel(BillModel billModel) {
    final List<TaxCalModel> taxCalList = [];

    for (final item in billModel.productList!) {
      final amount = getAmount(item, billModel.customerModel);
      final sameHSNCodeTaxCal = taxCalList
          .where((element) => element.tax == item.categoryModel?.tax)
          .toList();
      if (sameHSNCodeTaxCal.isEmpty) {
        final taxCalModel = TaxCalModel(
          hsnCode: item.categoryModel!.hsnCode,
          taxableVal: amount,
          tax: item.categoryModel?.tax ?? 0,
          amount: double.parse(
            calculateTaxWithSalesProductModel(amount, item).toStringAsFixed(2),
          ),
          rate: item.categoryModel!.tax,
          totalTaxAmount: double.parse(
            calculateTaxWithSalesProductModel(amount, item).toStringAsFixed(2),
          ),
        );
        taxCalList.add(taxCalModel);
      } else {
        final index = taxCalList.indexOf(sameHSNCodeTaxCal.first);
        final copy = taxCalList[index].copyWith();
        taxCalList[index] = copy.copyWith(
          taxableVal: copy.taxableVal + amount,
          amount: copy.amount +
              double.parse(
                calculateTaxWithSalesProductModel(amount, item).toStringAsFixed(
                  2,
                ),
              ),
          rate: item.categoryModel!.tax,
          totalTaxAmount: copy.totalTaxAmount +
              double.parse(
                calculateTaxWithSalesProductModel(amount, item)
                    .toStringAsFixed(2),
              ),
        );
      }
    }

    return taxCalList;
  }

  static double getTaxThermalBillRate(
      SalesProductModel salesProductModel, BillModel billModel) {
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

  static double getTotalAmountForTaxThermal(BillModel billModel) {
    double totalAmount = 0;
    for (final salesProductModel in billModel.productList!) {
      totalAmount += salesProductModel.qty! *
          getTaxThermalBillRate(salesProductModel, billModel);
    }

    return double.parse(totalAmount.toStringAsFixed(2));
  }

  static double getTotalDiscountForTaxThermal(BillModel billModel) {
    double totalDis = 0;
    for (final salesProductModel in billModel.productList!) {
      totalDis += getDiscountAmount(salesProductModel, billModel.customerModel);
    }
    return totalDis;
  }

  static String getOrderDateIfRequired(BillModel billModel) {
    if (billModel.buyerOrderNo == null || billModel.buyerOrderNo == "") {
      return "";
    }
    if (billModel.dateTime.isOnlyDateEqual(billModel.buyerOrderDate)) {
      return getDDMMMMYYYY(billModel.buyerOrderDate!);
    }
    if (billModel.dateTime.compareTo(billModel.buyerOrderDate!) <= 0) {
      return "";
    }
    return getDDMMMMYYYY(billModel.buyerOrderDate!);
  }

  static String getOrderNoIfRequired(BillModel billModel) {
    if (billModel.dateTime.isOnlyDateEqual(billModel.buyerOrderDate)) {
      return billModel.buyerOrderNo ?? "";
    } else if (billModel.dateTime.compareTo(billModel.buyerOrderDate!) <= 0) {
      return "";
    }
    return billModel.buyerOrderNo ?? "";
  }
}
