import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required int id,
    @Default('') String title,
    @Default('') String by,
    @Default(0) int timestamp,
    @Default('') String? url,
    @Default(0) int score,
    @Default(<int>[]) List<int> kids,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
