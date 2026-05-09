// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'band.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Band _$BandFromJson(Map<String, dynamic> json) => _Band(
  id: json['id'] as String,
  name: json['name'] as String,
  leaderUid: json['leaderUid'] as String,
  memberUids: (json['memberUids'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$BandToJson(_Band instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'leaderUid': instance.leaderUid,
  'memberUids': instance.memberUids,
  'createdAt': instance.createdAt.toIso8601String(),
};
