import 'dart:io';

import 'package:filepicker_windows/filepicker_windows.dart';

import '../folder/folder.dart';

// ignore: avoid_classes_with_only_static_members
class ImageUtilities {
  static String saveImagePath =
      "${FolderUtility.getDBFolderLocation()}\\images\\";

  static Future<File> moveImageToSafeDir(String imagePath) async {
    if (!(await Directory(saveImagePath).exists())) {
      await Directory(saveImagePath).create();
    }
    final filesList = Directory(saveImagePath).listSync();
    print(filesList);
    print(imagePath.split(r"\").last);

    return File(imagePath).copy(
      "$saveImagePath${filesList.length}.${imagePath.split(r"\").last.split(".").last}",
    );
  }

  static Future<List<String>> moveImagesToSafeDir(
      List<String> imagePaths) async {
    final List<String> updatedImagesList = [];
    for (final item in imagePaths) {
      final file = await ImageUtilities.moveImageToSafeDir(item);
      updatedImagesList.add(file.path);
    }
    return updatedImagesList;
  }

  static File? openFilePicker() {
    final file = OpenFilePicker()
      ..filterSpecification = {
        'Images (*.jpg;*.jpeg;*.png)': '*.jpg;*.jpeg;*.png',
        'All Files': '*.*'
      }
      ..defaultFilterIndex = 0
      ..defaultExtension = 'png'
      ..title = 'Select a Image';

    return file.getFile();
  }

  // static File? openFilePicker() {
  //   final file = OpenFilePicker();

  //   return file.getFile();
  // }
}
