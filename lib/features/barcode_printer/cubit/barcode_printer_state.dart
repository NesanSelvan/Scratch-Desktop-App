// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'barcode_printer_cubit.dart';

enum BarcodeType {
  singleProduct,
  barcodeByUnitMode,
}

class BarcodeAndPrice {
  final Uint8List? barcodeBuffer;
  final String barcodeValue;
  final double amount;
  final double retail;
  final double wholesale;
  final BarcodeType barcodeType;
  final List<PriceModel> prices;

  BarcodeAndPrice(
    this.barcodeBuffer,
    this.amount,
    this.barcodeValue,
    this.retail,
    this.wholesale,
    this.barcodeType, {
    this.prices = const [],
  });
}

class BarcodePrinterState {
  final List<BarcodeAndPrice> barcodeImages;

  BarcodePrinterState({
    required this.barcodeImages,
  });

  BarcodePrinterState copyWith({
    List<BarcodeAndPrice>? barcodeImages,
  }) {
    return BarcodePrinterState(
      barcodeImages: barcodeImages ?? this.barcodeImages,
    );
  }

  @override
  String toString() => 'BarcodePrinterState(barcodeImages: $barcodeImages)';
}
