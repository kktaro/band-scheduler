import 'dart:async';

import 'package:band_scheduler/data/models/busy_slot.dart';
import 'package:band_scheduler/data/models/input_mode.dart';

abstract class BusySlotsRepository {
  Stream<List<BusySlot>> watch(String bandId);
  Future<void> add(String bandId, BusySlot slot);
  Future<void> delete(String bandId, String slotId);
}

class InMemoryBusySlotsRepository implements BusySlotsRepository {
  InMemoryBusySlotsRepository({bool seed = true}) {
    if (seed) {
      _seed();
    }
  }

  final Map<String, List<BusySlot>> _store = {};
  final Map<String, StreamController<List<BusySlot>>> _controllers = {};
  int _autoIdCounter = 0;

  void _seed() {
    final today = DateTime.now();
    final monday = today.subtract(Duration(days: today.weekday - 1));
    final base = DateTime(monday.year, monday.month, monday.day);
    final now = DateTime.now();

    _store['default'] = [
      BusySlot(
        id: 'seed-1',
        memberUid: 'member-2',
        startAt: base.add(const Duration(days: 1, hours: 9)),
        endAt: base.add(const Duration(days: 1, hours: 18)),
        sourceInputMode: InputMode.unavailable,
        createdAt: now,
        updatedAt: now,
      ),
      BusySlot(
        id: 'seed-2',
        memberUid: 'member-3',
        startAt: base.add(const Duration(days: 1, hours: 9)),
        endAt: base.add(const Duration(days: 1, hours: 14)),
        sourceInputMode: InputMode.unavailable,
        createdAt: now,
        updatedAt: now,
      ),
      BusySlot(
        id: 'seed-3',
        memberUid: 'demo-user',
        startAt: base.add(const Duration(days: 2, hours: 13)),
        endAt: base.add(const Duration(days: 2, hours: 17)),
        sourceInputMode: InputMode.available,
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }

  StreamController<List<BusySlot>> _controllerFor(String bandId) {
    return _controllers.putIfAbsent(
      bandId,
      StreamController<List<BusySlot>>.broadcast,
    );
  }

  void _emit(String bandId) {
    final list = List<BusySlot>.unmodifiable(_store[bandId] ?? const []);
    _controllerFor(bandId).add(list);
  }

  @override
  Stream<List<BusySlot>> watch(String bandId) {
    final controller = _controllerFor(bandId);
    scheduleMicrotask(() => _emit(bandId));
    return controller.stream;
  }

  @override
  Future<void> add(String bandId, BusySlot slot) async {
    final list = _store.putIfAbsent(bandId, () => <BusySlot>[]);
    final id = slot.id.isEmpty ? 'slot-${++_autoIdCounter}' : slot.id;
    list.add(slot.copyWith(id: id));
    _emit(bandId);
  }

  @override
  Future<void> delete(String bandId, String slotId) async {
    _store[bandId]?.removeWhere((s) => s.id == slotId);
    _emit(bandId);
  }
}
