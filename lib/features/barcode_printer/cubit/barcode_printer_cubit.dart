import 'dart:developer';
import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'barcode_printer_state.dart';

class BarcodePrinterCubit extends Cubit<BarcodePrinterState> {
  BarcodePrinterCubit() : super(BarcodePrinterState(barcodeImages: []));

  void addImages(Uint8List decodedImage, int count) {
    emit(state.copyWith(barcodeImages: [
      ...state.barcodeImages,
      ...List.generate(count, (index) => decodedImage)
    ]));
  }

  void removeImage(int index) {
    final tempData = state.copyWith();
    tempData.barcodeImages.removeAt(index);
    log("tempData: ${tempData.toString()}");
    final myState = state.copyWith(barcodeImages: tempData.barcodeImages);
    log("myState: ${myState}");
    emit(myState);
  }
}
