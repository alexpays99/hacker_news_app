// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      createdTimestamp: (json['created'] as num).toInt(),
      about: json['about'] as String?,
      submitted: (json['submitted'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
      karma: (json['karma'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.createdTimestamp,
      'about': instance.about,
      'submitted': instance.submitted,
      'karma': instance.karma,
    };
