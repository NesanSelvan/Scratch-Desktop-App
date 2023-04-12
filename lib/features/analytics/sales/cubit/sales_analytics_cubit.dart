// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:annai_store/extensions/bill_model.dart';
import 'package:annai_store/extensions/purchase.dart';
import 'package:annai_store/models/purchase/product/purchase_product.dart';
import 'package:annai_store/models/purchase/purchase.dart';
import 'package:annai_store/utils/random/random.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/features/analytics/sales/screens/sales.dart';
import 'package:annai_store/models/bill/bill.dart';
import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/sales/product/sales_product.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'sales_analytics_state.dart';

class SalesAnalyticsCubit extends Cubit<SalesAnalyticsState> {
  SalesAnalyticsCubit() : super(SalesAnalyticsState([], []));

  void updateSelectedChart(ChartSampleData? chartSampleData) {
    log(chartSampleData!.hsnAndAmount!.categoryModel.toString());
    emit(state.copyWith(selectedChart: chartSampleData));
  }

  void generateSalesData() {
    print("Sales State: $state");
    final startDate = state.startDate;
    final endDate = state.endDate;
    if (startDate != null && endDate != null) {
      try {
        final allBills = salesDB.getBillByDate(startDate, endDate);
        List<ChartSampleData> charData = [];
        final datas = allBills.groupByHSNCode;
        for (final data in datas) {
          charData.add(
            ChartSampleData(
              x: "${data.categoryModel.hsnCode} (${data.categoryModel.category})",
              y: data.amount,
              pointColor: RandomGenerator.generateColor,
              hsnAndAmount: data,
            ),
          );
        }
        charData.sort((a, b) => (a.hsnAndAmount?.categoryModel?.hsnCode ?? 0)
            .compareTo(b.hsnAndAmount?.categoryModel?.hsnCode ?? 0));

        final purchaseBills = purchaseDB.getBillByDate(
          startDate,
          endDate,
        );
        final purchaseChart = purchaseBills.groupByHSNCode;
        List<ChartSampleData> purchaseChartData = [];

        for (final data in purchaseChart) {
          purchaseChartData.add(
            ChartSampleData(
              x: "${data.categoryModel.hsnCode} (${data.categoryModel.category})",
              y: data.amount,
              pointColor: RandomGenerator.generateColor,
              hsnAndAmount: data,
            ),
          );
        }
        purchaseChartData.sort((a, b) =>
            (a.hsnAndAmount?.categoryModel.hsnCode ?? 0)
                .compareTo(b.hsnAndAmount?.categoryModel.hsnCode ?? 0));

        emit(state.copyWith(
          salesData: charData,
          purchaseData: purchaseChartData,
        ));
      } catch (e, s) {
        print(s);
        print(e);
      }
    }
  }

  void updateDate(PickerDateRange range) {
    emit(state.copyWith(pickedDateRange: range));
  }
}

class HSNAndAmount {
  final CategoryModel categoryModel;
  final double amount;

  HSNAndAmount(
    this.categoryModel,
    this.amount,
  );

  @override
  bool operator ==(covariant HSNAndAmount other) {
    if (identical(this, other)) return true;

    return other.categoryModel == categoryModel && other.amount == amount;
  }

  HSNAndAmount copyWith({
    CategoryModel? categoryModel,
    double? amount,
  }) {
    return HSNAndAmount(
      categoryModel ?? this.categoryModel,
      amount ?? this.amount,
    );
  }

  @override
  String toString() =>
      'HSNAndAmount(categoryModel: $categoryModel, amount: $amount)';

  @override
  int get hashCode => categoryModel.hashCode ^ amount.hashCode;
}
