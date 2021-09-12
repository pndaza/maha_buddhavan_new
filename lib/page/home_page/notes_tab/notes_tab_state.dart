import 'package:flutter/material.dart';
import 'package:maha_buddhavan/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_tab_state.freezed.dart';

@freezed
class NoteState with _$Notes {
  const factory NoteState.loading() = _Loading;
  const factory NoteState.data(List<Note> notes) = _Data;
  const factory NoteState.noData(String message) = _NoData;
}
