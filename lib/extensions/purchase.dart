import 'package:annai_store/features/analytics/sales/cubit/sales_analytics_cubit.dart';
import 'package:annai_store/models/purchase/product/purchase_product.dart';
import 'package:annai_store/models/purchase/purchase.dart';

extension GroupPurchaseByHSNCode on List<PurchaseModel> {
  List<HSNAndAmount> get groupByHSNCode {
    List<HSNAndAmount> data = [];
    final allProducts = expand((element) {
      if (element.productList != null) {
        return element.productList;
      } else {
        return [];
      }
    }).toList();

    for (final product in allProducts) {
      if (product is PurchaseProductModel) {
        final category = product.categoryModel;

        if (category != null) {
          final index = data.indexWhere(
              (element) => element.categoryModel.hsnCode == category.hsnCode);
          // final price = product.price ?? 0;
          // final totalPrice =
          //     (price + (price * ((product.categoryModel?.tax ?? 0) / 100)))
          //         .round()
          //         .toDouble();
          if (index == -1) {
            data.add(HSNAndAmount(category, product.amount ?? 0));
          } else {
            data[index] = data[index]
                .copyWith(amount: data[index].amount + (product.amount ?? 0));
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
