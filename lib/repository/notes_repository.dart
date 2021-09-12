import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:maha_buddhavan/model/note.dart';

abstract class NoteRespository {
  Future<List<Note>> fetchNote();
}

class JsonNoteRepository extends NoteRespository {
  final assetsPath = 'assets/notes.json';
  @override
  Future<List<Note>> fetchNote() async {
    final String jsonString = await rootBundle.loadString(assetsPath);
    return (json.decode(jsonString) as List)
        .map((note) => Note.fromJson(note))
        .toList();
  }
}
