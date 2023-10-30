import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:validators/validators.dart';

import '../../../controller/billing/sales/sales.dart';
import '../../../controller/customer/customer.dart';
import '../../../enum/customer.dart';
import '../../../models/customer/customer.dart';
import '../../../widgets/custom_keyboard.dart';
import '../../../widgets/custom_table.dart';
import '../../../widgets/operation_buttons.dart';
import '../../../widgets/search_by.dart';
import '../../../widgets/text_field.dart';
import '../product/product.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({Key? key}) : super(key: key);

  @override
  _AddCustomerScreenState createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final FocusNode _focusNode = FocusNode();
  CustomerController customerController = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    customerController.getAllCustomer();
    final node = FocusScope.of(context);
    return CustomKeyboard(
      focusNode: _focusNode,
      onAdd: () {},
      onArrowDown: () {},
      onArrowUp: () {},
      onEnter: () {},
      onF5: () {
        customerController.addCustomer();
        customerController.firstNode.requestFocus();
        setState(() {});
      },
      onF6: () {
        customerController.clearTextField();
        setState(() {});
      },
      onF7: () {
        customerController.updateCustomer();
        customerController.firstNode.requestFocus();
        setState(() {});
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: CustomScreenUtility(context).width,
          height: CustomScreenUtility(context).height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: CustomScreenUtility(context).height * 0.07,
                  child: const Center(
                    child: CustomText(
                      "Customer Management",
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
                        CountContainer(
                          type: "No of Customer",
                          count: double.parse(
                            "${customerDB.getAllCustomer().length}",
                          ),
                        ),
                        const SizedBox(width: 20),
                        const SearchByText(),
                        const SizedBox(width: 20),
                        // DropdownButton<CustomerEnum>(
                        //     value: searchCustomerEnum,
                        //     onChanged: (e) {
                        //       setState(() {
                        //         searchCustomerEnum = e!;
                        //       });
                        //     },
                        //     items: CustomerEnum.values
                        //         .map((e) => DropdownMenuItem<CustomerEnum>(
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
                            controller: customerController.searchController,
                            label: "Search",
                            onChange: (String value) {
                              customerController.searchCustomer(value);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GetBuilder<CustomerController>(
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
                                          onPressed: controller.getAllCustomer,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTFWithKeyboard(
                                      focusNode: controller.firstNode,
                                      controller: controller.nameController,
                                      autofocus: true,
                                      label: "Enter Name",
                                      textInputType: TextInputType.number,
                                      keyboardNode:
                                          controller.firstKeyboardNode,
                                      onEditingComplete:
                                          controller.checkCustomerExists,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTFWithKeyboard(
                                      keyboardNode:
                                          controller.mobileKeyboardNode,
                                      controller: controller.mobileNoController,
                                      label: "Enter Mobile Number",
                                      focusNode: controller.mobileNode,
                                      prevNode: controller.firstNode,
                                      nextNode: controller.emailNode,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTFWithKeyboard(
                                      keyboardNode:
                                          controller.emailKeyboardNode,
                                      controller: controller.emailController,
                                      label: "Enter Email",
                                      focusNode: controller.emailNode,
                                      prevNode: controller.mobileNode,
                                      nextNode: controller.addressNode,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTFWithKeyboard(
                                      keyboardNode:
                                          controller.addressKeyboardNode,
                                      focusNode: controller.addressNode,
                                      controller: controller.addressController,
                                      label: "Enter Address",
                                      textInputType: TextInputType.number,
                                      prevNode: controller.emailNode,
                                      nextNode: controller.pincodeNode,
                                      onEditingComplete: () {
                                        controller.addressController.text =
                                            controller.addressController.text
                                                .capitalize
                                                .toString();
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTFWithKeyboard(
                                      keyboardNode:
                                          controller.pincodeKeyboardNode,
                                      controller: controller.pincodeController,
                                      label: "Enter Pincode",
                                      focusNode: controller.pincodeNode,
                                      prevNode: controller.addressNode,
                                      nextNode: controller.gstinNode,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTFWithKeyboard(
                                      keyboardNode:
                                          controller.gstinKeyboardNode,
                                      focusNode: controller.gstinNode,
                                      controller: controller.gstinController,
                                      label: "Enter GSTIN",
                                      prevNode: controller.pincodeNode,
                                      nextNode: controller.stateNode,
                                    ),
                                    const SizedBox(height: 20),
                                    const CustomText(
                                      "Select a State",
                                      size: 12,
                                    ),
                                    DropdownButton<String>(
                                      focusNode: controller.stateNode,
                                      value: controller.selectedState,
                                      onChanged: (String? e) {
                                        controller.setState(e!);
                                        controller.customerTypeNode
                                            .requestFocus();
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
                                    const CustomText(
                                      "Select a Type",
                                      size: 12,
                                    ),
                                    DropdownButton<String>(
                                      focusNode: controller.customerTypeNode,
                                      value: controller.selectedCustomerType,
                                      onChanged: (String? e) {
                                        controller.setCustomerType(e!);
                                        controller.addCustomer();
                                        controller.firstNode.requestFocus();
                                      },
                                      items: customerType
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
                                      onAdd: controller.addCustomer,
                                      onClear: () async {
                                        controller.clearTextField();
                                        controller
                                            .setSelectedCustomerModel(null);
                                        // final pdf = await rootBundle.load(
                                        //   'assets/pdf/Agnel-Selvan.pdf',
                                        // );
                                        // await Printing.layoutPdf(
                                        //   onLayout: (_) =>
                                        //       pdf.buffer.asUint8List(),
                                        // );
                                      },
                                      onDelete: controller.deleteCustomer,
                                      onUpdate: controller.updateCustomer,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey[10],
                              width: CustomScreenUtility(context).width * 0.77,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        color: kLightPrimaryColor,
                                        child: Row(
                                          children: CustomerEnum.values
                                              .map(
                                                (e) => CustomTableHeaderElement(
                                                  width: CustomScreenUtility(
                                                        context,
                                                      ).width *
                                                      0.77 /
                                                      CustomerEnum
                                                          .values.length,
                                                  text: customerEnumToStr(e),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                      GetBuilder<CustomerController>(
                                        builder: (controller) {
                                          return Column(
                                            children: controller
                                                    .customerModelList.isEmpty
                                                ? [
                                                    const CustomText(
                                                      "No Customer Record Exists",
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      size: 14,
                                                    )
                                                  ]
                                                : controller
                                                        .searchedCustomerModel
                                                        .isNotEmpty
                                                    ? controller
                                                        .searchedCustomerModel
                                                        .map(
                                                          (e) => buildInkWell(
                                                            e,
                                                            controller,
                                                          ),
                                                        )
                                                        .toList()
                                                    : controller
                                                        .customerModelList
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
      ),
    );
  }

  Widget buildInkWell(CustomerModel e, CustomerController controller) {
    return InkWell(
      onTap: () {
        controller.onCustomerTap(e);
      },
      child: Container(
        color: controller.selectedCustomerModel == e
            ? Colors.grey[300]
            : controller.customerModelList.indexOf(e) % 2 == 0
                ? Colors.white
                : Colors.grey[200],
        child: Row(
          children: [
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CustomerEnum.values.length,
              text: e.name.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CustomerEnum.values.length,
              text: "${e.mobileNo}",
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CustomerEnum.values.length,
              text: e.address.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CustomerEnum.values.length,
              text: e.state.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CustomerEnum.values.length,
              text: e.pincode.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CustomerEnum.values.length,
              text: e.gstin.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CustomerEnum.values.length,
              text: e.type.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  CustomerEnum.values.length,
              // text: validate,
              text: getFormattedDateTime(e.createdAt ?? DateTime.now()),
            ),
          ],
        ),
      ),
    );
  }
}
