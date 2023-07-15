import 'package:annai_store/widgets/cusom_text.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key, required this.header}) : super(key: key);
  final String header;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        header,
        size: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
