// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Note _$_$_NoteFromJson(Map<String, dynamic> json) {
  return _$_Note(
    id: json['id'] as int,
    title: json['title'] as String,
    bookID: json['bookID'] as int,
    pageNumber: json['pageNumber'] as int,
  );
}

Map<String, dynamic> _$_$_NoteToJson(_$_Note instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'bookID': instance.bookID,
      'pageNumber': instance.pageNumber,
    };
