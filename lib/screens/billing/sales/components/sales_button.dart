import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:flutter/material.dart';

class SalesButton extends StatelessWidget {
  const SalesButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      text,
      fontSize: 12,
      textColor: Colors.white,
      backgoundColor: kPrimaryColor,
      onPressed: onPressed,
    );
  }
}
