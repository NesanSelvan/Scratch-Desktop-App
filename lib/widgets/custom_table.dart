import 'dart:io';

import 'package:annai_store/screens/viewer/image_viewer.dart';
import 'package:custom/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTableElement extends StatelessWidget {
  final String text;
  final double width;
  final Alignment? alignment;
  const CustomTableElement({
    Key? key,
    required this.text,
    required this.width,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CustomText(
          text,
          size: 12,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}

class CustomTableImageElement extends StatelessWidget {
  final List<String> imagesList;
  final double width;
  const CustomTableImageElement({
    Key? key,
    required this.imagesList,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 65,
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: imagesList.isEmpty
            ? const CustomText("No Image to Display")
            : InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ImageViewer(image: imagesList.first),
                    ),
                  );
                },
                child: Image.file(File(imagesList.first)),
              ),
      ),
    );
  }
}

class CustomTableIconElement extends StatelessWidget {
  final IconData iconData;
  final double width;

  const CustomTableIconElement({
    Key? key,
    required this.iconData,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CustomIcon(
          iconData,
          size: 16,
          color: Colors.red[800],
        ),
      ),
    );
  }
}

class CustomTableHeaderElement extends StatelessWidget {
  final String text;
  final double width;
  const CustomTableHeaderElement({
    Key? key,
    required this.text,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CustomText(
          text,
          size: 12,
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
