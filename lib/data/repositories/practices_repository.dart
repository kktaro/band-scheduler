import 'dart:async';

import 'package:band_scheduler/data/models/practice.dart';

abstract class PracticesRepository {
  Stream<List<Practice>> watch(String bandId);
  Future<void> add(String bandId, Practice practice);
  Future<void> delete(String bandId, String practiceId);
}

class InMemoryPracticesRepository implements PracticesRepository {
  InMemoryPracticesRepository();

  final Map<String, List<Practice>> _store = {};
  final Map<String, StreamController<List<Practice>>> _controllers = {};
  int _autoIdCounter = 0;

  StreamController<List<Practice>> _controllerFor(String bandId) {
    return _controllers.putIfAbsent(
      bandId,
      StreamController<List<Practice>>.broadcast,
    );
  }

  void _emit(String bandId) {
    final list = List<Practice>.unmodifiable(_store[bandId] ?? const []);
    _controllerFor(bandId).add(list);
  }

  @override
  Stream<List<Practice>> watch(String bandId) {
    final controller = _controllerFor(bandId);
    scheduleMicrotask(() => _emit(bandId));
    return controller.stream;
  }

  @override
  Future<void> add(String bandId, Practice practice) async {
    final list = _store.putIfAbsent(bandId, () => <Practice>[]);
    final id = practice.id.isEmpty
        ? 'practice-${++_autoIdCounter}'
        : practice.id;
    list.add(practice.copyWith(id: id));
    _emit(bandId);
  }

  @override
  Future<void> delete(String bandId, String practiceId) async {
    _store[bandId]?.removeWhere((p) => p.id == practiceId);
    _emit(bandId);
  }
}
