import 'package:annai_store/widgets/cusom_text.dart';
import 'package:annai_store/utils/snackbar/snackbar.dart';

import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/material.dart';

import '../../utils/backup/backup.dart';

class BackupScreen extends StatefulWidget {
  const BackupScreen({Key? key}) : super(key: key);

  @override
  _BackupScreenState createState() => _BackupScreenState();
}

class _BackupScreenState extends State<BackupScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: CustomScreenUtility(context).width,
      height: CustomScreenUtility(context).height,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BackUpContainer(
            onPressed: () async {
              final filePicker = OpenFilePicker();

              final file = filePicker.getFile();
              if (file != null) {
                // debugPrint("File : ${file.path.split(pattern)}");
                await BackupUtility().backup(file.path.split(r'\').first);
              }
            },
            text: "Backup",
            icon: Icons.backup,
            iconColor: Colors.green[400]!,
          ),
          const SizedBox(width: 20),
          BackUpContainer(
            onPressed: () async {
              final filePicker = OpenFilePicker();

              final file = filePicker.getFile();
              if (file != null) {
                // debugPrint("File : ${file.path.split(pattern)}");
                await BackupUtility().restore(file.path.split(r'\').first);
              }
            },
            text: "Restore",
            icon: Icons.restore,
            iconColor: Colors.red[400]!,
          ),
        ],
      ),
    );
  }
}

class BackUpContainer extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color iconColor;
  const BackUpContainer({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: CustomScreenUtility(context).height * 0.3,
        height: CustomScreenUtility(context).height * 0.3,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 128, color: iconColor),
            CustomText(
              text,
              color: Colors.grey[700],
              size: 28,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
