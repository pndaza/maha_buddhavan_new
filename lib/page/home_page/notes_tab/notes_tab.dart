import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './notes_tab_view_controller.dart';
import '../../../model/note.dart';
import '../../../widget/substring_highlight.dart';

class NotesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NoteSearchField(), NoteListView()],
    );
  }
}

class NoteSearchField extends StatelessWidget {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        textInputAction: TextInputAction.done,
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: 'Search',
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
        ),
        onChanged: (value) {
          context.read(noteStateProvider).filter(value);
        },
        // onSubmitted: (_) => textEditingController.clear(),
      ),
    );
  }
}

class NoteListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final state = watch(noteStateProvider.state);
    return Expanded(
        child: Container(
            alignment: Alignment.center,
            child: state.when(
                loading: () => CircularProgressIndicator(),
                data: _buildList,
                noData: (message) => Text(message))));
  }

  Widget _buildList(List<Note> notes) {
    final scrollController = ScrollController();
    return DraggableScrollbar.semicircle(
      controller: scrollController,
          child: ListView.separated(
        controller: scrollController,
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteTile(note: notes[index]);
        },
        separatorBuilder: (context, index) => Divider(
          thickness: 1,
        ),
      ),
    );
  }
}

class NoteTile extends StatelessWidget {
  const NoteTile({Key? key, required this.note}) : super(key: key);
  final Note note;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SubstringHighlight(
        text: '${note.title}',
        term: context.read(filterWordProvider).state,
        textStyle: Theme.of(context).textTheme.headline6!,
        textStyleHighlight: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
      ),
      onTap: () => context
          .read(noteStateProvider)
          .open(context, note.bookID, note.pageNumber),
    );
  }
}
