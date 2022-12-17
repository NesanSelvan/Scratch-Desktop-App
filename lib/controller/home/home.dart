import 'package:annai_store/screens/billing/sales/sales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // AddEnum addEnum = AddEnum.Product;

  Widget? currentSelectedWidget = SalesScreen();
  List<Widget> listSelectedWidget = [SalesScreen()];
  @override
  void onInit() {
    currentSelectedWidget = SalesScreen();
    super.onInit();
  }

  // void updateAddEnum(AddEnum add) {
  //   addEnum = add;
  //   update();
  // }

  FocusNode menuFocus = FocusNode();

  void focusMenu() {
    menuFocus.requestFocus();
    debugPrint("Focusing Menu");
    update();
  }

  void setCurrentSelectedWidget(Widget widget) {
    currentSelectedWidget = widget;
    if (!listSelectedWidget.contains(widget)) listSelectedWidget.add(widget);
    debugPrint('currentSelectedWidget $currentSelectedWidget');
    update();
  }

  void backKeyPressed() {
    if (listSelectedWidget.length != 1) {
      listSelectedWidget.removeLast();
      currentSelectedWidget = listSelectedWidget.last;
    }
    update();
  }

  List<LogicalKeyboardKey> clickedKeys = [];

  void updateKeys(LogicalKeyboardKey logicalKeyboardKey) {
    if (!clickedKeys.contains(logicalKeyboardKey)) {
      clickedKeys.add(logicalKeyboardKey);
    }
  }

  // Widget handleAddEnumKeyboardControl() {
  //   int index = 0;
  //   if (addEnum.index == 0) {
  //     index = AddEnum.values.length - 1;
  //   } else {
  //     index = addEnum.index - 1;
  //   }
  //   final add = AddEnum.values[index];
  //   updateAddEnum(add);
  //   return getWidgetOfAdd(add);
  // }

  // void performKeyboardClickedAction() {
  //   if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
  //       clickedKeys.contains(LogicalKeyboardKey.arrowUp)) {
  //     debugPrint('Add Enum ${addEnum.index} ');
  //     final widget = handleAddEnumKeyboardControl();
  //     debugPrint('Widget $widget');
  //     setCurrentSelectedWidget(widget);
  //   }
  //   if (clickedKeys.contains(LogicalKeyboardKey.controlLeft) &&
  //       clickedKeys.contains(LogicalKeyboardKey.arrowRight)) {
  //     debugPrint('Add Product ');
  //     setCurrentSelectedWidget(AddProductScreen());
  //   }
  //   clickedKeys.clear();
  // }

}
