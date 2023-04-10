import 'package:annai_store/features/barcode_printer/cubit/barcode_printer_cubit.dart';
import 'package:annai_store/utils/printer/printer.dart';
import 'package:custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarcodePrinterWidget extends StatelessWidget {
  const BarcodePrinterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: MediaQuery.of(context).size.width * 0.28,
      margin: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          BlocConsumer<BarcodePrinterCubit, BarcodePrinterState>(
            listener: (context, state) {},
            builder: (context, state) {
              return GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                children: state.barcodeImages
                    .asMap()
                    .map((key, e) => MapEntry(
                        key,
                        Stack(
                          children: [
                            Image.memory(e),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                color: Colors.white,
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<BarcodePrinterCubit>()
                                        .removeImage(key);
                                  },
                                  child: Icon(
                                    Icons.cancel_rounded,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )))
                    .values
                    .toList(),
              );
            },
          ),
          CustomTextButton(
            "Print",
            backgoundColor: Colors.green[400],
            textColor: Colors.white,
            onPressed: () {
              PrinterUtility.barcodePrint(
                  context.read<BarcodePrinterCubit>().state.barcodeImages);
            },
          )
        ],
      ),
    );
  }
}
