// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'sales_analytics_cubit.dart';

class SalesAnalyticsState {
  final List<ChartSampleData> salesData;
  final List<ChartSampleData> purchaseData;
  // final String? selectionString;
  final ChartSampleData? selectedChart;
  final PickerDateRange? pickedDateRange;

  SalesAnalyticsState(
    this.salesData,
    this.purchaseData, {
    this.pickedDateRange,
    // this.selectionString,
    this.selectedChart,
  });

  DateTime? get startDate {
    return pickedDateRange?.startDate;
  }

  DateTime? get endDate {
    return pickedDateRange?.endDate;
  }

  double? get totalSalesAmount {
    double sum = 0;
    for (final sale in salesData) {
      sum += sale.hsnAndAmount?.amount ?? 0;
    }
    return sum;
  }

  double? get totalPurchaseAmount {
    double sum = 0;
    for (final sale in salesData) {
      sum += sale.hsnAndAmount?.amount ?? 0;
    }
    return sum;
  }

  @override
  String toString() =>
      'SalesAnalyticsState(pickedDateRange: ${pickedDateRange}, )';

  SalesAnalyticsState copyWith(
      {List<ChartSampleData>? salesData,
      List<ChartSampleData>? purchaseData,
      PickerDateRange? pickedDateRange,
      ChartSampleData? selectedChart}) {
    final model = SalesAnalyticsState(
      salesData ?? this.salesData,
      purchaseData ?? this.purchaseData,
      selectedChart: selectedChart,
      pickedDateRange: pickedDateRange ?? this.pickedDateRange,
    );
    log("Model: ${model.selectedChart?.hsnAndAmount?.categoryModel}");
    return model;
  }
}
