import 'package:annai_store/features/barcode_printer/cubit/barcode/barcode_cubit.dart';
import 'package:annai_store/features/barcode_printer/screens/widgets/barcode.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/utils/null/null.dart';
import 'package:annai_store/widgets/custom_typeahead.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class BarcodeScreen extends StatelessWidget {
  const BarcodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Barcode Generator"),
      ),
      body: const Center(child: BarcodePrinterWidget()),
      // body: BlocBuilder<BarcodeCubit, BarcodeState>(
      //   builder: (context, state) {
      //     return Row(
      //       children: [
      //         Expanded(
      //           child: SingleChildScrollView(
      //             child: Column(
      //               children: [
      //                 CustomTypeAhead<ProductModel>(
      //                   isSpecialSearch: true,
      //                   onSuggestionSelected: (suggestion) {
      //                     context
      //                         .read<BarcodeCubit>()
      //                         .setSelectedProduct(suggestion);
      //                     state.productTextEditingController.text =
      //                         suggestion.productName;
      //                   },
      //                   focusNode: FocusNode(),
      //                   onEditingComplete: () {},
      //                   controller: state.productTextEditingController,
      //                   selectedModel: state.selectedProduct,
      //                   modelList: state.allProducts,
      //                   model: NullCheckUtilities.getDummyProduct(),
      //                   keyboardFocusNode: state.productKeyboardNode,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: Container(
      //             color: Colors.yellow,
      //           ),
      //         ),
      //       ],
      //     );
      //   },
      // ),
    );
  }
}
