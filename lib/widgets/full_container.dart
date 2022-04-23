import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';

class FullWidthHeightContainer extends StatelessWidget {
  const FullWidthHeightContainer({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CustomScreenUtility(context).width,
      height: CustomScreenUtility(context).height,
      child: child,
    );
  }
}
