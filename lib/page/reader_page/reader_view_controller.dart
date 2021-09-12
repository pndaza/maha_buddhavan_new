import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maha_buddhavan/client/shared_pref_client.dart';
import 'package:maha_buddhavan/main.dart';
import 'package:maha_buddhavan/model/toc.dart';
import 'package:maha_buddhavan/page/home_page/bookshelf_tab/bookshelf_view_controller.dart';
import 'package:maha_buddhavan/widget/pdf_controller.dart';
import 'package:maha_buddhavan/page/reader_page/toc_dialog.dart';
import 'package:maha_buddhavan/repository/toc_repository.dart';

final fullScreenStateProvider = StateProvider((_) => false);
final appBarHeight = StateProvider<double>((ref) {
  final isFullScreen = ref.watch(fullScreenStateProvider).state;
  return isFullScreen ? 0 : 56.0;
});
final scrollDirectionProvider = StateProvider<Axis>((ref) {
  return ref.read(sharedPreferenceClient).getScrollDirection();
});
final tocRepoProvider = Provider((ref) => JsonTocRepository());

final bookNameProvider = FutureProvider.family<String, int>((ref, id) async {
  final bookRepo = ref.read(booksRepoProvider);
  final books = await bookRepo.fetchBooks();
  return books.where((book) => book.id == id).first.name;
});

final readerViewController = Provider<ReaderViewController>(
    (ref) => ReaderViewController(read: ref.read));

class ReaderViewController {
  final Reader read;
  ReaderViewController({required this.read});

  late final PdfController? _pdfController;

  Future<List<Toc>> getTocs(int bookID) async {
    return await read(tocRepoProvider).fetchTocs(bookID);
  }

  void showToc(
      {required BuildContext context,
      required int bookID,
      required PdfController pdfController}) async {
    final tocs = await getTocs(bookID);
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return TocDialog(tocs: tocs, pdfController: pdfController);
      },
      animationType: DialogTransitionType.slideFromRightFade,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 400),
    );
  }

  Future<String> getBookName(int id) async {
    final repo = read(booksRepoProvider);
    final books = await repo.fetchBooks();
    return books.where((book) => book.id == id).first.name;
  }

  void jumpTo({required BuildContext context, required int pageNumber}) {
    Navigator.pop(context);
    _pdfController!.gotoPage(pageNumber - 1);
    myLogger.i('page number: $pageNumber');
  }

  Future<void> toggleScrollDirection(Axis scrollDirection) async {
    if (scrollDirection == Axis.vertical) {
      read(scrollDirectionProvider).state = Axis.horizontal;
      read(sharedPreferenceClient).saveScrollDirection(Axis.horizontal);
    } else {
      read(scrollDirectionProvider).state = Axis.vertical;
      read(sharedPreferenceClient).saveScrollDirection(Axis.vertical);
    }
  }

  void toggleFullScreenMode() {
    final screenMode = read(fullScreenStateProvider).state;
    read(fullScreenStateProvider).state = !screenMode;
  }

  void saveRecentPage(int bookID, int pageNumber) {
    read(sharedPreferenceClient).saveRecentPage(bookID, pageNumber);
  }
}
