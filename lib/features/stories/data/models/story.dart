import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required int id,
    @Default('') String title,
    @Default('') String by,
    @JsonKey(name: 'time') @Default(0) int timestamp,
    @Default('') String? url,
    @Default(0) int score,
    @Default(<int>[]) List<int> kids,
    @Default('story') String? type,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
