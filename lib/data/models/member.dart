import 'package:band_scheduler/data/models/input_mode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
abstract class Member with _$Member {
  const factory Member({
    required String uid,
    required String displayName,
    required String email,
    required InputMode defaultInputMode,
    required DateTime joinedAt,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
