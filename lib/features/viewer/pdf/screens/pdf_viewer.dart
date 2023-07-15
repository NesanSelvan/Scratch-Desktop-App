import 'dart:io';
import 'dart:typed_data';

import 'package:annai_store/features/viewer/pdf/cubit/pdf_viewer_cubit.dart';
import 'package:annai_store/widgets/cusom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  final Uint8List? pdfBuffer;
  final String? filePath;
  final String fileName;
  const PdfViewer({
    super.key,
    this.filePath,
    this.pdfBuffer,
    required this.fileName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PdfViewerCubit(),
      child: _ViewPDF(
        filePath: filePath,
        pdfBuffer: pdfBuffer,
        fileName: fileName,
      ),
    );
  }
}

class _ViewPDF extends StatelessWidget {
  const _ViewPDF({
    required this.filePath,
    required this.pdfBuffer,
    required this.fileName,
  });

  final String? filePath;
  final Uint8List? pdfBuffer;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText('PDF Viewer ($fileName)'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const CustomIcon(Icons.save_alt),
            onPressed: () async {
              if (pdfBuffer != null) {
                try {
                  final path = await context
                      .read<PdfViewerCubit>()
                      .bufferToSaveFile(pdfBuffer!, fileName);
                } catch (e) {}
              }
            },
          ),
          IconButton(
            icon: const CustomIcon(Icons.print),
            onPressed: () async {
              await context.read<PdfViewerCubit>().printPDF(pdfBuffer!);
            },
          ),
        ],
      ),
      body: filePath != null
          ? SfPdfViewer.file(File(filePath!))
          : pdfBuffer != null
              ? SfPdfViewer.memory(pdfBuffer!)
              : const SizedBox(),
    );
  }
}
