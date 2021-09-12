import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maha_buddhavan/page/reader_page/reader_appbar.dart';
import 'package:maha_buddhavan/widget/pdf_controller.dart';
import 'package:maha_buddhavan/widget/pdf_viewer.dart';
import 'package:maha_buddhavan/page/reader_page/reader_view_controller.dart';

class BookReader extends StatelessWidget {
  final int id;
  final int pageNumber;

  const BookReader({Key? key, required this.id, this.pageNumber = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pdfController = PdfController(intialPage: this.pageNumber);

    return Scaffold(
      appBar: ReaderAppBar(
        bookID: id,
        pdfController: pdfController,
      ),
      body: GestureDetector(
        onTap: () {
          context.read(readerViewController).toggleFullScreenMode();
        },
        child: Consumer(
          builder: (context, watch, child) {
            final _scrollDirection = watch(scrollDirectionProvider).state;
            return MyPdfViewer(
              assetPath: 'assets/books/pdf/$id.pdf',
              scrollDirection: _scrollDirection,
              pdfController: pdfController,
              // onPageChanged: (pageNumber) => onPageChanged(context, pageNumber),
              onPageChanged: (pageNumber) => context
                  .read(readerViewController)
                  .saveRecentPage(id, pageNumber),
            );
          },
        ),
      ),
    );
  }
}
