import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:maha_buddhavan/model/toc.dart';

abstract class TocRepository {
  Future<List<Toc>> fetchTocs(int bookID);
}

class JsonTocRepository extends TocRepository {
  @override
  Future<List<Toc>> fetchTocs(int bookID) async {
    final assetsPath = 'assets/books/toc/$bookID.json';
    final jsonString = await rootBundle.loadString(assetsPath);
    return (json.decode(jsonString) as List)
        .map((toc) => Toc.fromJson(toc))
        .toList();
  }
}
