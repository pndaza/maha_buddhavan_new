import 'package:freezed_annotation/freezed_annotation.dart';

part 'toc.freezed.dart';
part 'toc.g.dart';

@freezed
class Toc with _$Toc {
  const factory Toc({required int id,required String title,required int tocLevel,required int pageNumber}) =
      _Toc;

  factory Toc.fromJson(Map<String, dynamic> json) => _$TocFromJson(json);
}
