import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/models/paths/paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class PathController extends GetxController {
  List<PathsModel> _allPaths = [];
  List<PathsModel> get allPaths => _allPaths;

  TextEditingController pathsController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  late PathsModel _selectedPathModel;
  PathsModel get selectedPathModel => _selectedPathModel;

  Future<void> performInit() async {
    await addIfNotExists();
    setAllPaths(pathsDB.getAllPath());
  }

  String? _upiImage;
  String? get upiImage => _upiImage;
  set setImageInImagesList(String? data) {
    _upiImage = data;
    update();
  }

  @override
  void onInit() {
    performInit();
  }

  set setSelectedPathsModel(PathsModel data) {
    _selectedPathModel = data;
    pathsController.text = data.path;
    // update();
  }

  void setAllPaths(List<PathsModel> data) {
    _allPaths = data;
    try {
      update();
    } catch (e) {}
  }

  Future<void> updatePathModel() async {
    await pathsDB
        .updatePath(_selectedPathModel.copyWith(path: pathsController.text));
    performInit();
  }

  Future addPathModel() async {
    await pathsDB.addPathToDb(
      PathsModel(
        id: const Uuid().v4(),
        name: nameController.text,
        path: pathsController.text,
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<void> addIfNotExists() async {
    print("Chrome Path: ${pathsDB.getChromePath()}");
    if (pathsDB.getChromePath() == null) {
      await pathsDB.addChromePathToDB();
    } else if (pathsDB.getExcelPath() == null) {
      await pathsDB.addExcelPathToDB();
    } else if (pathsDB.getNormalPrinterPath() == null) {
      await pathsDB.addNormalPathToDB();
    } else if (pathsDB.getThermalPrinterPath() == null) {
      await pathsDB.addThermalPrinterPathToDB();
    }
    // final allPaths = pathsDB.getAllPath();
    // debugPrint("Path not exists:M ${allPaths.length}");
    // if (allPaths.isEmpty) {
    //   await pathsDB.addExcelPathToDB();
    // } else {
    //   bool isExcelPathExists = false;
    //   bool isChromePathExists = false;
    //   for (final item in allPaths) {
    //     if (item.name == "excel") {
    //       isExcelPathExists = true;
    //     } else if (item.name == "chrome") {
    //       isChromePathExists = true;
    //     }
    //   }
    //   if (!isExcelPathExists || !isChromePathExists) {
    //     await pathsDB.addExcelPathToDB();
    //     await pathsDB.addChromePathToDB();
    //   }
    // }
    // debugPrint("Path not exists:M ${allPaths.length}");
  }
}
