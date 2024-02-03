import 'dart:developer';
import 'dart:io';

import 'package:annai_store/core/util/network/api.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  Future<http.Response> get(String endpoint) async {
    try {
      final resonse = await http.get(Uri.parse("${AppAPI.baseUrl}$endpoint"));
      return resonse;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> post(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final resonse = await http.post(
        Uri.parse("${AppAPI.baseUrl}$endpoint"),
        body: body,
      );
      return resonse;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postStream(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final url = Uri.parse("${AppAPI.baseUrl}$endpoint");
      print("Start request");
      final response = await Dio().post(
        url.toString(),
        data: body,
      );
      print("Final $body");
      print("status code: ${response.statusCode}");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> uploadFile(
    String endpoint,
    File file, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final uri = Uri.parse("${AppAPI.baseUrl}$endpoint");
      final request = http.MultipartRequest('POST', uri)
        ..files.add(
          await http.MultipartFile.fromPath(
            "file",
            file.path,
          ),
        );
      final response = await request.send();
      log(uri.toString());
      return http.Response.fromStream(response);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
