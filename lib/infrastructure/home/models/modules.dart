import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'modules.freezed.dart';
part 'modules.g.dart';

@freezed
class Modules with _$Modules {
  const factory Modules({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
  }) = _Modules;

  factory Modules.fromJson(Map<String, Object?> json) =>
      _$ModulesFromJson(json);
}
