// import 'package:custom/custom_text.dart';
// import 'package:flutter/material.dart';
// // import 'package:native_pdf_view/native_pdf_view.dart';

// class PdfViewer extends StatefulWidget {
//   final String filePath;
//   const PdfViewer({Key? key, required this.filePath}) : super(key: key);

//   @override
//   _PdfViewerState createState() => _PdfViewerState();
// }

// class _PdfViewerState extends State<PdfViewer> {
//   static const int _initialPage = 2;
//   int _actualPageNumber = _initialPage, _allPagesCount = 0;
//   bool isSampleDoc = true;
//   // PdfController? _pdfController;

//   @override
//   void initState() {
//     // _pdfController = PdfController(
//     //   document: PdfDocument.openFile(widget.filePath),
//     //   initialPage: _initialPage,
//     // );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // _pdfController!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         theme: ThemeData(primaryColor: Colors.white),
//         home: Scaffold(
//           appBar: AppBar(
//             title: const CustomText('PdfView'),
//             actions: <Widget>[
//               IconButton(
//                 icon: const CustomIcon(Icons.navigate_before),
//                 onPressed: () {
//                   // _pdfController!.previousPage(
//                   //   curve: Curves.ease,
//                   //   duration: const Duration(milliseconds: 100),
//                   // );
//                 },
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 child: CustomText(
//                   '$_actualPageNumber/$_allPagesCount',
//                 ),
//               ),
//               IconButton(
//                 icon: const CustomIcon(Icons.navigate_next),
//                 onPressed: () {
//                   // _pdfController!.nextPage(
//                   //   curve: Curves.ease,
//                   //   duration: const Duration(milliseconds: 100),
//                   // );
//                 },
//               ),
//               IconButton(
//                 icon: const CustomIcon(Icons.refresh),
//                 onPressed: () {
//                   // if (isSampleDoc) {
//                   //   _pdfController!
//                   //       .loadDocument(PdfDocument.openFile(widget.filePath));
//                   // } else {
//                   //   _pdfController!
//                   //       .loadDocument(PdfDocument.openFile(widget.filePath));
//                   // }
//                   // isSampleDoc = !isSampleDoc;
//                 },
//               )
//             ],
//           ),
//           body: Container(),
//           // body: PdfView(
//           //   documentLoader: const Center(child: CircularProgressIndicator()),
//           //   pageLoader: const Center(child: CircularProgressIndicator()),
//           //   controller: _pdfController!,
//           //   onDocumentLoaded: (document) {
//           //     setState(() {
//           //       _allPagesCount = document.pagesCount;
//           //     });
//           //   },
//           //   onPageChanged: (page) {
//           //     setState(() {
//           //       _actualPageNumber = page;
//           //     });
//           //   },
//           // ),
//         ),
//       );
// }
