import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../models/bank/bank.dart';
import '../../models/company/company.dart';
import '../billing/sales/sales.dart';

class PersonalCompany extends GetxController {
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
  final FocusNode ifscKeyboardFocus = FocusNode();
  final FocusNode mobileKeyboardFocus = FocusNode();

  List<String> mobileNoList = [];
  List<BankModel> bankModelList = [];

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
          address: addressController.text,
          placeOfDispatch: placeOfDispatchController.text,
          pan: panController.text,
          mobileNoList: mobileNoList.map((e) => e).toList().join(","),
          gstin: gstinController.text,
          createdAt: DateTime.now(),
        ),
      );
      CustomUtilies.customSuccessSnackBar("Success", "Company Added");
    } catch (e) {
      debugPrint('Error : $e');
      CustomUtilies.customFailureSnackBar("Error in Adding Company", "$e");
    }
  }

  CompanyModel? currentCompanyModel;

  Future<void> updateCompany() async {
    addMobileNo();
    if (currentCompanyModel == null) {
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

      final cm = CompanyModel(
        id: currentCompanyModel!.id,
        bankId: bankModelList.map((e) => e.id).toList().join(","),
        email: emailController.text,
        name: nameController.text,
        website: websiteController.text,
        licNO: licNoController.text,
        address: addressController.text,
        placeOfDispatch: placeOfDispatchController.text,
        pan: panController.text,
        mobileNoList: mobileNoList.map((e) => e).toList().join(","),
        gstin: gstinController.text,
        createdAt: DateTime.now(),
      );
      await companyDB.updateCompany(cm);
    }
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
}
