// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'toc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Toc _$TocFromJson(Map<String, dynamic> json) {
  return _Toc.fromJson(json);
}

/// @nodoc
class _$TocTearOff {
  const _$TocTearOff();

  _Toc call(
      {required int id,
      required String title,
      required int tocLevel,
      required int pageNumber}) {
    return _Toc(
      id: id,
      title: title,
      tocLevel: tocLevel,
      pageNumber: pageNumber,
    );
  }

  Toc fromJson(Map<String, Object> json) {
    return Toc.fromJson(json);
  }
}

/// @nodoc
const $Toc = _$TocTearOff();

/// @nodoc
mixin _$Toc {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get tocLevel => throw _privateConstructorUsedError;
  int get pageNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TocCopyWith<Toc> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TocCopyWith<$Res> {
  factory $TocCopyWith(Toc value, $Res Function(Toc) then) =
      _$TocCopyWithImpl<$Res>;
  $Res call({int id, String title, int tocLevel, int pageNumber});
}

/// @nodoc
class _$TocCopyWithImpl<$Res> implements $TocCopyWith<$Res> {
  _$TocCopyWithImpl(this._value, this._then);

  final Toc _value;
  // ignore: unused_field
  final $Res Function(Toc) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? tocLevel = freezed,
    Object? pageNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tocLevel: tocLevel == freezed
          ? _value.tocLevel
          : tocLevel // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TocCopyWith<$Res> implements $TocCopyWith<$Res> {
  factory _$TocCopyWith(_Toc value, $Res Function(_Toc) then) =
      __$TocCopyWithImpl<$Res>;
  @override
  $Res call({int id, String title, int tocLevel, int pageNumber});
}

/// @nodoc
class __$TocCopyWithImpl<$Res> extends _$TocCopyWithImpl<$Res>
    implements _$TocCopyWith<$Res> {
  __$TocCopyWithImpl(_Toc _value, $Res Function(_Toc) _then)
      : super(_value, (v) => _then(v as _Toc));

  @override
  _Toc get _value => super._value as _Toc;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? tocLevel = freezed,
    Object? pageNumber = freezed,
  }) {
    return _then(_Toc(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tocLevel: tocLevel == freezed
          ? _value.tocLevel
          : tocLevel // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Toc implements _Toc {
  const _$_Toc(
      {required this.id,
      required this.title,
      required this.tocLevel,
      required this.pageNumber});

  factory _$_Toc.fromJson(Map<String, dynamic> json) => _$_$_TocFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final int tocLevel;
  @override
  final int pageNumber;

  @override
  String toString() {
    return 'Toc(id: $id, title: $title, tocLevel: $tocLevel, pageNumber: $pageNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Toc &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.tocLevel, tocLevel) ||
                const DeepCollectionEquality()
                    .equals(other.tocLevel, tocLevel)) &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(tocLevel) ^
      const DeepCollectionEquality().hash(pageNumber);

  @JsonKey(ignore: true)
  @override
  _$TocCopyWith<_Toc> get copyWith =>
      __$TocCopyWithImpl<_Toc>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TocToJson(this);
  }
}

abstract class _Toc implements Toc {
  const factory _Toc(
      {required int id,
      required String title,
      required int tocLevel,
      required int pageNumber}) = _$_Toc;

  factory _Toc.fromJson(Map<String, dynamic> json) = _$_Toc.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  int get tocLevel => throw _privateConstructorUsedError;
  @override
  int get pageNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TocCopyWith<_Toc> get copyWith => throw _privateConstructorUsedError;
}
