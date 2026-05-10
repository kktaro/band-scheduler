import 'package:freezed_annotation/freezed_annotation.dart';

part 'practice.freezed.dart';
part 'practice.g.dart';

@freezed
abstract class Practice with _$Practice {
  const factory Practice({
    required String id,
    required DateTime startAt,
    required DateTime endAt,
    required String studioName,
    required String memo,
    required String createdBy,
    required DateTime createdAt,
  }) = _Practice;

  factory Practice.fromJson(Map<String, dynamic> json) =>
      _$PracticeFromJson(json);
}
