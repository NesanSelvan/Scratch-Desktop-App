import 'dart:io';

import 'package:annai_store/controller/auth/login.dart';
import 'package:annai_store/controller/home/home.dart';
import 'package:annai_store/controller/report/report.dart';
import 'package:annai_store/controller/statements/statements.dart';
import 'package:annai_store/controller/threads/threads.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/add.dart';
import 'package:annai_store/enum/billing.dart';
import 'package:annai_store/enum/keyboard.dart';
import 'package:annai_store/enum/person/person.dart';
import 'package:annai_store/enum/statement.dart';
import 'package:annai_store/features/analytics/sales/screens/sales.dart';
import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/screens/add/product/sub/sub_product.dart';
import 'package:annai_store/screens/auth/login.dart';
import 'package:annai_store/screens/backup/backup.dart';
import 'package:annai_store/screens/billing/sales/sales.dart';
import 'package:annai_store/screens/connect/database/database.dart';
import 'package:annai_store/screens/paths/paths.dart';
import 'package:annai_store/screens/payments/estimate_receipt/estimate_receipt.dart';
import 'package:annai_store/screens/payments/payments/payments.dart';
import 'package:annai_store/screens/payments/receipt/receipt.dart';
import 'package:annai_store/screens/payments/voucher/voucher.dart';
import 'package:annai_store/screens/profile/account/account.dart';
import 'package:annai_store/screens/server/server.dart';
import 'package:annai_store/screens/threads/threads.dart';
import 'package:annai_store/screens/todays/sales.dart';
import 'package:annai_store/utils/datetime/datetime.dart';
import 'package:annai_store/utils/file/file.dart';
import 'package:annai_store/utils/folder/folder.dart';
import 'package:annai_store/utils/navigation_service.dart';
import 'package:annai_store/utils/null/null.dart';
import 'package:annai_store/utils/pdf/pdf.dart';
import 'package:annai_store/utils/user_response/user_response.dart';
import 'package:annai_store/widgets/custom_typeahead.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:menubar/menubar.dart' as menubar;
import 'package:validators/validators.dart';

class Utility {
  Future<void> performActivityWhenAppOpens() async {
    if (await Directory(FolderUtility.getDBFolderLocation()).exists()) {
      Process.run("attrib", ["+h ", FolderUtility.getDBFolderLocation()])
          .then((value) {});
    }
  }

  Future<String> checkCurrentVersion() async {
    return http.read(
      Uri.parse(
        'https://raw.githubusercontent.com/AgnelSelvan/AgnelSelvan.github.io/main/${FileUtility.getAppsFileName()}/api.json',
      ),
    );
  }

  // static const PdfPageFormat getA4Size = PdfPageFormat.a4;

  void addMenuClicked(AddEnum addEnum, HomeController homeController) {
    homeController.setCurrentSelectedWidget(getWidgetOfAdd(addEnum));
    // homeController.addEnum = addEnum;
    homeController.update();
  }

  void billingMenuClicked(
    BillingEnum billingEnum,
    HomeController homeController,
  ) {
    homeController.setCurrentSelectedWidget(getWidgetOfBilling(billingEnum));
    // homeController.addEnum = addEnum;
    homeController.update();
  }

  void historyMenuClicked(
    BillingEnum billingEnum,
    HomeController homeController,
  ) {
    homeController.setCurrentSelectedWidget(getWidgetOfHistory(billingEnum));

    homeController.update();
  }

