import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserResponseUtility {
  static void show(BuildContext context, String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
      ),
      backgroundColor: color,
    ));
  }

  static void showError(BuildContext context, String text) {
    show(context, text, Colors.red[400]!);
  }

  static void showSuccess(BuildContext context, String text) {
    show(context, text, Colors.green[400]!);
  }
}
