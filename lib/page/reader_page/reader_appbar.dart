import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maha_buddhavan/page/reader_page/reader_view_controller.dart';
import 'package:maha_buddhavan/widget/pdf_controller.dart';

class ReaderAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final int bookID;
  final PdfController pdfController;

  const ReaderAppBar({required this.bookID, required this.pdfController});

  @override
  Widget build(BuildContext context, watch) {
    final bookName = watch(bookNameProvider(bookID));
    final scrollDirection = watch(scrollDirectionProvider).state;
    final isFullScreenMode = watch(fullScreenStateProvider).state;

    if (isFullScreenMode) {
      final statusBarHeight = MediaQuery.of(context).padding.top;
      return Container(
        height: statusBarHeight,
      );
    }

    return AppBar(
      title: bookName.maybeWhen(
        data: (title) => Text(title),
        orElse: () => Text(''),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(scrollDirection == Axis.vertical
                ? Icons.swap_horiz
                : Icons.swap_vert),
            onPressed: () async {
              context
                  .read(readerViewController)
                  .toggleScrollDirection(scrollDirection);
            }),
        IconButton(
            icon: Icon(Icons.list),
            onPressed: () async {
              context.read(readerViewController).showToc(
                  context: context,
                  bookID: bookID,
                  pdfController: pdfController);
            }),
      ],
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(AppBar().preferredSize.height);
  }
}
