import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maha_buddhavan/model/book.dart';

part 'bookshelf_state.freezed.dart';
@freezed
class BookShelfState with _$BookShelfState{
  const factory BookShelfState.loading() = _Loading;
  const factory BookShelfState.loaded(List<Book> books) = _Loaded;
}