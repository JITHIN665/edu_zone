// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideosImpl _$$VideosImplFromJson(Map<String, dynamic> json) => _$VideosImpl(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      videoType: json['video_type'] as String?,
      videoUrl: json['video_url'] as String?,
    );

Map<String, dynamic> _$$VideosImplToJson(_$VideosImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'video_type': instance.videoType,
      'video_url': instance.videoUrl,
    };
