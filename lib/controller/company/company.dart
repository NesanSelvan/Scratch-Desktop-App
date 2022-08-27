import 'package:annai_store/core/db/db.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../models/bank/bank.dart';
import '../../models/company/company.dart';
import '../../models/failure/failure.dart';
import '../billing/sales/sales.dart';

class CompanyController extends GetxController {
  List<CompanyModel> companyModelList = Database().companyDB.getAllCompany();
  final nameController = TextEditingController();
  final mobileNoController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final placeOfDispatchController = TextEditingController();
  final gstinController = TextEditingController();
  final panController = TextEditingController();
  final websiteController = TextEditingController();
  final licNoController = TextEditingController();
  final bankNameController = TextEditingController();
  final branchController = TextEditingController();
  final accNoController = TextEditingController();
  final accHolderNameController = TextEditingController();
  final ifscCodeController = TextEditingController();
  final searchController = TextEditingController();

  final FocusNode nameNode = FocusNode();
  final FocusNode mobileNoNode = FocusNode();
  final FocusNode addressNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode placeOfDispatchNode = FocusNode();
  final FocusNode gstinNode = FocusNode();
  final FocusNode panNode = FocusNode();
  final FocusNode webNode = FocusNode();
  final FocusNode licNode = FocusNode();
  final FocusNode bankNameNode = FocusNode();
  final FocusNode branchNode = FocusNode();
  final FocusNode accNoNode = FocusNode();
  final FocusNode accHolderNode = FocusNode();
  final FocusNode ifscCodeNode = FocusNode();

  List<String> mobileNoList = [];
  List<BankModel> bankModelList = [];

  bool _isNormalBill = true;
  bool get isNormalBill => _isNormalBill;
  set isNormalBill(bool? value) {
    if (value == null) {
      _isNormalBill = false;
      return;
    }
    _isNormalBill = value;
    update();
  }

  BankModel? _selectedBankModel;
  BankModel? get selectedBankModel => _selectedBankModel;
  set setSelectedBankModel(BankModel? bankModel) {
    _selectedBankModel = bankModel;
    if (bankModel != null) {
      bankNameController.text = bankModel.bankName;
      branchController.text = bankModel.branch ?? "";
      accNoController.text = bankModel.accountNo;
      accHolderNameController.text = bankModel.bankHolderName;
      ifscCodeController.text = bankModel.ifscCode;
    } else {
      clearBankTextField();
    }
    update();
  }

  @override
  void onInit() {
    Database().initialize();
    getAllCompany();
    super.onInit();
  }

  void getAllCompany() {
    Database().initialize();
    companyModelList = Database().companyDB.getAllCompany();
    debugPrint("Getting All Company : $companyModelList");
    update();
  }

  Future addBank() async {
    debugPrint("Mobile List : $mobileNoList");
    if (accNoController.text != "" ||
        branchController.text != "" ||
        accHolderNameController.text != "" ||
        ifscCodeController.text != "" ||
        bankNameController.text != "") {
      final bank = BankModel(
        id: const Uuid().v1(),
        accountNo: accNoController.text,
        branch: branchController.text,
        bankHolderName: accHolderNameController.text,
        ifscCode: ifscCodeController.text,
        bankName: bankNameController.text,
        createdAt: DateTime.now(),
      );
      final matchedData = bankModelList
          .where(
            (element) =>
                element.bankName == bank.bankName &&
                element.accountNo == bank.accountNo &&
                element.bankHolderName == bank.bankHolderName &&
                element.branch == bank.branch,
          )
          .toList();
      if (matchedData.isEmpty) {
        bankModelList.add(bank);
        clearBankTextField();
        bankNameNode.requestFocus();
      } else {
        final index = bankModelList.indexOf(matchedData[0]);
        bankModelList[index] = bank;
      }
    }
    update();
  }

  void updateBank() {
    final index = bankModelList.indexOf(_selectedBankModel!);
    if (index != -1) {
      bankModelList[index] = BankModel(
        id: _selectedBankModel!.id,
        accountNo: accNoController.text,
        branch: branchController.text,
        bankHolderName: accHolderNameController.text,
        ifscCode: ifscCodeController.text,
        bankName: bankNameController.text,
        createdAt: DateTime.now(),
      );

      clearBankTextField();
    }
    update();
  }

