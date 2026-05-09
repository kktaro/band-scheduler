// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Practice _$PracticeFromJson(Map<String, dynamic> json) => _Practice(
  id: json['id'] as String,
  startAt: DateTime.parse(json['startAt'] as String),
  endAt: DateTime.parse(json['endAt'] as String),
  studioName: json['studioName'] as String,
  memo: json['memo'] as String,
  createdBy: json['createdBy'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$PracticeToJson(_Practice instance) => <String, dynamic>{
  'id': instance.id,
  'startAt': instance.startAt.toIso8601String(),
  'endAt': instance.endAt.toIso8601String(),
  'studioName': instance.studioName,
  'memo': instance.memo,
  'createdBy': instance.createdBy,
  'createdAt': instance.createdAt.toIso8601String(),
};
