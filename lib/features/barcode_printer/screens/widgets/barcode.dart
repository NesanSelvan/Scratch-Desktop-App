import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/features/barcode_printer/cubit/barcode_printer_cubit.dart';
import 'package:annai_store/utils/printer/printer.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class BarcodePrinterWidget extends StatelessWidget {
  const BarcodePrinterWidget({super.key});
  final double _barcodeWidth = 155;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: _barcodeWidth * 4 + 6,
      // height: MediaQuery.of(context).size.width * 0.3,
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      child: Stack(
        children: [
          BlocConsumer<BarcodePrinterCubit, BarcodePrinterState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                child: Wrap(
                  children: [
                    ...state.barcodeImages
                        .asMap()
                        .map(
                          (key, e) => MapEntry(
                            key,
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return Column(
                                  children: [
                                    Container(
                                      width: _barcodeWidth,
                                      height: 60,
                                      child: Stack(
                                        children: [
                                          SfBarcodeGenerator(
                                            value: e.barcodeValue,
                                            showValue: true,
                                            textStyle: const TextStyle(
                                              fontSize: 10,
                                            ),
                                            barColor: const Color(0xFF000000)
                                                .withOpacity(0.8),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              color: Colors.white,
                                              child: GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<
                                                          BarcodePrinterCubit>()
                                                      .removeImage(key);
                                                },
                                                child: const Icon(
                                                  Icons.cancel_rounded,
                                                  color: Colors.red,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${Constants.ruppeeSymbol} ${e.amount ?? 0}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                        .values,
                  ],
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomTextButton(
              "Print",
              backgoundColor: Colors.green[400],
              textColor: Colors.white,
              onPressed: () {
                PrinterUtility.barcodePrint(
                  context.read<BarcodePrinterCubit>().state.barcodeImages,
                  context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
