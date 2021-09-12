import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maha_buddhavan/client/shared_pref_client.dart';

import '../../../model/book.dart';
import '../../../repository/book_repository.dart';
import '../../reader_page/book_reader.dart';
import 'bookshelf_state.dart';

final booksRepoProvider = Provider((ref) => JsonBookRepository());
final bookshelfViewController =
    StateNotifierProvider<BookShelfViewController>((ref) {
  final repository = ref.read(booksRepoProvider);
  return BookShelfViewController(repository);
});

class BookShelfViewController extends StateNotifier<BookShelfState> {
  BookShelfViewController(this.repository) : super(BookShelfState.loading()) {
    _init();
  }
  final BookRepository repository;

  Future<void> _init() async {
    state = BookShelfState.loading();
    final books = await repository.fetchBooks();
    state = BookShelfState.loaded(books);
  }

  Future<void> open({required BuildContext context, required Book book}) async {
    final pageNumber =
        await context.read(sharedPreferenceClient).getRecentPage(book.id);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookReader(
                  id: book.id,
                  pageNumber: pageNumber,
                )));
  }
}
