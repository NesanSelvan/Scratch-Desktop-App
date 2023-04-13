import 'dart:developer';
import 'dart:typed_data';

import 'package:annai_store/utils/folder/folder.dart';
import 'package:annai_store/utils/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:printing/printing.dart';

part 'pdf_viewer_state.dart';

class PdfViewerCubit extends Cubit<PdfViewerState> {
  PdfViewerCubit() : super(PdfViewerInitial());

  Future<String> bufferToSaveFile(Uint8List buffer, String fileName) async {
    final folderPath = await FolderUtility.getFolderDirectoryPath();
    log("folder: $folderPath");
    return Utility.bufferToFile(buffer, "$folderPath/$fileName.pdf");
  }

  Future<void> printPDF(Uint8List buffer) async {
    await Printing.layoutPdf(onLayout: (_) => buffer);
  }
}
