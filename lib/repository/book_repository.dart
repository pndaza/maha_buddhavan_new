import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:maha_buddhavan/model/book.dart';

abstract class BookRepository {
  Future<List<Book>> fetchBooks();
}

class JsonBookRepository extends BookRepository {
  final assetsPath = 'assets/books.json';
  @override
  Future<List<Book>> fetchBooks() async {
    final jsonString = await rootBundle.loadString(assetsPath);
    return (json.decode(jsonString) as List)
        .map((e) => Book.fromJson(e))
        .toList();
  }
}
