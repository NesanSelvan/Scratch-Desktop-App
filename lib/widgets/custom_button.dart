import 'package:annai_store/core/constants/constants.dart';
import 'package:custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  const CustomButton({
    required this.icon,
    required this.text,
    required this.onTap,
    this.buttonColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      // BoxConstraints(
      //   maxWidth: MediaQuery.of(context).size.width,
      //   maxHeight: MediaQuery.of(context).size.height,
      // ),
    );
    return TextButton.icon(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(buttonColor ?? kPrimaryColor),
      ),
      onPressed: onTap,
      icon: CustomIcon(
        icon,
        color: textColor ?? Colors.white,
        size: 14,
      ),
      label: CustomText(text, size: 14, color: textColor ?? Colors.white),
    );
  }
}
