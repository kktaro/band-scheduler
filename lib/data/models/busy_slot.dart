import 'package:band_scheduler/data/models/input_mode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'busy_slot.freezed.dart';
part 'busy_slot.g.dart';

@freezed
abstract class BusySlot with _$BusySlot {
  const factory BusySlot({
    required String id,
    required String memberUid,
    required DateTime startAt,
    required DateTime endAt,
    required InputMode sourceInputMode,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BusySlot;

  factory BusySlot.fromJson(Map<String, dynamic> json) =>
      _$BusySlotFromJson(json);
}
