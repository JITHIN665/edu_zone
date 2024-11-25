import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'subjects.freezed.dart';
part 'subjects.g.dart';

@freezed
class Subjects with _$Subjects {
  const factory Subjects({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'image') String? image,
  }) = _Subjects;

  factory Subjects.fromJson(Map<String, Object?> json) =>
      _$SubjectsFromJson(json);
}
