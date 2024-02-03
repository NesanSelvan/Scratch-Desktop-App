import '../../enum/application.dart';
import '../folder/folder.dart';

// ignore: avoid_classes_with_only_static_members
class FileUtility {
  static String getAppsFileName() {
    if (Application.currentApplication == ApplicationEnum.AnnaiStore) {
      return "annai_store";
    } else if (Application.currentApplication == ApplicationEnum.AnnaiTraders) {
      return "annai_traders";
    } else if (Application.currentApplication == ApplicationEnum.Pairav) {
      return "pairav";
    }
    return "scratch";
  }

  static String getGithubExeName() {
    if (Application.currentApplication == ApplicationEnum.AnnaiStore) {
      return "annai-store";
    } else if (Application.currentApplication == ApplicationEnum.AnnaiTraders) {
      return "annai-traders";
    } else if (Application.currentApplication == ApplicationEnum.Pairav) {
      return "pairav";
    }
    return "scratch";
  }

  static String getDBFileName() {
    final fileName = getAppsFileName();
    return "$fileName.json";
  }

  static String getFullDBFilePath() {
    final folderPath = FolderUtility.getDBFolderLocation();
    return "$folderPath\\${getDBFileName()}";
  }
}