  void clearBankTextField() {
    bankNameController.clear();
    branchController.clear();
    accHolderNameController.clear();
    accNoController.clear();
    ifscCodeController.clear();
  }

  void addMobileNo() {
    try {
      // int.parse(mobileNoController.text);
      if (mobileNoController.text != "") {
        mobileNoList.add(mobileNoController.text);

        mobileNoController.clear();
      }
      update();
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error", "$e");
    }
  }

  Future<void> addCompany() async {
    try {
      addMobileNo();
      final List<String> id = [];
      for (final bank in bankModelList) {
        final bankId = await bankDB.checkAndAddBank(bank);
        id.add(bankId);
      }
      await companyDB.addCompanyToDb(
        CompanyModel(
          id: const Uuid().v1(),
          bankId: id.join(","),
          email: emailController.text,
          name: nameController.text,
          website: websiteController.text,
          licNO: licNoController.text,
          isNormalPurchaseBill: isNormalBill,
          address: addressController.text,
          placeOfDispatch: placeOfDispatchController.text,
          pan: panController.text,
          mobileNoList: mobileNoList.map((e) => e).toList().join(","),
          gstin: gstinController.text,
          createdAt: DateTime.now(),
        ),
      );
      CustomUtilies.customSuccessSnackBar("Success", "Company Added");
      clearTextField();
      getAllCompany();
    } catch (e) {
      debugPrint('Error : $e');
      CustomUtilies.customFailureSnackBar("Error in Adding Company", "$e");
    }
  }

  CompanyModel? selectedCompanyModel;

  void setSelectedCompanyModel(CompanyModel? companyModel) {
    selectedCompanyModel = companyModel;
    update();
  }

  Failure? failure;

