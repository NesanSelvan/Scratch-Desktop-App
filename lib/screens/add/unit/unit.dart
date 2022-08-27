import 'package:annai_store/core/constants/constants.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../../../controller/home/home.dart';
import '../../../controller/unit/unit.dart';
import '../../../enum/unit.dart';
import '../../../models/unit/unit.dart';
import '../../../utils/utility.dart';
import '../../../widgets/custom_table.dart';
import '../../../widgets/operation_buttons.dart';
import '../../../widgets/search_by.dart';
import '../../../widgets/text_field.dart';

class AddUnitScreen extends StatefulWidget {
  const AddUnitScreen({Key? key}) : super(key: key);

  @override
  _AddUnitScreenState createState() => _AddUnitScreenState();
}

class _AddUnitScreenState extends State<AddUnitScreen> {
  UnitEnum searchUnitEnum = UnitEnum.FormalName;
  final FocusNode _focusNode = FocusNode();
  UnitController unitController = Get.put(UnitController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    unitController.getAllUnits();
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent rawKeyEvent) {
        final isKeyDown = Utility().isKeyDown(rawKeyEvent);
        switch (rawKeyEvent.data.runtimeType) {
          case RawKeyEventDataWindows:
            final data = rawKeyEvent.data as RawKeyEventDataWindows;
            // keyCode = data.keyCode;
            // logicalKey = data.logicalKey.debugName;
            // physicalKey = data.physicalKey.debugName;
            if (!isKeyDown) {
              debugPrint('unitControllers ${unitController.clickedKeys}');

              // unitController.performKeyboardClickedAction(homeController);
              // unitController.updateKeys(data.logicalKey);

              debugPrint('unitController ${unitController.clickedKeys}');
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
                    "Unit Management",
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
                      DropdownButton<UnitEnum>(
                        value: searchUnitEnum,
                        onChanged: (e) {
                          setState(() {
                            searchUnitEnum = e!;
                          });
                        },
                        items: UnitEnum.values
                            .map(
                              (e) => DropdownMenuItem<UnitEnum>(
                                value: e,
                                child: CustomText(
                                  unitEnumToStr(e),
                                  size: 12,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 50,
                        child: CustomTextField(
                          controller: unitController.searchController,
                          label: "Search",
                          onChange: (String value) {
                            unitController.searchUnit(value);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: CustomScreenUtility(context).height * 0.8,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      SizedBox(
                        width: CustomScreenUtility(context).width * 0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  onPressed: () {
                                    unitController.getAllUnits();
                                    unitController.searchedUnitList.clear();
                                    unitController.update();
                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: unitController.symbolController,
                              autofocus: true,
                              focusNode: unitController.symbolNode,
                              label: "Enter Symbol",
                              onEditingComplete: () {
                                unitController.formalNameNode.requestFocus();
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: unitController.formalNameController,
                              label: "Enter Formal Name",
                              focusNode: unitController.formalNameNode,
                              onEditingComplete: unitController.addUnit,
                            ),
                            const SizedBox(height: 20),
                            OperationButtons(
                              onAdd: unitController.addUnit,
                              onClear: () {
                                unitController.clearTextField();
                                unitController.setSelectedUnitModel(null);
                              },
                              onDelete: unitController.deleteUnit,
                              onUpdate: unitController.updateUnit,
                            )
                          ],
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
                                    children: UnitEnum.values
                                        .map(
                                          (e) => CustomTableHeaderElement(
                                            width: CustomScreenUtility(
                                                  context,
                                                ).width *
                                                0.77 /
                                                UnitEnum.values.length,
                                            text: unitEnumToStr(e),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                GetBuilder<UnitController>(
                                  builder: (controller) {
                                    return Column(
                                      children: controller.unitModelList.isEmpty
                                          ? [
                                              const CustomText(
                                                "No Unit Record Exists",
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                size: 14,
                                              )
                                            ]
                                          : controller
                                                  .searchedUnitList.isNotEmpty
                                              ? controller.searchedUnitList
                                                  .map(
                                                    (e) => buildInkWell(
                                                      e,
                                                      controller,
                                                    ),
                                                  )
                                                  .toList()
                                              : controller.unitModelList
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInkWell(UnitModel e, UnitController controller) {
    return InkWell(
      onTap: () {
        controller.onUnitTap(e);
      },
      child: Container(
        color: controller.selectedUnitModel == e
            ? Colors.grey[300]
            : controller.unitModelList.indexOf(e) % 2 == 0
                ? Colors.white
                : Colors.grey[200],
        child: Row(
          children: [
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  UnitEnum.values.length,
              text: e.symbol!,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  UnitEnum.values.length,
              text: e.formalName!,
            ),
            CustomTableElement(
              width: CustomScreenUtility(context).width *
                  0.77 /
                  UnitEnum.values.length,
              // text: validate,
              text: getFormattedDate(e.dateTime!),
            ),
          ],
        ),
      ),
    );
  }
}