  Future<void> statementDialog(
    BuildContext context,
    StatementEnum statementEnum, {
    required Callback generateStatement,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: CustomText(
            "Select Date",
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            size: 20,
          ),
          contentPadding: const EdgeInsets.all(10),
          children: [
            GetBuilder<StatementController>(
              init: StatementController(),
              builder: (controller) {
                return Column(
                  children: [
                    DropdownButton<SalesStatementBy>(
                      value: controller.salesStatementBy,
                      items: SalesStatementBy.values
                          .map(
                            (e) => DropdownMenuItem<SalesStatementBy>(
                              value: e,
                              child: CustomText(e.name),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        if (val != null) {
                          controller.salesStatementBy = val;
                        }
                      },
                    ),
                    if (StatementEnum.Sales == statementEnum)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.salesStatementBy ==
                              SalesStatementBy.customer)
                            Column(
                              children: [
                                const CustomText(
                                  "Select Customer",
                                  fontWeight: FontWeight.bold,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.setAllCustomerCheck =
                                            !controller.isAllCustomer;
                                      },
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: controller.isAllCustomer,
                                            onChanged: (bool? val) {
                                              controller.setAllCustomerCheck =
                                                  val ?? false;
                                            },
                                          ),
                                          const CustomText(
                                            "All Customer",
                                            size: 12,
                                          )
                                        ],
                                      ),
                                    ),
                                    if (controller.isAllCustomer)
                                      Container()
                                    else
                                      DropdownButton<CustomerModel>(
                                        value: controller.selectedCustomer,
                                        onChanged: (CustomerModel? data) {
                                          if (data != null) {
                                            controller
                                                    .setSelectedCustomerModel =
                                                data;
                                          }
                                        },
                                        hint: const CustomText(
                                          "Select a Customer",
                                        ),
                                        items: controller.allCustomers
                                            .map(
                                              (e) => DropdownMenuItem<
                                                  CustomerModel>(
                                                value: e,
                                                onTap: () {},
                                                child: CustomText(e.name),
                                              ),
                                            )
                                            .toList(),
                                      )
                                  ],
                                ),
                                if (!controller.isAllCustomer)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Select Statement Type"),
                                      DropdownButton<StatementType>(
                                        value: controller.statementType,
                                        items: StatementType.values
                                            .map(
                                              (e) => DropdownMenuItem<
                                                  StatementType>(
                                                value: e,
                                                child: Text(e.name),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (val) {
                                          if (val != null) {
                                            controller.statementType = val;
                                          }
                                          controller.update();
                                        },
                                      ),
                                    ],
                                  ),
                              ],
                            )
                          else
                            Column(
                              children: [
                                const CustomText(
                                  "Select HSN Code",
                                  fontWeight: FontWeight.bold,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.setAllHSNCode =
                                            !controller.isAllHSNCode;
                                      },
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: controller.isAllHSNCode,
                                            onChanged: (bool? val) {
                                              controller.setAllHSNCode =
                                                  val ?? false;
                                            },
                                          ),
                                          const CustomText(
                                            "All HSN Code",
                                            size: 12,
                                          )
                                        ],
                                      ),
                                    ),
                                    if (controller.isAllHSNCode)
                                      Container()
                                    else
                                      DropdownButton<CategoryModel>(
                                        value: controller.selectedCategory,
                                        onChanged: (CategoryModel? data) {
                                          if (data != null) {
                                            controller
                                                    .setSelectedCategoryModel =
                                                data;
                                          }
                                        },
                                        hint: const CustomText(
                                          "Select a HSN Code",
                                        ),
                                        items: controller.allCategory
                                            .map(
                                              (e) => DropdownMenuItem<
                                                  CategoryModel>(
                                                value: e,
                                                onTap: () {},
                                                child: CustomText(
                                                  "${e.category} (${e.hsnCode})",
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      )
                                  ],
                                ),
                                if (!controller.isAllHSNCode)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Select Statement Type"),
                                      DropdownButton<StatementType>(
                                        value: controller.statementType,
                                        items: StatementType.values
                                            .map(
                                              (e) => DropdownMenuItem<
                                                  StatementType>(
                                                value: e,
                                                child: Text(e.name),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (val) {
                                          if (val != null) {
                                            controller.statementType = val;
                                          }
                                          controller.update();
                                        },
                                      ),
                                    ],
                                  )
                              ],
                            )
                        ],
                      )
                    else if (StatementEnum.Purchase == statementEnum)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            "Select Company",
                            fontWeight: FontWeight.bold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.setAllCustomerCheck =
                                      !controller.isAllCompany;
                                },
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: controller.isAllCompany,
                                      onChanged: (bool? val) {
                                        controller.setAllCompanyCheck =
                                            val ?? false;
                                      },
                                    ),
                                    const CustomText(
                                      "All Company",
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),
                              if (controller.isAllCompany)
                                Container()
                              else
                                DropdownButton<CompanyModel>(
                                  value: controller.selectedCompany,
                                  onChanged: (CompanyModel? data) {
                                    if (data != null) {
                                      controller.setSelectedCompanyModel = data;
                                    }
                                  },
                                  hint: const CustomText(
                                    "Select a Company",
                                  ),
                                  items: controller.allCompanies
                                      .map(
                                        (e) => DropdownMenuItem<CompanyModel>(
                                          value: e,
                                          onTap: () {},
                                          child: CustomText(e.name),
                                        ),
                                      )
                                      .toList(),
                                )
                            ],
                          ),
                        ],
                      )
                    else
                      Container(),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "Start Date",
                              color: Colors.grey[800],
                              size: 14,
                            ),
                            DateTimeInkWell(
                              onTap: () async {
                                final dateTime = await showDatePickerDialog(
                                  context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1999),
                                  lastDate: DateTimeUtility.getBillEndDate(),
                                );
                                controller.setStartDate =
                                    dateTime ?? controller.startDate;
                              },
                              dateTime: controller.startDate,
                            ),
                          ],
                        ),
                        const SizedBox(width: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "End Date",
                              color: Colors.grey[800],
                              size: 14,
                            ),
                            DateTimeInkWell(
                              onTap: () async {
                                final dateTime = await showDatePickerDialog(
                                  context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1999),
                                  lastDate: DateTimeUtility.getBillEndDate(),
                                );
                                controller.setEndDate =
                                    dateTime ?? controller.endDate;
                              },
                              dateTime: controller.endDate,
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomTextButton(
                      "Submit",
                      onPressed: () async {
                        Navigator.pop(context);
                        if (controller.statementType == StatementType.Excel) {
                          generateStatement();
                        } else {
                          if (controller.selectedCustomer != null &&
                              controller.selectedCategory != null) {
                            final data = await PDFGenerator
                                .generateStatementByCustomerBuffer(
                              controller.selectedCustomer!,
                              controller.selectedCategory!,
                              controller.startDate,
                              controller.endDate,
                            );
                            PDFGenerator.openBufferPdf(
                              data,
                              "statement_customer",
                            );
                          }
                        }
                      },
                      backgoundColor: kPrimaryColor,
                      textColor: Colors.white,
                    )
                  ],
                );
              },
            )
          ],
        );
      },
    );
  }

  Future<void> reportDialog(
    BuildContext context, {
    required Callback generateStatement,
  }) {
    final customerKeyboardNode = FocusNode();
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: CustomText(
            "Select Date",
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            size: 20,
          ),
          contentPadding: const EdgeInsets.all(10),
          children: [
            GetBuilder<ReportController>(
              init: ReportController(),
              builder: (controller) {
                return Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          "Select Customer",
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: CustomTypeAhead<CustomerModel>(
                                keyboardFocusNode: customerKeyboardNode,
                                onArrowDown: () {
                                  controller.keyboardSelectCustomerModel(
                                    KeyboardEventEnum.ArrowDown,
                                  );
                                  // setState(() {});
                                },
                                onArrowUp: () {
                                  controller.keyboardSelectCustomerModel(
                                    KeyboardEventEnum.ArrowUp,
                                  );
                                },
                                onEnter: () {
                                  if (controller.selectedCustomer != null) {
                                    debugPrint(
                                      'Selected Customer :P ${controller.selectedCustomer}',
                                    );
                                    controller.customerController.text =
                                        controller.selectedCustomer!.name;
                                  } else {
                                    CustomUtilies.customFailureSnackBar(
                                      "Please Enter the Customer First",
                                      "Error",
                                    );
                                    controller.customerFocusNode.requestFocus();
                                  }
                                },
                                focusNode: controller.customerFocusNode,
                                autofocus: true,
                                onEditingComplete: () {
                                  if (controller.selectedCompany != null) {
                                    controller.customerController.text =
                                        controller.selectedCustomer!.name;
                                  }
                                },
                                selectedModel: controller.selectedCustomer,
                                controller: controller.customerController,
                                modelList: controller.allCustomers,
                                model: NullCheckUtilities.getDummyCustomer(),
                                onSuggestionSelected: (suggestion) {
                                  controller.setSelectedCustomerModel =
                                      suggestion;
                                  controller.customerController.text =
                                      suggestion.name;
                                  // node.nextFocus();
                                },
                              ),
                            ),
                            // DropdownButton<CustomerModel>(
                            //   value: controller.selectedCustomer,
                            //   onChanged: (CustomerModel? data) {
                            //     if (data != null) {
                            //       controller.setSelectedCustomerModel = data;
                            //     }
                            //   },
                            //   hint: const CustomText(
                            //     "Select a Customer",
                            //   ),
                            //   items: controller.allCustomers
                            //       .map(
                            //         (e) => DropdownMenuItem<CustomerModel>(
                            //           value: e,
                            //           onTap: () {},
                            //           child: CustomText(e.name),
                            //         ),
                            //       )
                            //       .toList(),
                            // )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "Start Date",
                              color: Colors.grey[800],
                              size: 14,
                            ),
                            DateTimeInkWell(
                              onTap: () async {
                                final dateTime = await showDatePickerDialog(
                                  context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1999),
                                  lastDate: DateTimeUtility.getBillEndDate(),
                                );
                                controller.setStartDate =
                                    dateTime ?? controller.startDate;
                              },
                              dateTime: controller.startDate,
                            ),
                          ],
                        ),
                        const SizedBox(width: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "End Date",
                              color: Colors.grey[800],
                              size: 14,
                            ),
                            DateTimeInkWell(
                              onTap: () async {
                                final dateTime = await showDatePickerDialog(
                                  context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1999),
                                  lastDate: DateTimeUtility.getBillEndDate(),
                                );
                                controller.setEndDate =
                                    dateTime ?? controller.endDate;
                              },
                              dateTime: controller.endDate,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        controller: controller.previousAmountController,
                        decoration: const InputDecoration(
                          hintText: "Previous Month Debit",
                        ),
                      ),
                    ),
                    CustomTextButton(
                      "Submit",
                      onPressed: () async {
                        Navigator.pop(context);
                        controller
                            .handleCustomerReportStatementGeneration(context);
                      },
                      backgoundColor: kPrimaryColor,
                      textColor: Colors.white,
                    )
                  ],
                );
              },
            )
          ],
        );
      },
    );
  }

  Future<void> showAddThreadDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return GetBuilder<ThreadController>(
          init: ThreadController(),
          builder: (controller) {
            return SimpleDialog(
              title: const CustomText("Add Threads Company"),
              contentPadding: const EdgeInsets.all(20),
              children: [
                // DropdownButton<CompanyModel>(
                //     onChanged: (CompanyModel? data) {
                //       if (data != null) {
                //         controller.setSelectedCompanyModel = data;
                //       }
                //     },
                //     value: controller.selectedCompanyModel,
                //     items: companyDB
                //         .getAllCompany()
                //         .map((e) => DropdownMenuItem(
                //             value: e, child: CustomText(e.name)))
                //         .toList()),
                CustomTypeAhead<CompanyModel>(
                  onArrowDown: () {
                    controller.keyboardSelectCompanyModel(
                      KeyboardEventEnum.ArrowDown,
                    );
                  },
                  onArrowUp: () {
                    controller.keyboardSelectCompanyModel(
                      KeyboardEventEnum.ArrowUp,
                    );
                  },
                  onEnter: () {
                    if (controller.selectedCompanyModel != null) {
                      controller.companyController.text =
                          controller.selectedCompanyModel!.name;
                      controller.threadFocus.requestFocus();
                    } else {
                      CustomUtilies.customFailureSnackBar(
                        "Error",
                        "Please Select Company to proceed further",
                      );
                      controller.companyNode.requestFocus();
                    }
                  },
                  focusNode: controller.companyNode,
                  onEditingComplete: () {
                    if (controller.selectedCompanyModel != null) {
                      controller.companyController.text =
                          controller.selectedCompanyModel!.name;
                      controller.threadFocus.requestFocus();
                    }
                  },
                  controller: controller.companyController,
                  modelList: controller.companyList,
                  model: NullCheckUtilities.getDummyCompany(),
                  selectedModel: controller.selectedCompanyModel,
                  onSuggestionSelected: (suggestion) {
                    controller.setSelectedCompanyModel = suggestion;
                    controller.companyController.text = suggestion.name;
                    debugPrint('Selected $suggestion');
                    controller.threadFocus.requestFocus();
                  },
                  keyboardFocusNode: controller.companyKeyboardNode,
                ),
                CustomTextField(
                  controller: controller.threadsController,
                  maxLines: 5,
                  focusNode: controller.threadFocus,
                  onEditingComplete: () async {
                    await controller.addThreadCompanyToDB();
                    Navigator.pop(context);
                  },
                  label: "Enter Threads Number (Eg : 1 , 3)",
                ),
                CustomTextButton(
                  "Add",
                  onPressed: () async {
                    await controller.addThreadCompanyToDB();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
        );
      },
    );
  }

  //Menus
  void updateMenubar(
    BuildContext context,
    HomeController homeController,
    StatementController statementController,
  ) {
    final loginController = Get.put(LoginController());
    if (loginController.currentEmployee == null) {
      Focus(
        focusNode: homeController.menuFocus,
        child: FutureBuilder(
          future: menubar.setApplicationMenu([]),
          builder: (BuildContext context, snapshot) {
            return Container();
          },
        ),
      );
      return;
    }

    final empType = getPersonEnumFromStr(loginController.currentEmployee!.type);
    debugPrint("empType : $empType");
    Focus(
      focusNode: homeController.menuFocus,
      child: FutureBuilder(
        future: menubar.setApplicationMenu([
          if (empType == PersonEnum.SuperAdmin ||
              empType == PersonEnum.Admin ||
              empType == PersonEnum.SoftwareOwner)
            menubar.NativeSubmenu(
              label: 'Add',
              children: [
                ...AddEnum.values.map(
                  (e) => menubar.NativeMenuItem(
                    label: getStrofAddEnum(e),
                    onSelected: () {
                      addMenuClicked(e, homeController);
                    },
                  ),
                )
              ],
            ),
          menubar.NativeSubmenu(
            label: 'Billing',
            children: BillingEnum.values
                .map(
                  (e) => menubar.NativeMenuItem(
                    label: getStrofAddBilling(e),
                    onSelected: () {
                      billingMenuClicked(e, homeController);
                    },
                  ),
                )
                .toList(),
          ),
          menubar.NativeSubmenu(
            label: 'Receipt',
            children: [
              menubar.NativeMenuItem(
                label: "Receipt",
                onSelected: () {
                  homeController.setCurrentSelectedWidget(ReceiptScreen());
                  homeController.update();
                },
              ),
              if (empType == PersonEnum.SoftwareOwner)
                menubar.NativeMenuItem(
                  label: "Estimate Receipt",
                  onSelected: () {
                    homeController
                        .setCurrentSelectedWidget(EstimateReceiptScreen());
                    homeController.update();
                  },
                ),
              menubar.NativeMenuItem(
                label: "Voucher",
                onSelected: () {
                  // voucherDB.clearAll();
                  debugPrint("Voucher Screen");
                  homeController
                      .setCurrentSelectedWidget(const VoucherScreen());
                  homeController.update();
                },
              ),
              menubar.NativeMenuItem(
                label: "Payment",
                onSelected: () {
                  debugPrint("Payment Screen");
                  homeController.setCurrentSelectedWidget(PaymentScreen());
                  homeController.update();
                },
              ),
            ],
          ),
          if (empType == PersonEnum.SuperAdmin ||
              empType == PersonEnum.Admin ||
              empType == PersonEnum.SoftwareOwner)
            menubar.NativeSubmenu(
              label: 'Todays',
              children: [
                menubar.NativeMenuItem(
                  label: 'Sales',
                  shortcut: LogicalKeySet(
                    LogicalKeyboardKey.meta,
                    LogicalKeyboardKey.digit0,
                  ),
                  onSelected: () {
                    homeController.setCurrentSelectedWidget(TodaysSaleScreen());
                    homeController.update();
                  },
                ),
              ],
            ),
          menubar.NativeSubmenu(
            label: 'History',
            children: BillingEnum.values
                .map(
                  (e) => menubar.NativeMenuItem(
                    label: getStrofAddBilling(e),
                    onSelected: () {
                      historyMenuClicked(e, homeController);
                    },
                  ),
                )
                .toList(),
          ),
          menubar.NativeSubmenu(
            label: "Analytics",
            children: [
              menubar.NativeMenuItem(
                label: "Overall",
                onSelected: () {
                  homeController
                      .setCurrentSelectedWidget(const SalesAnalyticsScreen());
                  homeController.update();
                },
              )
            ],
          ),
          menubar.NativeSubmenu(
            label: 'Report',
            children: [
              menubar.NativeMenuItem(
                label: "Customer",
                onSelected: () async {
                  await reportDialog(
                    context,
                    generateStatement: () async {},
                  );
                  homeController.update();
                },
              ),
            ],
          ),
          menubar.NativeSubmenu(
            label: 'Statements',
            children: StatementEnum.values
                .map(
                  (e) => menubar.NativeMenuItem(
                    label: statementEnumToStr(e),
                    onSelected: () async {
                      if (e == StatementEnum.Stock) {
                        await statementController.handleStatementGeneration(
                          e,
                          context,
                        );
                        return;
                      } else {
                        await statementDialog(
                          context,
                          e,
                          generateStatement: () async {
                            try {
                              await statementController
                                  .handleStatementGeneration(e, context);
                            } catch (e) {
                              UserResponseUtility.showError(
                                context,
                                "Error : $e",
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                )
                .toList(),
          ),
          if (empType == PersonEnum.SoftwareOwner)
            menubar.NativeSubmenu(
              label: 'Connect',
              children: [
                menubar.NativeMenuItem(
                  label: 'Mobile',
                  shortcut: LogicalKeySet(
                    LogicalKeyboardKey.meta,
                    LogicalKeyboardKey.digit0,
                  ),
                  onSelected: () {
                    homeController.setCurrentSelectedWidget(ServerPage());
                    homeController.update();
                  },
                ),
                menubar.NativeMenuItem(
                  label: 'Paths',
                  shortcut: LogicalKeySet(
                    LogicalKeyboardKey.meta,
                    LogicalKeyboardKey.digit0,
                  ),
                  onSelected: () {
                    homeController
                        .setCurrentSelectedWidget(const PathsScreen());
                    homeController.update();
                  },
                ),
                menubar.NativeMenuItem(
                  label: 'Database',
                  shortcut: LogicalKeySet(
                    LogicalKeyboardKey.meta,
                    LogicalKeyboardKey.digit0,
                  ),
                  onSelected: () {
                    homeController
                        .setCurrentSelectedWidget(const DatabaseScreen());
                    homeController.update();
                  },
                ),
              ],
            ),
          menubar.NativeSubmenu(
            label: 'Threads',
            children: [
              menubar.NativeMenuItem(
                label: "Companies",
                onSelected: () {
                  homeController
                      .setCurrentSelectedWidget(const ThreadsCompanyScreen());
                },
              ),
              menubar.NativeMenuItem(
                label: "Sub Products",
                onSelected: () {
                  homeController
                      .setCurrentSelectedWidget(const SubProductScreen());
                },
              ),
              menubar.NativeMenuItem(
                label: 'Add',
                shortcut: LogicalKeySet(
                  LogicalKeyboardKey.meta,
                  LogicalKeyboardKey.digit0,
                ),
                onSelected: () async {
                  await showAddThreadDialog(context);
                },
              ),
            ],
          ),
          menubar.NativeSubmenu(
            label: 'Backup',
            children: [
              menubar.NativeMenuItem(
                label: "Backup",
                onSelected: () {
                  homeController.setCurrentSelectedWidget(const BackupScreen());
                },
              )
            ],
          ),
          if (empType == PersonEnum.SuperAdmin ||
              empType == PersonEnum.Admin ||
              empType == PersonEnum.SoftwareOwner)
            menubar.NativeSubmenu(
              label: 'Testing',
              children: [
                menubar.NativeMenuItem(
                  label: 'Reset',
                  shortcut: LogicalKeySet(
                    LogicalKeyboardKey.meta,
                    LogicalKeyboardKey.digit0,
                  ),
                  onSelected: () {},
                ),
                const menubar.NativeMenuDivider(),
                menubar.NativeMenuItem(
                  label: 'Testing',
                  shortcut: LogicalKeySet(LogicalKeyboardKey.f2),
                  onSelected: () {
                    // homeController.setCurrentSelectedWidget(TestingScreen());
                    homeController.update();
                  },
                ),
                menubar.NativeMenuItem(
                  label: 'Decrement',
                  shortcut: LogicalKeySet(LogicalKeyboardKey.f1),
                  onSelected: () {},
                ),
              ],
            ),
          menubar.NativeSubmenu(
            label: 'Profile',
            children: [
              menubar.NativeMenuItem(
                label: "Account",
                onSelected: () {
                  homeController
                      .setCurrentSelectedWidget(const AccountScreen());
                },
              ),
              menubar.NativeMenuItem(
                label: "Log out",
                onSelected: () {
                  // homeController
                  //     .setCurrentSelectedWidget(const LoginScreen());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                  homeController.update();
                },
              ),
            ],
          ),
        ]),
        builder: (BuildContext context, snapshot) {
          return Container();
        },
      ),
    );
  }

  //key event in MaterialApp
  // void onKeyEvent(RawKeyEvent event, BuildContext context) {
  //   bool isKeyDown;
  //   switch (event.runtimeType) {
  //     case RawKeyDownEvent:
  //       isKeyDown = true;
  //       break;
  //     case RawKeyUpEvent:
  //       isKeyDown = false;
  //       break;
  //     default:
  //       throw Exception('Unexpected runtimeType of RawKeyEvent');
  //   }
  //   switch (event.data.runtimeType) {
  //     case RawKeyEventDataWindows:
  //       final data = event.data as RawKeyEventDataWindows;
  //       // keyCode = data.keyCode;
  //       // logicalKey = data.logicalKey.debugName;
  //       // physicalKey = data.physicalKey.debugName;
  //       if (!isKeyDown) {
  //         // debugPrint('event.logicalKey ${event.logicalKey}');
  //         // if (event.logicalKey == LogicalKeyboardKey.numpad1) {
  //         //   CustomUtilies.navigate(context, AddProductView);
  //         // }
  //         // if (event.logicalKey == LogicalKeyboardKey.numpad2) {
  //         //   CustomUtilies.navigate(context, AddCategoryView);
  //         // }
  //         // if (event.logicalKey == LogicalKeyboardKey.numpad3) {
  //         //   CustomUtilies.navigateReplacement(context, AddUnitView);
  //         // }
  //       }
  //       break;
  //     default:
  //       throw Exception('Unsupported platform ${event.data.runtimeType}');
  //   }
  // }

  bool isKeyDown(RawKeyEvent rawKeyEvent) {
    switch (rawKeyEvent.runtimeType) {
      case RawKeyDownEvent:
        return true;
      case RawKeyUpEvent:
        return false;
      default:
        throw Exception('Unexpected runtimeType of RawKeyEvent');
    }
  }

  static Future<void> showDeleteionDialog(
    String message, {
    VoidCallback? onYesTap,
    VoidCallback? onNoTap,
  }) async {
    if (NavigationService.navigatorKey.currentContext != null) {
      return showDialog(
        context: NavigationService.navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: const Text("Are you sure want to delete?"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: onNoTap ??
                    () {
                      Navigator.pop(context);
                    },
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (onYesTap != null) {
                    onYesTap();

                    CustomUtilies.customSuccessSnackBar(
                      "Delete successful",
                      "All Data deleted Successfully",
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[400]),
                ),
                child: const Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  static String onlyDate(DateTime dateTime) {
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  static String bufferToFile(Uint8List buffer, String filePath) {
    final file = File(filePath);
    try {
      file.writeAsBytesSync(buffer);
      return file.path;
    } catch (e, s) {
      print(s);
      rethrow;
    }
  }
}
