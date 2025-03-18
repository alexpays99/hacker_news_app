import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required int id,
    required String title,
    required String by,
    @JsonKey(name: 'time') required int timestamp,
    String? url,
    @Default(0) int score,
    @Default(<int>[]) List<int> kids,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}