import 'package:annai_store/widgets/cusom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/utility.dart';

// class PrintOptnDialog extends StatelessWidget {
//   const PrintOptnDialog({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: null,
//     );
//   }
// }

void showPrintOptnDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      final FocusNode _focusNode = FocusNode();
      return RawKeyboardListener(
        focusNode: _focusNode,
        onKey: (RawKeyEvent rawKeyEvent) {
          final isKeyDown = Utility().isKeyDown(rawKeyEvent);

          switch (rawKeyEvent.data.runtimeType) {
            case RawKeyEventDataWindows:
              final data = rawKeyEvent.data as RawKeyEventDataWindows;
              debugPrint('Print Keyboard: ${data.logicalKey}');

              if (!isKeyDown) {}
              break;
            default:
              throw Exception(
                'Unsupported platform ${rawKeyEvent.data.runtimeType}',
              );
          }
        },
        child: SimpleDialog(
          title: CustomText(
            "Print Optn",
            color: Colors.grey[600],
          ),
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                CustomTextButton(
                  "F1.Printer",
                  onPressed: () {},
                  backgoundColor: Colors.red[400],
                  textColor: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomTextButton(
                  "F2.Thermal",
                  textColor: Colors.white,
                  backgoundColor: Colors.yellow[400],
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      );
    },
  );
}
