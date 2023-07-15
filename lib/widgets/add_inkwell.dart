import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:flutter/material.dart';

class AddInkWell extends StatelessWidget {
  const AddInkWell({Key? key, required this.onPressed, required this.size})
      : super(key: key);
  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        color: kPrimaryColor,
        child: const CustomText(
          "+",
          color: Colors.white,
        ),
      ),
    );
  }
}
