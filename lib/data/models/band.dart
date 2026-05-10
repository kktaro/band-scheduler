import 'package:freezed_annotation/freezed_annotation.dart';

part 'band.freezed.dart';
part 'band.g.dart';

@freezed
abstract class Band with _$Band {
  const factory Band({
    required String id,
    required String name,
    required String leaderUid,
    required List<String> memberUids,
    required DateTime createdAt,
  }) = _Band;

  factory Band.fromJson(Map<String, dynamic> json) => _$BandFromJson(json);
}
