import 'dart:io';

import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String image;

  const ImageViewer({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          width: CustomScreenUtility(context).width * 0.6,
          height: CustomScreenUtility(context).height * 0.6,
          child: Image.file(File(image))),
    );
  }
}
