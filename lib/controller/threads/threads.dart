import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../enum/keyboard.dart';
import '../../models/company/company.dart';
import '../../models/threads/company/thread_company.dart';
import '../../models/threads/product/thread_product.dart';
import '../../models/threads/threads.dart';
import '../../utils/keyboard/keyboard.dart';
import '../billing/sales/sales.dart';

class ThreadController extends GetxController {
  final threadsController = TextEditingController();
  final companyController = TextEditingController();
  final productController = TextEditingController();

  final threadFocus = FocusNode();
  final companyNode = FocusNode();
  final companyKeyboardNode = FocusNode();
  final productNode = FocusNode();
  final productKeyboardNode = FocusNode();

  CompanyModel? _selectedCompanyModel;
  CompanyModel? get selectedCompanyModel => _selectedCompanyModel;
  List<CompanyModel> companyList = companyDB.getAllCompany();

  set setSelectedCompanyModel(CompanyModel? companyModel) {
    _selectedCompanyModel = companyModel;
    debugPrint("Selected Company : $selectedCompanyModel");
    if (companyModel != null) {
      addProductList(productDB.getProductsByCompany(_selectedCompanyModel!.id));
    } else {
      addProductList([]);
    }
    update();
  }

  List<ProductModel> productList = [];
  void addProductList(List<ProductModel> list) {
    debugPrint("Selected Company : $list");
    productList = list;
    update();
  }

  ProductModel? _selectedProductModel;
  ProductModel? get selectedProductModel => _selectedProductModel;
  set setSelectedProductModel(ProductModel? value) {
    _selectedProductModel = value;
    update();
  }

  bool _isAddClicked = true;
  bool get isAddClicked => _isAddClicked;
  set setIsAddClicked(bool val) {
    _isAddClicked = val;
    setSelectedThreadModel = null;
    update();
  }

  void deleteThreadCompanyModel(ThreadCompanyModel e) {
    threadCompanyDB.deleteThreadCompany(e);
    performInit();

    update();
  }

  void keyboardSelectProductModel(KeyboardEventEnum keyboardEventEnum) {
    // companyList = companyDB.getAllCompany();
    final text = productController.text;
    setSelectedProductModel = KeyboardUtilities.keyboardSelectProductModel(
      text,
      productList,
      _selectedProductModel,
      keyboardEventEnum,
    );
    update();
  }

  void keyboardSelectCompanyModel(KeyboardEventEnum keyboardEventEnum) {
    // companyList = companyDB.getAllCompany();
    final text = companyController.text;
    setSelectedCompanyModel = KeyboardUtilities.keyboardSelectCompanyModel(
      text,
      companyList,
      _selectedCompanyModel,
      keyboardEventEnum,
    );
    update();
  }

  @override
  void performInit() {
    _threadsCompanyList = threadCompanyDB.getAllThreadCompanys();
    update();
  }

  Future<void> addThreadCompanyToDB() async {
    if (selectedCompanyModel == null) {
      CustomUtilies.customFailureSnackBar("error", "Pleasem Select a Company");
      return;
    } else if (selectedProductModel == null) {
      CustomUtilies.customFailureSnackBar("error", "Pleasem Select a Product");
      return;
    }
    final threadsFromControllerList = threadsController.text.split(" ");

    final existsData =
        threadCompanyDB.getThreadCompanyModelByCompanyAndProductId(
      selectedCompanyModel!.id,
      selectedProductModel!.id,
    );
    debugPrint("Exists Thread Model : $existsData");
    debugPrint(
      "Exists Thread Model : ${threadCompanyDB.getAllThreadCompanys()}",
    );
    debugPrint("Exists Company Model ID: ${selectedCompanyModel!.id}");
    debugPrint("Exists Product Model ID: ${selectedProductModel!.id}");
    if (existsData == null) {
      final List<ThreadsModel> threadModelList = [];
      for (final item in threadsFromControllerList) {
        final threadStr = item.trim();
        if (threadStr != "") {
          final list =
              threadModelList.where((element) => element.number == threadStr);
          if (list.isEmpty) {
            threadModelList.add(
              ThreadsModel(
                number: threadStr,
                stock: 1,
                createdAt: DateTime.now(),
              ),
            );
          }
        }
      }
      final threadProduct = ThreadProductModel(
        id: const Uuid().v4(),
        product: selectedProductModel!,
        threads: threadModelList,
        createdAt: DateTime.now(),
      );
      final threadModel = ThreadCompanyModel(
        id: const Uuid().v4(),
        companyModel: selectedCompanyModel!,
        createdAt: DateTime.now(),
        threadProduct: threadProduct,
      );
      debugPrint("Thread Model : $threadModel");
      await threadCompanyDB.addThreadCompanyToDb(threadModel);
      CustomUtilies.customSuccessSnackBar("Success", "Added Successfully");
    } else {
      await updateThread(existsData, threadsFromControllerList);
    }

    performInit();
  }

