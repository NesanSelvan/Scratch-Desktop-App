import 'dart:developer';
import 'dart:io';

import 'package:annai_store/core/util/network/api.dart';
import 'package:annai_store/core/util/network/network.dart';

abstract class UploadFileRemoteDataSource {
  Future<void> uploadFileToServer(File file);
  Future<Map<String, dynamic>> getFileFromServer(String filePath);
}

class UploadFileRemoteDataSourceImpl extends UploadFileRemoteDataSource {
  final NetworkHandler networkHandler;

  UploadFileRemoteDataSourceImpl({required this.networkHandler});
  @override
  Future<void> uploadFileToServer(File file) async {
    try {
      final response =
          await networkHandler.uploadFile(AppAPI.uploadEndpoint, file);
      log("response: ${response.body}");
      if (response.statusCode != 200) {
        throw "Upload File failed";
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getFileFromServer(String filePath) async {
    try {
      final response = await networkHandler.postStream(
        AppAPI.getFileEndpoint,
        body: {
          "fileName": filePath,
        },
      );
      if (response.statusCode != 200) {
        throw "Get File from failed";
      }
      return response.data as Map<String, dynamic>;
      // return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
