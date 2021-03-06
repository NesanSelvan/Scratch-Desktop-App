import 'package:annai_store/core/db/copy.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../controller/billing/sales/sales.dart';
import '../../../controller/paths/paths.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({Key? key}) : super(key: key);

  @override
  _DatabaseScreenState createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: CustomScreenUtility(context).width,
      height: CustomScreenUtility(context).height,
      child: GetBuilder<PathController>(
        init: PathController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const CustomText(
                  "Database Management",
                  size: 24,
                  fontWeight: FontWeight.bold,
                ),
                CustomTextButton(
                  "Clear All Voucher",
                  onPressed: () {
                    voucherDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Category",
                  onPressed: () async {
                    await categoryDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Customer",
                  onPressed: () async {
                    await customerDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Employee",
                  onPressed: () async {
                    await employeeDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Company",
                  onPressed: () async {
                    await companyDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Product",
                  onPressed: () async {
                    await productDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Sales",
                  onPressed: () async {
                    await salesDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Quotation",
                  onPressed: () async {
                    await quotationDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Stock",
                  onPressed: () async {
                    await stocksDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Thread Company",
                  onPressed: () async {
                    await threadCompanyDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Orders",
                  onPressed: () async {
                    await orderDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Estimate",
                  onPressed: () async {
                    await estimateDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Receipt",
                  onPressed: () async {
                    await receiptDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Voucher",
                  onPressed: () async {
                    await voucherDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Purchase",
                  onPressed: () async {
                    await purchaseDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Payment",
                  onPressed: () async {
                    await paymentDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Bank",
                  onPressed: () async {
                    await bankDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Clear All Company",
                  onPressed: () async {
                    await companyDB.clearAll();
                  },
                ),
                CustomTextButton(
                  "Copy All except Path",
                  onPressed: () async {
                    final file = OpenFilePicker()
                      ..filterSpecification = {'All Files': '*.*'}
                      ..defaultFilterIndex = 0
                      ..defaultExtension = 'doc'
                      ..title = 'Select a document';

                    final result = file.getFile();
                    if (result != null) {
                      debugPrint(result.path);
                      await CopyDB.copyDB(result.path.split(r'\').last);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
