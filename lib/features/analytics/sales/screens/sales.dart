import 'dart:developer';

import 'package:annai_store/features/analytics/sales/cubit/sales_analytics_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SalesAnalyticsScreen extends StatefulWidget {
  const SalesAnalyticsScreen({super.key});

  @override
  State<SalesAnalyticsScreen> createState() => _SalesAnalyticsScreenState();
}

class _SalesAnalyticsScreenState extends State<SalesAnalyticsScreen> {
  TooltipBehavior? salesTooltipBehavior;
  TooltipBehavior? purchaseTooltipBehavior;
  @override
  void initState() {
    salesTooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.y');
    purchaseTooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.y');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: BlocConsumer<SalesAnalyticsCubit, SalesAnalyticsState>(
            listener: (context, state) {
              log("state: $state");
              print("state: $state");
            },
            builder: (context, state) {
              print(state);
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          showDatePickerDialog(context);
                        },
                        child: const Text("Select Date Range"),
                      ),
                      DropdownButton<ChartSampleData>(
                        hint: const Text("Select a category"),
                        value: state.selectedChart,
                        items: [...state.purchaseData, ...state.salesData]
                            .map(
                              (e) => DropdownMenuItem<ChartSampleData>(
                                value: e,
                                child: Text(
                                  "${e.hsnAndAmount?.categoryModel.hsnCode ?? ''} (${e.hsnAndAmount?.categoryModel.category ?? ''})",
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          context
                              .read<SalesAnalyticsCubit>()
                              .updateSelectedChart(val);
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: state.salesData.isEmpty
                            ? const SizedBox()
                            : _buildDefaultColumnChart(
                                state.selectedChart == null
                                    ? state.salesData
                                    : [
                                        ...state.salesData
                                            .where(
                                              (element) =>
                                                  (element
                                                          .hsnAndAmount
                                                          ?.categoryModel
                                                          .hsnCode ??
                                                      true) ==
                                                  (state
                                                          .selectedChart!
                                                          .hsnAndAmount
                                                          ?.categoryModel
                                                          .hsnCode ??
                                                      true),
                                            )
                                            .toList()
                                      ],
                                "Sales from ${state.pickedDateRange?.startDate == null ? 'No Start Date Selected' : DateFormat('dd MMM, yyyy').format(state.pickedDateRange!.startDate!)} to ${state.endDate == null ? 'No End Date Selected' : DateFormat('dd MMM, yyyy').format(state.endDate!)}",
                                salesTooltipBehavior!,
                              ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Sales Total Amount: ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "₹ ${state.totalSalesAmount ?? '0'}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: state.salesData.isEmpty
                            ? const SizedBox()
                            : _buildDefaultColumnChart(
                                state.selectedChart == null
                                    ? state.purchaseData
                                    : [
                                        ...state.purchaseData
                                            .where(
                                              (element) =>
                                                  (element
                                                          .hsnAndAmount
                                                          ?.categoryModel
                                                          .hsnCode ??
                                                      true) ==
                                                  (state
                                                          .selectedChart!
                                                          .hsnAndAmount
                                                          ?.categoryModel
                                                          .hsnCode ??
                                                      true),
                                            )
                                            .toList()
                                      ],
                                "Purchase from ${state.startDate == null ? 'No Start Date Selected' : DateFormat('dd MMM, yyyy').format(state.startDate!)} to ${state.endDate == null ? 'No End Date Selected' : DateFormat('dd MMM, yyyy').format(state.endDate!)}",
                                purchaseTooltipBehavior!,
                              ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Puchase Total Amount: ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "₹ ${state.totalPurchaseAmount ?? '0'}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> showDatePickerDialog(BuildContext context) {
    String? value;
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SimpleDialog(
              title: const Text("Select Date Range"),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: SfDateRangePicker(
                    monthViewSettings: const DateRangePickerMonthViewSettings(
                      firstDayOfWeek: 1,
                    ),
                    selectionMode: DateRangePickerSelectionMode.range,
                    onSelectionChanged: (val) {
                      if (val.value is PickerDateRange) {
                        context
                            .read<SalesAnalyticsCubit>()
                            .updateDate(val.value as PickerDateRange);
                      }
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.read<SalesAnalyticsCubit>().generateSalesData();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Generate"),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildDefaultColumnChart(
    List<ChartSampleData> datas,
    String title,
    TooltipBehavior tooltipBehavior,
  ) {
    return SizedBox(
      child: SfCartesianChart(
        zoomPanBehavior: ZoomPanBehavior(
          enablePanning: true,
          enableMouseWheelZooming: true,
          enablePinching: true,
        ),
        plotAreaBorderWidth: 0,
        title: ChartTitle(text: title),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          title: AxisTitle(text: "Category"),
          interval: 1,
          labelRotation: 90,
        ),
        primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          title: AxisTitle(text: "Amount in Rs"),
          labelFormat: '₹ {value}',
          majorTickLines: const MajorTickLines(size: 0),
        ),
        series: _getDefaultColumnSeries(datas),
        tooltipBehavior: tooltipBehavior,
      ),
    );
  }

  /// Get default column series
  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries(
    List<ChartSampleData> allData,
  ) {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: allData,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          textStyle: TextStyle(fontSize: 10),
        ),
      )
    ];
  }
}

///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData({
    this.x,
    this.hsnAndAmount,
    this.y,
    this.xValue,
    this.yValue,
    this.secondSeriesYValue,
    this.thirdSeriesYValue,
    this.pointColor,
    this.size,
    this.text,
    this.open,
    this.close,
    this.low,
    this.high,
    this.volume,
  });

  final HSNAndAmount? hsnAndAmount;

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
