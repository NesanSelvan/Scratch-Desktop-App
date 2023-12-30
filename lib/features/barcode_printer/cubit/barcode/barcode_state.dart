// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'barcode_cubit.dart';

class BarcodeState {
  final List<ProductModel> allProducts;
  final ProductModel? selectedProduct;
  final TextEditingController productTextEditingController =
      TextEditingController();
  final productKeyboardNode = FocusNode();
  BarcodeState({
    required this.allProducts,
    this.selectedProduct,
  });

  BarcodeState copyWith({
    List<ProductModel>? allProducts,
    ProductModel? selectedProduct,
  }) {
    return BarcodeState(
      allProducts: allProducts ?? this.allProducts,
      selectedProduct: selectedProduct ?? this.selectedProduct,
    );
  }
}
