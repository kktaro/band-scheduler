// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Member _$MemberFromJson(Map<String, dynamic> json) => _Member(
  uid: json['uid'] as String,
  displayName: json['displayName'] as String,
  email: json['email'] as String,
  defaultInputMode: $enumDecode(_$InputModeEnumMap, json['defaultInputMode']),
  joinedAt: DateTime.parse(json['joinedAt'] as String),
);

Map<String, dynamic> _$MemberToJson(_Member instance) => <String, dynamic>{
  'uid': instance.uid,
  'displayName': instance.displayName,
  'email': instance.email,
  'defaultInputMode': _$InputModeEnumMap[instance.defaultInputMode]!,
  'joinedAt': instance.joinedAt.toIso8601String(),
};

const _$InputModeEnumMap = {
  InputMode.available: 'available',
  InputMode.unavailable: 'unavailable',
};
