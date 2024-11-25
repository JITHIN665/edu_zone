// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectsImpl _$$SubjectsImplFromJson(Map<String, dynamic> json) =>
    _$SubjectsImpl(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$SubjectsImplToJson(_$SubjectsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
    };
