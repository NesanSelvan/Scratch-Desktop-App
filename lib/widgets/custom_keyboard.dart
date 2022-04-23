import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../utils/utility.dart';

class CustomKeyboard extends StatelessWidget {
  final FocusNode focusNode;
  final Widget child;
  final bool? isKeyPressUp;
  final Callback onEnter, onArrowUp, onArrowDown, onAdd;
  final Callback? onF1,
      onF12,
      onShiftRight,
      onF2,
      onF3,
      onF5,
      onF6,
      onF7,
      onF8,
      onArrowRight,
      onArrowLeft;
  const CustomKeyboard(
      {Key? key,
      required this.focusNode,
      required this.child,
      required this.onEnter,
      required this.onArrowUp,
      required this.onArrowDown,
      required this.onAdd,
      this.onF1,
      this.onF2,
      this.onF3,
      this.onArrowRight,
      this.onArrowLeft,
      this.isKeyPressUp,
      this.onF12,
      this.onShiftRight,
      this.onF5,
      this.onF6,
      this.onF7,
      this.onF8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: focusNode,
      onKey: (RawKeyEvent rawKeyEvent) async {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);
        // debugPrint('Custom Keyboard: ${rawKeyEvent}');

        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;

            if (isKeyPressUp ?? !isKeyDown) {
              if (data.logicalKey == LogicalKeyboardKey.arrowDown) {
                onArrowDown();
              } else if (data.logicalKey == LogicalKeyboardKey.arrowUp) {
                onArrowUp();
              } else if (data.logicalKey == LogicalKeyboardKey.enter ||
                  data.logicalKey == LogicalKeyboardKey.tab) {
                onEnter();
              } else if (data.logicalKey == LogicalKeyboardKey.add ||
                  data.logicalKey == LogicalKeyboardKey.numpadAdd) {
                onAdd();
              } else if (data.logicalKey == LogicalKeyboardKey.f5) {
                if (onF5 != null) {
                  onF5!();
                }
              } else if (data.logicalKey == LogicalKeyboardKey.f6) {
                if (onF6 != null) {
                  onF6!();
                }
              } else if (data.logicalKey == LogicalKeyboardKey.f7) {
                if (onF7 != null) {
                  onF7!();
                }
              } else if (data.logicalKey == LogicalKeyboardKey.f8) {
                if (onF8 != null) {
                  onF8!();
                }
              }
            } else if (data.logicalKey == LogicalKeyboardKey.arrowRight) {
              // debugPrint('Custom Keyboard: Right Cliecked');
              debugPrint("Right Arrow Clecked");
              onArrowRight!();
            } else if (data.logicalKey == LogicalKeyboardKey.arrowLeft) {
              onArrowLeft ?? () {};
            } else if (data.logicalKey == LogicalKeyboardKey.f1) {
              onF1 ?? () {};
            } else if (data.logicalKey == LogicalKeyboardKey.f2) {
              onF2 ?? () {};
            } else if (data.logicalKey == LogicalKeyboardKey.f3) {
              onF3 ?? () {};
            } else if (data.logicalKey == LogicalKeyboardKey.f12) {
              if (onF12 != null) {
                onF12!();
              }
            } else if (data.logicalKey == LogicalKeyboardKey.shiftRight) {
              debugPrint("Previous Node Shuft Clicked");
              if (onShiftRight != null) {
                onShiftRight!();
              }
            }
            break;
          default:
            throw Exception(
              'Unsupported platform ${rawKeyEvent.data.runtimeType}',
            );
        }
      },
      child: child,
    );
  }
}
