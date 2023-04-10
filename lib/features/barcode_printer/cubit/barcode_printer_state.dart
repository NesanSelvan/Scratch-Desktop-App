// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'barcode_printer_cubit.dart';

class BarcodePrinterState {
  final List<Uint8List> barcodeImages;

  BarcodePrinterState({
    required this.barcodeImages,
  });

  BarcodePrinterState copyWith({
    List<Uint8List>? barcodeImages,
  }) {
    return BarcodePrinterState(
      barcodeImages: barcodeImages ?? this.barcodeImages,
    );
  }

  @override
  String toString() => 'BarcodePrinterState(barcodeImages: $barcodeImages)';
}
