import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'notes_tab_state.dart';
import '../../reader_page/book_reader.dart';
import '../../../model/note.dart';
import '../../../repository/notes_repository.dart';


final noteRepoProvider = Provider((ref) => JsonNoteRepository());
final allNotes = StateProvider<List<Note>?>((ref) => null);
final filterWordProvider = StateProvider((ref) => '');
final noteStateProvider = StateNotifierProvider<NotesViewController>(
    (ref) => NotesViewController(ref.read));


class NotesViewController extends StateNotifier<NoteState> {
  final Reader read;
  NotesViewController(this.read) : super(NoteState.loading()) {
    _initState();
  }

  _initState() async {
    state = NoteState.loading();
    final notes = await read(noteRepoProvider).fetchNote();
    read(allNotes).state = notes;
    state = NoteState.data(notes);
  }

  void filter(String filterWord) {
    if (filterWord.trim().isEmpty || read(allNotes).state == null) {
      state = NoteState.data(read(allNotes).state!);
    }
    final filterdNotes = read(allNotes)
        .state!
        .where((note) => note.title.contains(filterWord))
        .toList();
    if (filterdNotes.length > 0) {
      state = NoteState.data(filterdNotes);
      read(filterWordProvider).state = filterWord;
    } else {
      state = NoteState.noData('မတွေ့ပါ');
    }
  }

  void open(BuildContext context, int bookID, int pageNumber) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookReader(
                  id: bookID,
                  pageNumber: pageNumber,
                )));
  }
}
