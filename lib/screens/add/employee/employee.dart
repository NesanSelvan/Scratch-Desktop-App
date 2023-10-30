import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:validators/validators.dart';

import '../../../controller/employee/employee.dart';
import '../../../enum/customer.dart';
import '../../../enum/person/person.dart';
import '../../../models/persons/employee/employee.dart';
import '../../../utils/utility.dart';
import '../../../widgets/custom_table.dart';
import '../../../widgets/operation_buttons.dart';
import '../../../widgets/search_by.dart';
import '../../../widgets/text_field.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  _AddCustomerScreenState createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddEmployeeScreen> {
  final FocusNode _focusNode = FocusNode();
  final FocusNode _firstNode = FocusNode();
  EmployeeController employeeController = Get.put(EmployeeController());
  @override
  Widget build(BuildContext context) {
    employeeController.getAllEmployee();
    final node = FocusScope.of(context);
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);
        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            employeeController.updateKeys(data.logicalKey);
            if (!isKeyDown) {
              debugPrint('unitControllers ${employeeController.clickedKeys}');

              employeeController.performKeyboardClickedAction();
              debugPrint(
                'employeeController ${employeeController.clickedKeys}',
              );
            }
            break;
          default:
            throw Exception(
              'Unsupported platform ${rawKeyEvent.data.runtimeType}',
            );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: CustomScreenUtility(context).width,
          height: CustomScreenUtility(context).height,
          child: Column(
            children: [
              SizedBox(
                height: CustomScreenUtility(context).height * 0.07,
                child: const Center(
                  child: CustomText(
                    "Employee Management",
                    size: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  // color: Colors.red,
                  width: CustomScreenUtility(context).width * 0.8,
                  height: CustomScreenUtility(context).height * 0.13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SearchByText(),
                      const SizedBox(width: 20),
                      // DropdownButton<EmployeeEnum>(
                      //     value: searchCustomerEnum,
                      //     onChanged: (e) {
                      //       setState(() {
                      //         searchCustomerEnum = e!;
                      //       });
                      //     },
                      //     items: EmployeeEnum.values
                      //         .map((e) => DropdownMenuItem<EmployeeEnum>(
                      //             value: e,
                      //             child: CustomText(
                      //               unitEnumToStr(e),
                      //               size: 12,
                      //             )))
                      //         .toList()),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 50,
                        child: CustomTextField(
                          controller: employeeController.searchController,
                          label: "Search",
                          onChange: (String value) {
                            employeeController.searchEmployee(value);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GetBuilder<EmployeeController>(
                builder: (controller) {
                  return SizedBox(
                    height: CustomScreenUtility(context).height * 0.8,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            width: CustomScreenUtility(context).width * 0.2,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CustomText(
                                        "Menu",
                                        fontWeight: FontWeight.bold,
                                      ),
                                      IconButton(
                                        icon: const CustomIcon(
                                          Icons.refresh,
                                          color: kPrimaryColor,
                                        ),
                                        onPressed: controller.getAllEmployee,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    focusNode: _firstNode,
                                    controller: controller.nameController,
                                    autofocus: true,
                                    label: "Enter Name",
                                    textInputType: TextInputType.number,
                                    onEditingComplete: () {
                                      node.nextFocus();
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    controller: controller.emailController,
                                    label: "Enter Email",
                                    textInputType: TextInputType.number,
                                    onEditingComplete: () {
                                      node.nextFocus();
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    controller: controller.passwordController,
                                    label: "Enter Password",
                                    onEditingComplete: () {
                                      node.nextFocus();
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    controller: controller.mobileNoController,
                                    label: "Enter Mobile Number",
                                    onEditingComplete: () => node.nextFocus(),
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    controller: controller.addressController,
                                    label: "Enter Address",
                                    textInputType: TextInputType.number,
                                    onEditingComplete: () => node.nextFocus(),
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextField(
                                    controller: controller.pincodeController,
                                    label: "Enter Pincode",
                                    textInputType: TextInputType.number,
                                    onEditingComplete: () => node.nextFocus(),
                                  ),
                                  const SizedBox(height: 20),
                                  DropdownButton<PersonEnum>(
                                    value: controller.selectedPersonEnum,
                                    onChanged: (PersonEnum? personEnum) {
                                      if (personEnum != null) {
                                        controller
                                            .setSelectedPersonEnum(personEnum);
                                      }
                                    },
                                    items: PersonEnum.values
                                        .map(
                                          (e) => DropdownMenuItem<PersonEnum>(
                                            value: e,
                                            child: CustomText(
                                              getStrFromPersonEnum(e),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  const SizedBox(height: 20),
                                  const CustomText(
                                    "Select a State",
                                    size: 12,
                                  ),
                                  DropdownButton<String>(
                                    value: controller.selectedState,
                                    onChanged: (String? e) {
                                      controller.setState(e!);
                                      node.nextFocus();
                                    },
                                    items: stateList
                                        .map(
                                          (e) => DropdownMenuItem<String>(
                                            value: e,
                                            child: CustomText(
                                              e,
                                              size: 12,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  const SizedBox(height: 20),
                                  OperationButtons(
                                    onAdd: () {
                                      controller.addEmployee();
                                    },
                                    onClear: () async {
                                      controller.clearTextField();
                                      controller.setSelectedEmployeeModel(null);
                                      // final pdf = await rootBundle
                                      //     .load('assets/pdf/Agnel-Selvan.pdf');
                                      // await Printing.layoutPdf(
                                      //   onLayout: (_) =>
                                      //       pdf.buffer.asUint8List(),
                                      // );
                                    },
                                    onDelete: controller.deleteEmployee,
                                    onUpdate: controller.updateEmployee,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.grey[10],
                            width: CustomScreenUtility(context).width * 0.75,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  children: [
                                    Container(
                                      color: kLightPrimaryColor,
                                      child: Row(
                                        children: EmployeeEnum.values
                                            .map(
                                              (e) => CustomTableHeaderElement(
                                                width: CustomScreenUtility(
                                                      context,
                                                    ).width *
                                                    0.75 /
                                                    EmployeeEnum.values.length,
                                                text: employeeEnumToStr(e),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                    GetBuilder<EmployeeController>(
                                      builder: (controller) {
                                        return Column(
                                          children: controller
                                                  .employeeModelList.isEmpty
                                              ? [
                                                  const CustomText(
                                                    "No Employee Record Exists",
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    size: 14,
                                                  )
                                                ]
                                              : controller.searchedEmployeeModel
                                                      .isNotEmpty
                                                  ? controller
                                                      .searchedEmployeeModel
                                                      .map(
                                                        (e) => buildInkWell(
                                                          e,
                                                          controller,
                                                        ),
                                                      )
                                                      .toList()
                                                  : controller.employeeModelList
                                                      .map(
                                                        (e) => buildInkWell(
                                                          e,
                                                          controller,
                                                        ),
                                                      )
                                                      .toList(),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInkWell(EmployeeModel e, EmployeeController controller) {
    return InkWell(
      onTap: () {
        controller.onEmployeeTap(e);
      },
      child: Container(
        color: controller.selectedEmployeeModel == e
            ? Colors.grey[300]
            : controller.employeeModelList.indexOf(e) % 2 == 0
                ? Colors.white
                : Colors.grey[200],
        child: Row(
          children: [
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  EmployeeEnum.values.length,
              text: e.name.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  EmployeeEnum.values.length,
              text: e.email.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  EmployeeEnum.values.length,
              text: "${e.mobileNo}",
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  EmployeeEnum.values.length,
              text: e.address.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  EmployeeEnum.values.length,
              text: e.state.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  EmployeeEnum.values.length,
              text: e.pincode.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  EmployeeEnum.values.length,
              text: e.type,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  EmployeeEnum.values.length,
              // text: validate,
              text: getFormattedDateTime(e.createdAt ?? DateTime.now()),
            ),
          ],
        ),
      ),
    );
  }
}