  Future<void> updateThread(ThreadCompanyModel existsData,
      List<String> threadsFromControllerList) async {
    final List<ThreadsModel> newThreads = [];
    debugPrint("Extsting Data : $existsData");
    for (final item in existsData.threadProduct.threads) {
      final list =
          newThreads.where((element) => item.number == element.number).toList();
      if (list.isEmpty) {
        newThreads.add(item);
      }
    }
    for (final item in threadsFromControllerList) {
      if (item != "") {
        final list =
            newThreads.where((element) => item == element.number).toList();
        if (list.isEmpty) {
          newThreads.add(
            ThreadsModel(number: item, stock: 0, createdAt: DateTime.now()),
          );
        }
      }
    }
    await threadCompanyDB.updateThreadCompany(
      existsData.copyWith(
        threadProduct: existsData.threadProduct.copyWith(threads: newThreads),
      ),
    );
    CustomUtilies.customSuccessSnackBar("Success", "Updated Successfully");
  }

  List<ThreadCompanyModel> _threadsCompanyList = [];
  List<ThreadCompanyModel> get threadsCompanyList => _threadsCompanyList;

  ThreadCompanyModel? _selectedThreadsCompanyModel;
  ThreadCompanyModel? get selectedThreadsCompanyModel =>
      _selectedThreadsCompanyModel;

  set setSelectedThreadModel(ThreadCompanyModel? value) {
    _selectedThreadsCompanyModel = value;
    _threadStock.clear();
    update();
  }

  final List<ThreadsModel> _threadStock = [];
  List<ThreadsModel> get threadStock => _threadStock;

  void onTextFieldUpdated(String box, ThreadsModel threadsModel) {
    try {
      final stock = int.parse(box.split('').reversed.join());
      final list = _threadStock
          .where((element) => element.number == threadsModel.number)
          .toList();
      final updatedThread = threadsModel.copyWith(stock: stock);
      if (list.isEmpty) {
        _threadStock.add(updatedThread);
      } else {
        final index = _threadStock.indexOf(list.first);
        _threadStock[index] = updatedThread;
      }
      debugPrint("************** Threads List *************");
      debugPrint("$_threadStock");
      debugPrint("******************************************");
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error", "$e");
    }
    update();
  }

  Future<void> saveThreads() async {
    debugPrint("updatedThread : $_threadStock");
    if (_selectedThreadsCompanyModel != null) {
      final List<ThreadsModel> updatedThread = [];
      final threadProduct =
          _selectedThreadsCompanyModel!.threadProduct.copyWith();
      for (final thread in threadProduct.threads) {
        final updatedThreadList =
            _threadStock.where((ele) => ele.number == thread.number).toList();
        if (updatedThreadList.isEmpty) {
          updatedThread.add(thread);
        } else {
          updatedThread.add(thread.copyWith(stock: updatedThreadList[0].stock));
        }
      }
      await threadCompanyDB.updateThreadCompany(
        _selectedThreadsCompanyModel!.copyWith(
          threadProduct: _selectedThreadsCompanyModel!.threadProduct
              .copyWith(threads: updatedThread),
        ),
      );
      setSelectedThreadModel = threadCompanyDB
          .getThreadCompanyModelById(_selectedThreadsCompanyModel!.id);
      debugPrint("updatedThread : $updatedThread");
      _threadStock.clear();
      update();
    }
  }
}
