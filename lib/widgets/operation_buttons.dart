import 'package:flutter/material.dart';

import 'custom_button.dart';

class OperationButtons extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;
  final VoidCallback onClear;
  const OperationButtons({
    Key? key,
    required this.onAdd,
    required this.onClear,
    required this.onDelete,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 15,
      runSpacing: 15,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        CustomButton(
          icon: Icons.add,
          text: "F5.Add",
          onTap: onAdd,
        ),
        CustomButton(
          icon: Icons.clear,
          text: "F6.Clear",
          onTap: onClear,
          buttonColor: Colors.yellow[800],
        ),
        CustomButton(
          icon: Icons.update,
          text: "F7.Update",
          onTap: onUpdate,
          buttonColor: Colors.green[300],
        ),
        CustomButton(
          icon: Icons.delete,
          text: "F8.Delete",
          onTap: onDelete,
          buttonColor: Colors.red,
        ),
      ],
    );
  }
}
