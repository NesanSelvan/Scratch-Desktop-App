import 'package:annai_store/core/constants/constants.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

import '../../../models/persons/employee/employee.dart';
import '../../../models/voucher/voucher.dart';
import '../../../utils/null/null.dart';
import '../../../utils/search/search.dart';
import '../../billing/sales/sales.dart';

class VoucherController extends GetxController {
  // final voucherDB = Database().voucherDB;
  TextEditingController voucherNoController = TextEditingController();
  final givenAmountController = TextEditingController();
  final descriptionController = TextEditingController();
  final paymentIdController = TextEditingController();
  final employeeController = TextEditingController();

  final FocusNode descriptionNode = FocusNode();
  final FocusNode employeeNode = FocusNode();
  final FocusNode givenAMount = FocusNode();
  final FocusNode paymentMethodNode = FocusNode();
  final FocusNode paymentIDNode = FocusNode();

  String selectedPaymentMethod = paymentMethod[0];

  EmployeeModel? selectedEmployeeModel;

  void setSelectedPaymentMethod(String data) {
    selectedPaymentMethod = data;
    update();
  }

  DateTime pickedDateTime = getTodaysDate();

  void setPickedDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      pickedDateTime = dateTime;
    }
    update();
  }

  void keyboardSelectEmployeeModel() {
    final text = employeeController.text;
    debugPrint('text: $text');
    final productList =
        SearchUtility.customSearch<EmployeeModel>(text, employeeList ?? []);

    /**
     * If the Selected Prdouct Model is Empty
     */
    if (selectedEmployeeModel == null) {
      selectedEmployeeModel = productList[0];
    } else {
      if (productList.contains(selectedEmployeeModel)) {
        final index = productList.indexOf(selectedEmployeeModel!);
        if (index + 1 == productList.length) {
          selectedEmployeeModel = productList[0];
        } else {
          selectedEmployeeModel = productList[index + 1];
        }
      } else {
        selectedEmployeeModel = productList[0];
      }
    }
    update();
    debugPrint('_selectedProductModel: $selectedEmployeeModel');
  }

  void performInit() {
    final allVouchers = voucherDB.getAllVoucher();
    setVouchersModelList = allVouchers;
    if (allVouchers.isNotEmpty) {
      setSelectedVoucherModel = allVouchers[0];
    }
    final allEmployees = employeeDB.getAllEmployee();
    setEmployeesModelList = allEmployees;
    voucherNoController = TextEditingController(
      text: getBillNo(allVouchers.map((e) => e.voucherNo).toList()),
    );

    update();
  }

  @override
  void onInit() {
    super.onInit();
    performInit();
  }

  void resetInputField() {
    selectedEmployeeModel = null;
    employeeController.clear();
    descriptionController.clear();
    paymentIdController.clear();
    givenAmountController.clear();
    performInit();
    update();
  }

  Future clearAllVouchers() async {
    return voucherDB.clearAll();
  }

  VoucherModel? _selectedVoucherModel;
  VoucherModel? get selectedVoucherModel => _selectedVoucherModel;

  // ignore: avoid_setters_without_getters
  set setSelectedVoucherModel(VoucherModel voucherModel) {
    _selectedVoucherModel = voucherModel;
    update();
  }

  List<VoucherModel>? _vouchersList;
  List<VoucherModel>? get vouchersList => _vouchersList;
  // ignore: avoid_setters_without_getters
  set setVouchersModelList(List<VoucherModel> voucherModel) {
    _vouchersList = voucherModel;
    update();
  }

  List<EmployeeModel>? _employeesList;
  List<EmployeeModel>? get employeeList => _employeesList;
  // ignore: avoid_setters_without_getters
  set setEmployeesModelList(List<EmployeeModel> employeeModel) {
    _employeesList = employeeModel;
    update();
  }

  void updateSelectedVoucherModel() {
    int index = _vouchersList!.indexOf(selectedVoucherModel!);
    if (index == (_vouchersList!.length - 1)) {
      index = 0;
    } else {
      index++;
    }
    setSelectedVoucherModel = _vouchersList![index];
    debugPrint("Selected Voucher NO: ${selectedVoucherModel!.voucherNo}");
  }

  void updateUpSelectedVoucherModel() {
    int index = _vouchersList!.indexOf(selectedVoucherModel!);
    if (index == 0) {
      index = _vouchersList!.length - 1;
    } else {
      index--;
    }
    setSelectedVoucherModel = _vouchersList![index];
    debugPrint("Selected Voucher NO: ${selectedVoucherModel!.voucherNo}");
  }

  DateTime startDateTime = DateTime.now();
  DateTime endDateTime = DateTime.now().add(const Duration(days: 2));

  void setPickedStartDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      startDateTime = dateTime;
    }
    update();
  }

  void setPickedEndDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      endDateTime = dateTime;
    }
    update();
  }

  void searchVoucher() {
    final allVoucher = voucherDB.getAllVoucher();
    allVoucher.where((element) => element.createdAt == startDateTime);
  }

  Future<void> addVoucherData() async {
    try {
      final givenAmount = double.parse(givenAmountController.text);
      final rm = VoucherModel(
        id: const Uuid().v4(),
        givenTo: selectedEmployeeModel ??
            NullCheckUtilities.getDummyEmployee(
              employeeName: employeeController.text,
            ),
        voucherNo: voucherNoController.text,
        givenAmount: givenAmount,
        paymentMethod: selectedPaymentMethod,
        paymentId: paymentIdController.text,
        createdAt: pickedDateTime,
        description: descriptionController.text,
      );
      await voucherDB.addVoucherToDb(rm);
      performInit();
      setPickedDateTime(getTodaysDate());
    } catch (e) {
      CustomUtilies.customFailureSnackBar("Error", "$e");
    }
  }

  Future<void> deleteVoucher(VoucherModel voucherModel) async {
    await voucherDB.deleteVoucher(voucherModel);
  }
}
