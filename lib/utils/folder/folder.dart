import 'dart:io';

import 'package:annai_store/enum/application.dart';
import 'package:file_picker/file_picker.dart';

// ignore: avoid_classes_with_only_static_members
class FolderUtility {
  static String getAppsFolderName() {
    if (Application.currentApplication == ApplicationEnum.AnnaiStore) {
      return "AnnaiStore";
    } else if (Application.currentApplication == ApplicationEnum.AnnaiTraders) {
      return "AnnaiTraders";
    } else if (Application.currentApplication == ApplicationEnum.Pairav) {
      return "Pairav";
    }
    return "Scratch";
  }

  static String getDBFolderLocation() {
    final folderPath = getAppsFolderName();
    return "${Application.dbLocationPath}\\$folderPath";
  }

  static void createDirIfNotExists(String newFolderPath) {
    Directory(newFolderPath).createSync();
  }

  static Future<String?> getFolderDirectoryPath() async {
    return FilePicker.platform.getDirectoryPath();
  }
}
