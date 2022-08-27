import 'package:custom/custom_text.dart';
import 'package:flutter/material.dart';

class MaintainenceWidget extends StatelessWidget {
  const MaintainenceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText(
      "Currently Under Maintaince",
      color: Colors.red[400],
      size: 18,
      fontWeight: FontWeight.bold,
    );
  }
}
