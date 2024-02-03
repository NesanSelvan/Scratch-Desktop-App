import 'package:annai_store/controller/billing/sales/sales.dart';
import 'package:annai_store/controller/paths/paths.dart';
import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/enum/paths/paths.dart';
import 'package:annai_store/utils/image/image.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/widgets/custom_table.dart';
import 'package:annai_store/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

class PathsScreen extends StatefulWidget {
  const PathsScreen({super.key});

  @override
  _PathsScreenState createState() => _PathsScreenState();
}

class _PathsScreenState extends State<PathsScreen> {
  Future<void> showUpdateDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const CustomText(
            "Update Paths",
            size: 14,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: const EdgeInsets.all(20),
          children: [
            GetBuilder<PathController>(
              init: PathController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      "Name",
                      size: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(controller.selectedPathModel.name),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      label: "Enter Path",
                      controller: controller.pathsController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                        "Update",
                        backgoundColor: kPrimaryColor,
                        textColor: Colors.white,
                        onPressed: () async {
                          await controller.updatePathModel();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showAddDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const CustomText(
            "Add Paths",
            size: 14,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: const EdgeInsets.all(20),
          children: [
            GetBuilder<PathController>(
              // init: PathController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: "Enter Name",
                      controller: controller.nameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      label: "Enter Path",
                      controller: controller.pathsController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                        "Add",
                        backgoundColor: kPrimaryColor,
                        textColor: Colors.white,
                        onPressed: () async {
                          await controller.addPathModel();
                          pathController.onInit();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }

  PathController pathController = Get.put(PathController());

  @override
  Widget build(BuildContext context) {
    pathController.onInit();
    return Container(
      width: CustomScreenUtility(context).width,
      height: CustomScreenUtility(context).height,
      child: GetBuilder<PathController>(
        init: PathController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      "Paths Management",
                      size: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        showAddDialog(context);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                FutureBuilder<List<Printer>>(
                  future: Printing.listPrinters(),
                  builder: (context, AsyncSnapshot<List<Printer>> snapshot) {
                    if (snapshot.hasData) {
                      return Wrap(
                        children: snapshot.data!
                            .map((e) => SelectableText("$e ,"))
                            .toList(),
                      );
                    }
                    return Container();
                  },
                ),
                Table(
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      children: [
                        CustomTableHeaderElement(
                          text: "Sr no.",
                          width: CustomScreenUtility(context).width / 4,
                        ),
                        CustomTableHeaderElement(
                          text: "Name",
                          width: CustomScreenUtility(context).width / 4,
                        ),
                        CustomTableHeaderElement(
                          text: "Paths",
                          width: CustomScreenUtility(context).width / 4,
                        ),
                        CustomTableHeaderElement(
                          text: "Action",
                          width: CustomScreenUtility(context).width / 4,
                        ),
                      ],
                    ),
                    ...controller.allPaths.map(
                      (e) => TableRow(
                        children: [
                          CustomTableElement(
                            text: "${pathsDB.getAllPath().indexOf(e) + 1}",
                            width: CustomScreenUtility(context).width / 4,
                          ),
                          CustomTableElement(
                            text: e.name,
                            width: CustomScreenUtility(context).width / 4,
                          ),
                          CustomTableElement(
                            text: e.path,
                            width: CustomScreenUtility(context).width / 4,
                          ),
                          Container(
                            width: CustomScreenUtility(context).width / 4,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    controller.setSelectedPathsModel = e;
                                    await showUpdateDialog(context);
                                  },
                                  child: const CustomIcon(Icons.edit),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () async {
                                    await pathsDB.deletePath(e);
                                    controller.performInit();
                                  },
                                  child: const CustomIcon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const CustomText("UPI QR Code Image"),
                    const SizedBox(width: 20),
                    if (controller.upiImage == null)
                      CustomTextButton(
                        "Add Images",
                        onPressed: () {
                          final result = ImageUtilities.openFilePicker();
                          if (result != null) {
                            controller.setImageInImagesList = result.path;
                          }
                        },
                      )
                    else
                      Row(
                        children: [
                          CustomText(controller.upiImage!),
                          CustomTextButton(
                            "Update To Path",
                            onPressed: () async {
                              final List<String> updatedImagesList =
                                  await ImageUtilities.moveImagesToSafeDir(
                                [controller.upiImage!],
                              );
                              controller.nameController.text =
                                  getStrFromPathEnum(PathEnum.UPIImage);
                              controller.pathsController.text =
                                  updatedImagesList.first;
                              controller.addPathModel();
                              controller.onInit();
                              controller.setImageInImagesList = null;
                            },
                          ),
                          CustomTextButton(
                            "Clear",
                            onPressed: () async {
                              controller.setImageInImagesList = null;
                            },
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
