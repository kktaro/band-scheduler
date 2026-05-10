// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'busy_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusySlot _$BusySlotFromJson(Map<String, dynamic> json) => _BusySlot(
  id: json['id'] as String,
  memberUid: json['memberUid'] as String,
  startAt: DateTime.parse(json['startAt'] as String),
  endAt: DateTime.parse(json['endAt'] as String),
  sourceInputMode: $enumDecode(_$InputModeEnumMap, json['sourceInputMode']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$BusySlotToJson(_BusySlot instance) => <String, dynamic>{
  'id': instance.id,
  'memberUid': instance.memberUid,
  'startAt': instance.startAt.toIso8601String(),
  'endAt': instance.endAt.toIso8601String(),
  'sourceInputMode': _$InputModeEnumMap[instance.sourceInputMode]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$InputModeEnumMap = {
  InputMode.available: 'available',
  InputMode.unavailable: 'unavailable',
};
