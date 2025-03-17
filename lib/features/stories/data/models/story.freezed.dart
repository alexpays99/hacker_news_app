// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Story _$StoryFromJson(Map<String, dynamic> json) {
  return _Story.fromJson(json);
}

/// @nodoc
mixin _$Story {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get by => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  int get timestamp => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  List<int> get kids => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryCopyWith<Story> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) then) =
      _$StoryCopyWithImpl<$Res, Story>;
  @useResult
  $Res call(
      {int id,
      String title,
      String by,
      @JsonKey(name: 'time') int timestamp,
      String? url,
      int score,
      List<int> kids,
      String? type});
}

/// @nodoc
class _$StoryCopyWithImpl<$Res, $Val extends Story>
    implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? by = null,
    Object? timestamp = null,
    Object? url = freezed,
    Object? score = null,
    Object? kids = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      by: null == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      kids: null == kids
          ? _value.kids
          : kids // ignore: cast_nullable_to_non_nullable
              as List<int>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryImplCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$$StoryImplCopyWith(
          _$StoryImpl value, $Res Function(_$StoryImpl) then) =
      __$$StoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String by,
      @JsonKey(name: 'time') int timestamp,
      String? url,
      int score,
      List<int> kids,
      String? type});
}

/// @nodoc
class __$$StoryImplCopyWithImpl<$Res>
    extends _$StoryCopyWithImpl<$Res, _$StoryImpl>
    implements _$$StoryImplCopyWith<$Res> {
  __$$StoryImplCopyWithImpl(
      _$StoryImpl _value, $Res Function(_$StoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? by = null,
    Object? timestamp = null,
    Object? url = freezed,
    Object? score = null,
    Object? kids = null,
    Object? type = freezed,
  }) {
    return _then(_$StoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      by: null == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      kids: null == kids
          ? _value._kids
          : kids // ignore: cast_nullable_to_non_nullable
              as List<int>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryImpl implements _Story {
  const _$StoryImpl(
      {required this.id,
      this.title = '',
      this.by = '',
      @JsonKey(name: 'time') this.timestamp = 0,
      this.url = '',
      this.score = 0,
      final List<int> kids = const <int>[],
      this.type = 'story'})
      : _kids = kids;

  factory _$StoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String by;
  @override
  @JsonKey(name: 'time')
  final int timestamp;
  @override
  @JsonKey()
  final String? url;
  @override
  @JsonKey()
  final int score;
  final List<int> _kids;
  @override
  @JsonKey()
  List<int> get kids {
    if (_kids is EqualUnmodifiableListView) return _kids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kids);
  }

  @override
  @JsonKey()
  final String? type;

  @override
  String toString() {
    return 'Story(id: $id, title: $title, by: $by, timestamp: $timestamp, url: $url, score: $score, kids: $kids, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.by, by) || other.by == by) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(other._kids, _kids) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, by, timestamp, url,
      score, const DeepCollectionEquality().hash(_kids), type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryImplCopyWith<_$StoryImpl> get copyWith =>
      __$$StoryImplCopyWithImpl<_$StoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryImplToJson(
      this,
    );
  }
}

abstract class _Story implements Story {
  const factory _Story(
      {required final int id,
      final String title,
      final String by,
      @JsonKey(name: 'time') final int timestamp,
      final String? url,
      final int score,
      final List<int> kids,
      final String? type}) = _$StoryImpl;

  factory _Story.fromJson(Map<String, dynamic> json) = _$StoryImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get by;
  @override
  @JsonKey(name: 'time')
  int get timestamp;
  @override
  String? get url;
  @override
  int get score;
  @override
  List<int> get kids;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$StoryImplCopyWith<_$StoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
