import 'dart:developer';

import 'package:annai_store/enum/operation.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/models/roundoff.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:annai_store/models/tax_cal/tax_cal.dart';

import '../constants.dart';
import 'bills/sales.dart';

double getPrice(double qty, double rate) =>
    double.parse((qty * rate).toStringAsFixed(2));

double getPriceByCustomer(
    ProductModel productModel, CustomerModel? customerModel) {
  if (customerModel == null) {
    return 0;
  }
  //MRP
  if (customerModel.type == customerType[0]) {
    return productModel.sellingPrice;
  }
  //Tailor
  else if (customerModel.type == customerType[1]) {
    return productModel.retail;
  }
  //Wholesale
  else {
    return productModel.wholesale;
  }
}

double getDiscountAmount(
    SalesProductModel salesProductModel, CustomerModel? customerModel) {
  if (salesProductModel.rate == null) {
    if (customerModel == null) {
      return 0;
    }
    return double.parse(
      (SalesCalculation.getSalesPrice(salesProductModel, customerModel) -
              getAmount(salesProductModel, customerModel))
          .toStringAsFixed(2),
    );
  } else {
    final price = salesProductModel.qty! * salesProductModel.rate!;
    return double.parse(
      (price * (salesProductModel.discountPer! / 100)).toStringAsFixed(2),
    );
  }
}

double getAmount(
    SalesProductModel salesProductModel, CustomerModel? customerModel) {
  if (salesProductModel.rate == null) {
    if (customerModel == null) {
      return 0;
    }
    // final discountAmount = getDiscountAmount(salesProductModel);
    // return double.parse(
    //     (salesProductModel.price! - discountAmount).toStringAsFixed(2));
    return double.parse(
      (SalesCalculation.getSalesPrice(salesProductModel, customerModel) /
              (1 + (salesProductModel.discountPer! / 100)))
          .toStringAsFixed(2),
    );
  } else {
    final price = salesProductModel.qty! * salesProductModel.rate!;
    // return double.parse((price / (1 + (salesProductModel.discountPer! / 100)))
    //     .toStringAsFixed(2));
    return double.parse(
      (price - getDiscountAmount(salesProductModel, customerModel))
          .toStringAsFixed(2),
    );
  }
}

double getTotalAmount(
    SalesProductModel salesProductModel, CustomerModel? customerModel) {
  // if (salesProductModel.rate == null) {
  if (customerModel == null) {
    return 0;
  }
  final amount = getAmount(salesProductModel, customerModel);
  return double.parse(
    (amount + calculateTaxWithSalesProductModel(amount, salesProductModel))
        .toStringAsFixed(2),
  );
  // } else {
  //   return 0;
  // }
}

double getTotalAmountWithoutTax(
    SalesProductModel salesProductModel, CustomerModel? customerModel) {
  if (customerModel == null) {
    return 0;
  }
  final amount = getAmount(salesProductModel, customerModel);
  return double.parse(amount.toStringAsFixed(0));
}

double calculateTaxWithSalesProductModel(
    double amount, SalesProductModel salesProductModel) {
  return amount * (salesProductModel.categoryModel!.tax / 100);
}

double calculateTax(double amount, double tax) {
  return amount * (tax / 100);
}

double getGrandTotal(
    List<SalesProductModel> list, CustomerModel? customerModel) {
  if (customerModel == null) {
    return 0;
  }
  double total = 0;
  for (final item in list) {
    total += getTotalAmount(item, customerModel);
  }
  return double.parse(total.toStringAsFixed(2));
}

RoundOff getRoundOff(
  double grandTotal,
) {
  final newVal = grandTotal.round();
  final minus = newVal - grandTotal;
  log("Minus: $newVal");
  log("Minus: $grandTotal");
  log("Minus: $minus");
  if (minus < 0.5) {
    return RoundOff(operation: OperationEnum.Add, roundOffAmount: minus);
  } else {
    return RoundOff(operation: OperationEnum.Subtract, roundOffAmount: minus);
  }
}

double getGrandTotalWithoutTax(
    List<SalesProductModel> list, CustomerModel? customerModel) {
  if (customerModel == null) {
    return 0;
  }
  double total = 0;
  for (final item in list) {
    total += getTotalAmountWithoutTax(item, customerModel);
  }
  return double.parse(total.toStringAsFixed(2));
}

double calculateAmountWithoutTax(
    List<SalesProductModel> list, CustomerModel? customerModel) {
  if (customerModel == null) {
    return 0;
  }
  double total = 0;
  for (final item in list) {
    total += getAmount(item, customerModel);
  }
  return total;
}

// double getAllTaxAmount(
//     List<SalesProductModel> list, CustomerModel? customerModel) {
//   if (customerModel == null) {
//     return 0;
//   }
//   double tax = 0;
//   for (final item in list) {
//     final amount = getAmount(item, customerModel);
//     tax += calculateTax(amount, item);
//   }
//   return tax;
// }

List<double> getTotalTaxableAndTotalTaxValue(List<TaxCalModel> data) {
  double totalTaxableValue = 0, totalTaxAmount = 0;
  for (final item in data) {
    totalTaxableValue += item.taxableVal;
    totalTaxAmount += item.totalTaxAmount;
  }
  return [totalTaxableValue, totalTaxAmount];
}
