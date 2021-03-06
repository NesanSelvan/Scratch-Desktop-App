import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/models/purchase/purchase.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:qr_flutter/qr_flutter.dart';
import 'package:validators/validators.dart';

import '../../../controller/history/purchase/purchase.dart';
import '../../../controller/home/home.dart';
import '../../../enum/history/sales.dart';
import '../../../utils/utility.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_table.dart';
import '../../../widgets/full_container.dart';
import '../../../widgets/header_text.dart';
import '../../../widgets/print_optn.dart';
import '../../billing/sales/sales.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({Key? key}) : super(key: key);

  @override
  _PurchaseHistoryState createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  PurchaseHistoryNotifier purchaseHistoryNotifier =
      Get.put(PurchaseHistoryNotifier());
  HomeController homeController = Get.put(HomeController());
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    purchaseHistoryNotifier.onInit();
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);

        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            debugPrint('History Keyboard: ${data.logicalKey}');

            if (!isKeyDown) {
              if (data.logicalKey == LogicalKeyboardKey.arrowDown) {
                purchaseHistoryNotifier.updateSelectedPurchaseModel();
              } else if (data.logicalKey == LogicalKeyboardKey.arrowUp) {
                purchaseHistoryNotifier.updateUpSelectedPurchaseModel();
              } else if (data.logicalKey == LogicalKeyboardKey.f2) {
                showPrintOptnDialog(context);
              } else if (data.logicalKey == LogicalKeyboardKey.f1) {}
            }
            break;
          default:
            throw Exception(
              'Unsupported platform ${rawKeyEvent.data.runtimeType}',
            );
        }
      },
      child: Scaffold(
        body: GetBuilder<PurchaseHistoryNotifier>(
          builder: (controller) {
            return FullWidthHeightContainer(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: CustomScreenUtility(context).height * 0.1,
                      child: const HeaderText(
                        header: "Purchase History Management",
                      ),
                    ),
                    // CustomButton(
                    //     icon: Icons.delete,
                    //     text: "Delete All",
                    //     onTap: () {
                    //       purchaseHistoryNotifier.clearAllBills();
                    //     }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText("Start"),
                            DateTimeInkWell(
                              onTap: () async {
                                final dateTime = await showDatePickerDialog(
                                  context,
                                  initialDate: controller.startDateTime,
                                );
                                controller.setPickedStartDateTime(dateTime);
                              },
                              dateTime: controller.startDateTime,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText("End"),
                            DateTimeInkWell(
                              onTap: () async {
                                final dateTime = await showDatePickerDialog(
                                  context,
                                  initialDate: controller.endDateTime,
                                );
                                controller.setPickedEndDateTime(dateTime);
                              },
                              dateTime: controller.endDateTime,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        CustomButton(
                          buttonColor: Colors.green[400],
                          icon: Icons.search,
                          text: "Search",
                          onTap: () {},
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        CustomButton(
                          buttonColor: Colors.yellow[600],
                          icon: Icons.search,
                          text: "Show all",
                          onTap: () {},
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          width: CustomScreenUtility(context).width,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                color: kLightPrimaryColor,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: PurchaseHistoryEnum.values
                                        .map(
                                          (e) => CustomTableHeaderElement(
                                            width: CustomScreenUtility(context)
                                                    .width /
                                                PurchaseHistoryEnum
                                                    .values.length,
                                            text:
                                                getStrofAddPurchaseHistoryEnum(
                                              e,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              if (purchaseHistoryNotifier.quotationsList ==
                                  null)
                                const CustomText("No Purchase to display")
                              else if (purchaseHistoryNotifier
                                  .quotationsList!.isEmpty)
                                const CustomText("No Purchase to display")
                              else
                                Column(
                                  children: purchaseHistoryNotifier
                                      .quotationsList!
                                      .map((e) => buildInkWell(e))
                                      .toList(),
                                )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildInkWell(PurchaseModel billModel) {
    return ExpansionTile(
      onExpansionChanged: (val) {
        purchaseHistoryNotifier.setSelectedPurchaseModel = billModel;
      },
      title: Container(
        color: purchaseHistoryNotifier.selectedPurchaseModel!.id == billModel.id
            ? Colors.grey[300]
            : Colors.white,
        child: Row(
          children: [
            CustomTableElement(
              width: CustomScreenUtility(context).width /
                  PurchaseHistoryEnum.values.length,
              text: getFormattedDateTime(billModel.dateTime),
            ),
            CustomTableImageElement(
              width: CustomScreenUtility(context).width /
                  PurchaseHistoryEnum.values.length,
              imagesList: billModel.imagesPathList ?? [],
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width /
                  PurchaseHistoryEnum.values.length,
              text: billModel.billNo,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width /
                  PurchaseHistoryEnum.values.length,
              text: billModel.companyModel.name,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width /
                  PurchaseHistoryEnum.values.length,
              text: billModel.productList.length.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width /
                  PurchaseHistoryEnum.values.length,
              text: billModel.grandTotal.toString(),
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width /
                      PurchaseHistoryEnum.values.length -
                  10,
              text: "0",
            ),
            Container(
              width: CustomScreenUtility(context).width /
                      PurchaseHistoryEnum.values.length -
                  100,
              child: Padding(
                padding: const EdgeInsets.symmetric(),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () async {
                        await purchaseHistoryNotifier.deletePurchase(billModel);
                      },
                      child: Column(
                        children: [
                          CustomIcon(
                            Icons.delete,
                            size: 16,
                            color: Colors.red[400],
                          ),
                          CustomText(
                            "F1.Delete",
                            size: 8,
                            color: Colors.grey[600],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      children: [
        Table(
          children: [
            TableRow(
              children: [
                const TableCell(child: CustomText("Product Name")),
                const TableCell(child: CustomText("Category")),
                const TableCell(child: CustomText("Rate")),
                const TableCell(child: CustomText("Qty")),
                const TableCell(child: CustomText("Price")),
                if (!(billModel.isNormalPurchaseBill ?? true))
                  const TableCell(child: CustomText("Lorry Fright")),
                const TableCell(child: CustomText("Tax")),
                const TableCell(child: CustomText("Total Amount")),
              ],
            ),
            ...billModel.productList
                .map(
                  (e) => TableRow(
                    children: [
                      TableCell(
                        child: CustomText(e.productModel.productName),
                      ),
                      TableCell(child: CustomText(e.categoryModel.category)),
                      TableCell(child: CustomText("${e.rate}")),
                      TableCell(child: CustomText("${e.qty}")),
                      TableCell(child: CustomText("${e.amount}")),
                      if (!(billModel.isNormalPurchaseBill ?? true))
                        TableCell(child: CustomText("${e.lorryFright}")),
                      TableCell(child: CustomText("${e.tax}")),
                      TableCell(child: CustomText("${e.taxableValue}")),
                    ],
                  ),
                )
                .toList()
          ],
        ),
        if (billModel.isNormalPurchaseBill ?? false)
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const CustomText("Lorry Details"),
              const SizedBox(
                height: 10,
              ),
              Table(
                children: [
                  const TableRow(
                    children: [
                      TableCell(child: CustomText("Lorry Fright")),
                      TableCell(child: CustomText("Lorry Fright Tax")),
                      TableCell(child: CustomText("Lorry Fright Total")),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: CustomText(
                          (billModel.lorryFright ?? 0).toStringAsFixed(2),
                        ),
                      ),
                      TableCell(
                        child: CustomText(
                          (billModel.lorryFrightTax ?? 0).toStringAsFixed(2),
                        ),
                      ),
                      TableCell(
                        child: CustomText(
                          (billModel.lorryFrightTotal ?? 0).toStringAsFixed(2),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
      ],
    );
  }
}
