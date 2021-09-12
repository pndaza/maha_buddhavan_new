import 'package:freezed_annotation/freezed_annotation.dart';
import '../../model/pdf_info.dart';

part 'reader_state.freezed.dart';
@freezed
class ReaderState with _$ReaderState {
  const factory ReaderState.loading() = _Loading;
  const factory ReaderState.loaded(PdfInfo pdfInfo) = _Loaded;
}
