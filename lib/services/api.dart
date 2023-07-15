import 'dart:convert';
import 'dart:io';

import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/file/file.dart';

class API {
  Future<void> sendMyDBFile({String? url}) async {
    final dbFile = File(FileUtility.getFullDBFilePath());
    final fileData = await dbFile.readAsString();
    // debugPrint(fileData);
    final req = await http.post(
      Uri(
        scheme: url == null ? "http" : "https",
        host: url ?? "localhost",
        port: url == null ? localhostPort : null,
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"name": "Agnel Selvan", "fileData": fileData}),
    );

    CustomUtilies.customSnackBar(
      req.body,
      Colors.yellow,
      Colors.grey[500]!,
      "Data Sent",
      const Icon(Icons.check),
    );
  }
}
