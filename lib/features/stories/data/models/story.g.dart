// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryImpl _$$StoryImplFromJson(Map<String, dynamic> json) => _$StoryImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String? ?? '',
      by: json['by'] as String? ?? '',
      timestamp: (json['time'] as num?)?.toInt() ?? 0,
      url: json['url'] as String? ?? '',
      score: (json['score'] as num?)?.toInt() ?? 0,
      kids: (json['kids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
      type: json['type'] as String? ?? 'story',
    );

Map<String, dynamic> _$$StoryImplToJson(_$StoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'by': instance.by,
      'time': instance.timestamp,
      'url': instance.url,
      'score': instance.score,
      'kids': instance.kids,
      'type': instance.type,
    };
