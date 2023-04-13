// ignore_for_file: depend_on_referenced_packages

import 'package:annai_store/utils/excel/statement.dart';
import 'package:annai_store/utils/folder/folder.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

/// The home page of the application which hosts the datagrid.
class ExcelViewer extends StatelessWidget {
  final Excel excel;
  final String fileName;
  const ExcelViewer({super.key, required this.excel, required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$fileName Excel',
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final datas = excel.encode();
              if (datas != null) {
                final folerPath = await FolderUtility.getFolderDirectoryPath();
                final path = "$folerPath/${fileName.toLowerCase()}.xlsx";
                await GenerateExcelSheetData.saveToExcelFile(
                  path,
                  datas,
                );
              }
            },
            icon: const Icon(
              Icons.save_alt,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Table(
          children: excel.tables.entries
              .expand((element) => element.value.rows)
              .toList()
              .map(
                (e) => TableRow(
                  children: e
                      .map(
                        (f) => TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              f?.value == null ? "" : "${f?.value}",
                              style: TextStyle(
                                fontSize: f?.cellStyle?.fontSize?.toDouble(),
                                fontWeight: (f?.cellStyle?.isBold == true)
                                    ? FontWeight.bold
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