  Future<void> deleteCompany() async {
    if (selectedCompanyModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Delete Unsuccessfull",
        "Please Select a Company to Delete",
      );
    } else {
      if (await deleteSelectedCompany()) {
        CustomUtilies.customSuccessSnackBar(
          "Delete SuccessFull",
          "Company Deleted Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Delete Unsuccessfull", "$failure");
      }
    }
  }

  Future<bool> deleteSelectedCompany() async {
    try {
      await companyDB.deleteCompany(selectedCompanyModel!);
      getAllCompany();
      selectedCompanyModel = null;
      clearTextField();
      return true;
    } catch (e) {
      failure = Failure("$e");
      update();
      return false;
    }
  }

  Future<void> updateCompany() async {
    addMobileNo();
    if (selectedCompanyModel == null) {
      CustomUtilies.customFailureSnackBar(
        "Update Unsuccessfull",
        "Please Select a Company to Update",
      );
    } else {
      for (final item in bankModelList) {
        final bank = bankDB.getBankModelById(item.id);
        if (bank == null) {
          await bankDB.checkAndAddBank(item);
        } else {
          await bankDB.updateBank(item);
        }
      }

      if (await updateSelectedCompany(
        CompanyModel(
          id: selectedCompanyModel!.id,
          bankId: bankModelList.map((e) => e.id).toList().join(","),
          email: emailController.text,
          name: nameController.text,
          website: websiteController.text,
          licNO: licNoController.text,
          address: addressController.text,
          placeOfDispatch: placeOfDispatchController.text,
          pan: panController.text,
          isNormalPurchaseBill: isNormalBill,
          mobileNoList: mobileNoList.map((e) => e).toList().join(","),
          gstin: gstinController.text,
          createdAt: DateTime.now(),
        ),
      )) {
        CustomUtilies.customSuccessSnackBar(
          "Update SuccessFull",
          "Company Deleted Successfully",
        );
      } else {
        CustomUtilies.customFailureSnackBar("Update Unsuccessfull", "$failure");
      }
      clearTextField();
    }
  }

  Future<bool> updateSelectedCompany(CompanyModel companyModel) async {
    try {
      final datas = companyModelList
          .where((element) => element.id == companyModel.id)
          .toList();
      if (datas.isEmpty) {
        failure = Failure("No Company Match");
        update();
        return false;
      }
      debugPrint("Updated Selected Company : $companyModel");
      await companyDB.updateCompany(companyModel);
      getAllCompany();
      selectedCompanyModel = null;
      return true;
    } catch (e) {
      failure = Failure("$e");
      return false;
    }
  }

  List<CompanyModel> searchedCompanyModel = [];

  void searchCompany(String text) {
    searchedCompanyModel.clear();
    final datas = companyModelList.where((element) {
      return element.mobileNoList
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) ||
          element.name.toString().toLowerCase().contains(text.toLowerCase()) ||
          element.placeOfDispatch
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) ||
          element.pan.toString().toLowerCase().contains(text.toLowerCase()) ||
          element.gstin.toString().toLowerCase().contains(text.toLowerCase()) ||
          element.address.toLowerCase().contains(text.toLowerCase());
    }).toList();
    searchedCompanyModel = datas;
    update();
  }

  void clearTextField() {
    bankModelList.clear();
    nameController.clear();
    mobileNoController.clear();
    addressController.clear();
    placeOfDispatchController.clear();
    gstinController.clear();
    panController.clear();
    searchController.clear();
    emailController.clear();
    mobileNoList.clear();
    bankNameController.clear();
    accNoController.clear();
    branchController.clear();
    accHolderNameController.clear();
    ifscCodeController.clear();
    websiteController.clear();
    licNoController.clear();
    _selectedBankModel = null;
    nameNode.requestFocus();
    update();
  }

  void onCompanyTap(CompanyModel e) {
    setSelectedCompanyModel(e);
    bankModelList.clear();
    mobileNoList.clear();
    debugPrint("E : $e");
    nameController.text = e.name.toString();
    if (e.mobileNoList != "") {
      mobileNoList = e.mobileNoList.split(",").toList();
    }

    // bankModelList = e.bankId!.split(",").toList();
    emailController.text = e.email ?? "";

    addressController.text = e.address.toString();
    placeOfDispatchController.text = e.placeOfDispatch.toString();
    gstinController.text = e.gstin.toString();
    panController.text = e.pan.toString();
    licNoController.text = e.licNO ?? "";
    websiteController.text = e.website ?? "";
    isNormalBill = e.isNormalPurchaseBill ?? true;

    debugPrint("Bank ID List : ${e.bankId!.split(",").toList()}");
    for (final id in e.bankId!.split(",").toList()) {
      final bank = bankDB.getBankModelById(id);
      debugPrint("Bank ID List : $bank");
      if (bank != null) {
        // bankNameController.text = bank.bankName;
        // branchController.text = bank.branch ?? "";
        // accNoController.text = bank.accountNo;
        // accHolderNameController.text = bank.bankHolderName;
        // ifscCodeController.text = bank.ifscCode;
        bankModelList.add(bank);
      }
    }
  }

  void handleKeyDown() {
    if (selectedCompanyModel == null) {
      onCompanyTap(companyModelList.first);
    } else {
      if (selectedCompanyModel == companyModelList.last) {
        onCompanyTap(companyModelList.first);
      } else {
        onCompanyTap(
          companyModelList[companyModelList.indexOf(selectedCompanyModel!) + 1],
        );
      }
    }
  }

  void handleKeyUp() {
    if (selectedCompanyModel == null) {
      onCompanyTap(companyModelList.first);
    } else {
      if (selectedCompanyModel == companyModelList.first) {
        onCompanyTap(companyModelList.last);
      } else {
        onCompanyTap(
          companyModelList[companyModelList.indexOf(selectedCompanyModel!) - 1],
        );
      }
    }
  }

  List<LogicalKeyboardKey> clickedKeys = [];

  void updateKeys(LogicalKeyboardKey logicalKeyboardKey) {
    if (!clickedKeys.contains(logicalKeyboardKey)) {
      clickedKeys.add(logicalKeyboardKey);
    }
  }

  void performKeyboardClickedAction() {
    // if (clickedKeys[0] == LogicalKeyboardKey.arrowDown) {
    //   handleKeyDown();
    // } else if (clickedKeys[0] == LogicalKeyboardKey.arrowUp) {
    //   debugPrint('Up key ');
    //   handleKeyUp();
    // } else
    // if (clickedKeys[0] == LogicalKeyboardKey.delete) {
    //   // deleteCompany();
    //   CustomUtilies.customSnackBar("You cannot delete a Company", Colors.yellow,
    //       Colors.white, "You can Hide a Company", const Icon(Icons.delete));
    // } else
    if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyC)) {
      clearTextField();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyU)) {
      // updateCompany();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyR)) {
      getAllCompany();
    } else if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
        clickedKeys.contains(LogicalKeyboardKey.keyA)) {
      addCompany();
    }
    clickedKeys.clear();
  }
}
