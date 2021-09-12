import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  const factory Note({
    required int id,
    required String title,
    required int bookID,
    required int pageNumber,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  // Map<String, dynamic> toJson() => _$NoteToJson(this);
}
