import 'dart:io';

import '../../enum/application.dart';

// ignore: avoid_classes_with_only_static_members
class FolderUtility {
  static String getAppsFolderName() {
    if (Application.currentApplication == ApplicationEnum.AnnaiStore) {
      return "AnnaiStore";
    } else if (Application.currentApplication == ApplicationEnum.AnnaiTraders) {
      return "AnnaiTraders";
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
}
