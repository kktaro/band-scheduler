import 'package:band_scheduler/data/models/busy_slot.dart';
import 'package:band_scheduler/data/models/input_mode.dart';
import 'package:band_scheduler/data/repositories/busy_slots_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'busy_slots_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BusySlotsRepository>()])
void main() {
  group('BusySlotsRepository (mockito)', () {
    test('add は呼び出された slot を委譲する', () async {
      final mock = MockBusySlotsRepository();
      final now = DateTime(2026, 5, 9, 10);
      final slot = BusySlot(
        id: 'slot-1',
        memberUid: 'demo-user',
        startAt: now,
        endAt: now.add(const Duration(hours: 2)),
        sourceInputMode: InputMode.unavailable,
        createdAt: now,
        updatedAt: now,
      );

      await mock.add('default', slot);

      verify(mock.add('default', slot)).called(1);
    });
  });
}
