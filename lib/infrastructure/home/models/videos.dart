import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'videos.freezed.dart';
part 'videos.g.dart';

@freezed
class Videos with _$Videos {
  const factory Videos({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'video_type') String? videoType,
    @JsonKey(name: 'video_url') String? videoUrl,
  }) = _Videos;

  factory Videos.fromJson(Map<String, Object?> json) => _$VideosFromJson(json);
}
