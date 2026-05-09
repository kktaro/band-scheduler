import 'package:band_scheduler/data/models/auth_user.dart';
import 'package:band_scheduler/data/models/busy_slot.dart';
import 'package:band_scheduler/data/models/member.dart';
import 'package:band_scheduler/data/models/practice.dart';
import 'package:band_scheduler/data/repositories/auth_repository.dart';
import 'package:band_scheduler/data/repositories/busy_slots_repository.dart';
import 'package:band_scheduler/data/repositories/members_repository.dart';
import 'package:band_scheduler/data/repositories/practices_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// MVP では単一バンド固定運用。Phase 3 でマルチテナント化する想定。
const defaultBandId = 'default';

final bandIdProvider = Provider<String>((ref) => defaultBandId);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => FakeAuthRepository(),
);

final membersRepositoryProvider = Provider<MembersRepository>(
  (ref) => InMemoryMembersRepository(),
);

final busySlotsRepositoryProvider = Provider<BusySlotsRepository>(
  (ref) => InMemoryBusySlotsRepository(),
);

final practicesRepositoryProvider = Provider<PracticesRepository>(
  (ref) => InMemoryPracticesRepository(),
);

final currentUserProvider = StreamProvider<AuthUser?>((ref) {
  return ref.watch(authRepositoryProvider).watchCurrentUser();
});

final membersStreamProvider = StreamProvider<List<Member>>((ref) {
  final bandId = ref.watch(bandIdProvider);
  return ref.watch(membersRepositoryProvider).watch(bandId);
});

final busySlotsStreamProvider = StreamProvider<List<BusySlot>>((ref) {
  final bandId = ref.watch(bandIdProvider);
  return ref.watch(busySlotsRepositoryProvider).watch(bandId);
});

final practicesStreamProvider = StreamProvider<List<Practice>>((ref) {
  final bandId = ref.watch(bandIdProvider);
  return ref.watch(practicesRepositoryProvider).watch(bandId);
});
