import 'dart:developer';
import 'dart:typed_data';

import 'package:annai_store/models/price/price.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'barcode_printer_state.dart';

class BarcodePrinterCubit extends Cubit<BarcodePrinterState> {
  BarcodePrinterCubit() : super(BarcodePrinterState(barcodeImages: []));

  void addImages(BarcodeAndPrice decodedImage, int count) {
    emit(
      state.copyWith(
        barcodeImages: [
          ...state.barcodeImages,
          ...List.generate(count, (index) => decodedImage),
        ],
      ),
    );
  }

  void removeImage(int index) {
    final tempData = state.copyWith();
    tempData.barcodeImages.removeAt(index);
    log("tempData: $tempData");
    final myState = state.copyWith(barcodeImages: tempData.barcodeImages);
    log("myState: $myState");
    emit(myState);
  }
}
