import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/kajja-button/kajja_button.dart';
import '../../../widgets/text_field.dart';

class KajjaButtonBilling extends StatefulWidget {
  const KajjaButtonBilling({Key? key}) : super(key: key);

  @override
  _KajjaButtonBillingState createState() => _KajjaButtonBillingState();
}

class _KajjaButtonBillingState extends State<KajjaButtonBilling> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KajjaButtonController>(
      init: KajjaButtonController(),
      builder: (controller) {
        return Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: CustomScreenUtility(context).width * 0.3,
                    child: CustomTFWithKeyboard(
                      keyboardNode: controller.invoiceNoKeyboardNode,
                      focusNode: controller.invoiceNoNode,
                      controller: controller.invoiceNoController,
                      autofocus: true,
                      label: "Innvoice No",
                      textInputType: TextInputType.number,
                      onEditingComplete: () {},
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
