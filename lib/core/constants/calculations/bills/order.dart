import 'package:annai_store/core/constants/calculations/calculations.dart';
import 'package:annai_store/models/orders/order.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:annai_store/models/tax_cal/tax_cal.dart';

class OrderCalculations {
  List<TaxCalModel> getOrderTaxCalModel(OrderModel billModel) {
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

  static double getTaxThermalOrderBillRate(
      SalesProductModel salesProductModel, OrderModel billModel) {
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

  static double getTaxThermalBillRate(
      SalesProductModel salesProductModel, OrderModel billModel) {
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

  static double getTotalAmountForTaxThermal(OrderModel billModel) {
    double totalAmount = 0;
    for (final salesProductModel in billModel.productList) {
      totalAmount += salesProductModel.qty! *
          getTaxThermalBillRate(salesProductModel, billModel);
    }

    return totalAmount;
  }

  static double getTotalDiscountForTaxThermal(OrderModel billModel) {
    double totalDis = 0;
    for (final salesProductModel in billModel.productList) {
      totalDis += getDiscountAmount(salesProductModel, billModel.customerModel);
    }
    return totalDis;
  }
}
