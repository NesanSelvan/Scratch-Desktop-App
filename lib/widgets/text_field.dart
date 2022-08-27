import 'package:annai_store/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import 'custom_keyboard.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final IconData? iconData;
  final FocusNode? prevNode;
  final FocusNode? nextNode;
  final TextEditingController? controller;
  final bool? isObscure, isEnabled, autofocus;
  final TextInputType? textInputType;
  final VoidCallback? onEditingComplete;
  final Color? errorTextFieldColor;
  final ValueChanged<String>? onChange;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? initialValue;

  const CustomTextField(
      {this.label,
      this.focusNode,
      this.autofocus = false,
      this.textInputType,
      this.onEditingComplete,
      this.iconData,
      this.controller,
      this.isObscure = false,
      this.isEnabled = true,
      this.onChange,
      this.maxLines,
      this.errorTextFieldColor,
      this.initialValue,
      this.prevNode,
      this.nextNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      focusNode: focusNode,
      obscureText: isObscure ?? false,
      controller: controller,
      cursorHeight: 20,
      autofocus: autofocus ?? false,
      onChanged: onChange,
      enabled: isEnabled,
      maxLines: maxLines ?? 1,
      cursorColor: kPrimaryColor,
      onEditingComplete: () {
        if (onEditingComplete != null) {
          onEditingComplete!();
        }
        if (nextNode != null) {
          nextNode!.requestFocus();
        }
      },
      keyboardType: textInputType,
      decoration: getInputDecoration(
        iconData,
        label ?? "",
        "",
        isEnabled: isEnabled ?? true,
        errorTextFieldColor: errorTextFieldColor,
      ),
    );
  }
}

InputDecoration getInputDecoration(
    IconData? iconData, String label, String? hint,
    {bool isEnabled = true, Color? errorTextFieldColor}) {
  return InputDecoration(
    fillColor: isEnabled ? Colors.white : Colors.grey[100],
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: errorTextFieldColor ?? Colors.grey[200]!),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: errorTextFieldColor ?? Colors.grey[200]!),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: errorTextFieldColor ?? kMidPrimaryColor),
    ),
    filled: true,
    hintText: hint ?? "",
    prefixIcon: iconData == null
        ? null
        : Icon(
            iconData,
            size: 20,
            color: kPrimaryColor,
          ),
    contentPadding:
        const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
    labelText: label,
    labelStyle: TextStyle(color: errorTextFieldColor),
  );
}

class CustomTFWithKeyboard extends StatelessWidget {
  final FocusNode keyboardNode;
  final Callback? onEnter;
  final Callback? onAdd;
  final Callback? onArrowUp;
  final Callback? onF1;
  final Callback? onF2;
  final Callback? onF3;
  final Callback? onArrowDown;
  final String? label;
  final IconData? iconData;
  final FocusNode? prevNode;
  final bool? isKeyPressUp;
  final FocusNode? nextNode;
  final TextEditingController? controller;
  final bool? isObscure, isEnabled, autofocus;
  final TextInputType? textInputType;
  final VoidCallback? onEditingComplete;
  final Color? errorTextFieldColor;
  final ValueChanged<String>? onChange;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? initialValue;
  const CustomTFWithKeyboard(
      {required this.keyboardNode,
      this.onEnter,
      this.onAdd,
      this.onArrowUp,
      this.onF1,
      this.onF2,
      this.onF3,
      this.onArrowDown,
      this.label,
      this.iconData,
      this.prevNode,
      this.nextNode,
      this.controller,
      this.isObscure,
      this.isKeyPressUp,
      this.isEnabled,
      this.autofocus,
      this.textInputType,
      this.onEditingComplete,
      this.errorTextFieldColor,
      this.onChange,
      this.focusNode,
      this.maxLines,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return CustomKeyboard(
      isKeyPressUp: isKeyPressUp,
      focusNode: keyboardNode,
      onAdd: onAdd ?? () {},
      onArrowDown: onArrowDown ?? () {},
      onArrowUp: onArrowUp ?? () {},
      onEnter: onEnter ?? () {},
      onF1: onF1 ?? () {},
      onF2: onF2 ?? () {},
      onF3: onF3 ?? () {},
      onShiftRight: () {
        if (prevNode != null) {
          debugPrint("Previous Node CLick");
          prevNode!.requestFocus();
        }
      },
      child: CustomTextField(
        label: label,
        iconData: iconData,
        prevNode: prevNode,
        nextNode: nextNode,
        controller: controller,
        isObscure: isObscure,
        isEnabled: isEnabled,
        autofocus: autofocus,
        textInputType: textInputType,
        onEditingComplete: onEditingComplete,
        errorTextFieldColor: errorTextFieldColor,
        onChange: onChange,
        focusNode: focusNode,
        maxLines: maxLines,
        initialValue: initialValue,
      ),
    );
  }
}
