import 'package:custom/custom_text.dart';
import 'package:flutter/material.dart';

class SearchByText extends StatelessWidget {
  const SearchByText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomText(
      "Search By",
      size: 12,
    );
  }
}
