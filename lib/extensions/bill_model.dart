import 'package:annai_store/features/analytics/sales/cubit/sales_analytics_cubit.dart';
import 'package:annai_store/models/bill/bill.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';

extension GroupByHSNCode on List<BillModel> {
  List<HSNAndAmount> get groupByHSNCode {
    List<HSNAndAmount> data = [];
    final allProducts = expand((element) {
      if (element.productList != null) {
        return element.productList!;
      } else {
        return [];
      }
    }).toList();

    for (final product in allProducts) {
      if (product is SalesProductModel) {
        final category = product.categoryModel;
        final totalAmount = product.price;
        if (category != null) {
          final index = data.indexWhere(
              (element) => element.categoryModel.hsnCode == category.hsnCode);
          final price = product.price ?? 0;
          final totalPrice =
              (price + (price * ((product.categoryModel?.tax ?? 0) / 100)))
                  .round()
                  .toDouble();
          if (index == -1) {
            data.add(HSNAndAmount(category, totalPrice));
          } else {
            data[index] =
                data[index].copyWith(amount: data[index].amount + totalPrice);
          }
        }
      }
    }

    // for (final bill in this) {
    //   if (bill.productList != null) {
    //
    //   }
    // }
    return data;
  }
}
