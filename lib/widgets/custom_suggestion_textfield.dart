// import 'package:annai_store/utils/utility.dart';
// import 'package:annai_store/widgets/text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

// class CustomSuggestionTextField extends StatelessWidget {
//   FocusNode keyboardFocusNode = FocusNode();
//   FocusNode textfieldFocusNode = FocusNode();
//   String label;
//   String? hint;
//   Callback? onKeyboardPressDown;
//   Callback? onKeyboardPressEnter;
//   Callback? onEditingComplete;
//   TextEditingController controller;
//   CustomSuggestionTextField(
//       {Key? key,
//       required this.keyboardFocusNode,
//       required this.textfieldFocusNode,
//       this.onKeyboardPressDown,
//       this.onKeyboardPressEnter})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return RawKeyboardListener(
//       focusNode: keyboardFocusNode,
//       onKey: (RawKeyEvent rawKeyEvent) {
//         final isKeyDown = Utility().isKeyDown(rawKeyEvent);

//         switch (rawKeyEvent.data.runtimeType) {
//           case RawKeyEventDataWindows:
//             final data = rawKeyEvent.data as RawKeyEventDataWindows;
//             debugPrint('Sales One: ${data.logicalKey}');

//             if (!isKeyDown) {
//               if (data.logicalKey == LogicalKeyboardKey.arrowDown) {
//                 if (onKeyboardPressDown != null) {
//                   onKeyboardPressDown!();
//                 }
//               } else if (data.logicalKey == LogicalKeyboardKey.enter) {
//                 if (onKeyboardPressEnter != null) {
//                   onKeyboardPressEnter!();
//                 }
//               }
//             }
//             break;
//           default:
//             throw Exception(
//                 'Unsupported platform ${rawKeyEvent.data.runtimeType}');
//         }
//       },
//       child: TypeAheadField<T>(
//         textFieldConfiguration: TextFieldConfiguration(
//           focusNode: keyboardFocusNode,
//           controller: controller,
//           onEditingComplete: onEditingComplete,
//           decoration: getInputDecoration(
//               null,
//               label,
//               hint),
//         ),
//         suggestionsCallback: (pattern) async {
//           return controller.estimatesList!
//               .where((element) =>
//                   int.parse(element.estimateNo.split("/").first.trim()) >
//                   int.parse(
//                       controller.startController.text.split("/").first.trim()))
//               .where((suggestion) {
//             return suggestion.estimateNo
//                 .toLowerCase()
//                 .contains(pattern.toLowerCase());
//           });
//         },
//         itemBuilder: (context, EstimateModel suggestion) {
//           return ListTile(
//             tileColor: controller.endSelectedEstimateModel == suggestion
//                 ? Colors.grey[300]
//                 : Colors.white,
//             title: Text(suggestion.estimateNo),
//           );
//         },
//         onSuggestionSelected: (suggestion) {},
//       ),
//     );
//   }
// }
