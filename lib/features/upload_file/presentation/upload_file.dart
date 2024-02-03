import 'package:flutter/material.dart';

class UploadFileButton extends StatelessWidget {
  const UploadFileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {},
      child: const Text("Upload data to server"),
    );
  }
}
