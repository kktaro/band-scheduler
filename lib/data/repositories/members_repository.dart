import 'dart:async';

import 'package:band_scheduler/data/models/input_mode.dart';
import 'package:band_scheduler/data/models/member.dart';

abstract class MembersRepository {
  Stream<List<Member>> watch(String bandId);
  Future<void> upsert(String bandId, Member member);
  Future<void> remove(String bandId, String uid);
}

class InMemoryMembersRepository implements MembersRepository {
  InMemoryMembersRepository() {
    _seed();
  }

  final Map<String, List<Member>> _store = {};
  final Map<String, StreamController<List<Member>>> _controllers = {};

  void _seed() {
    final now = DateTime.now();
    _store['default'] = [
      Member(
        uid: 'demo-user',
        displayName: 'リーダー (you)',
        email: 'demo@example.com',
        defaultInputMode: InputMode.unavailable,
        joinedAt: now,
      ),
      Member(
        uid: 'member-2',
        displayName: 'ギター',
        email: 'guitar@example.com',
        defaultInputMode: InputMode.available,
        joinedAt: now,
      ),
      Member(
        uid: 'member-3',
        displayName: 'ベース',
        email: 'bass@example.com',
        defaultInputMode: InputMode.unavailable,
        joinedAt: now,
      ),
    ];
  }

  StreamController<List<Member>> _controllerFor(String bandId) {
    return _controllers.putIfAbsent(
      bandId,
      StreamController<List<Member>>.broadcast,
    );
  }

  void _emit(String bandId) {
    final list = List<Member>.unmodifiable(_store[bandId] ?? const []);
    _controllerFor(bandId).add(list);
  }

  @override
  Stream<List<Member>> watch(String bandId) {
    final controller = _controllerFor(bandId);
    scheduleMicrotask(() => _emit(bandId));
    return controller.stream;
  }

  @override
  Future<void> upsert(String bandId, Member member) async {
    final list = _store.putIfAbsent(bandId, () => <Member>[]);
    final index = list.indexWhere((m) => m.uid == member.uid);
    if (index >= 0) {
      list[index] = member;
    } else {
      list.add(member);
    }
    _emit(bandId);
  }

  @override
  Future<void> remove(String bandId, String uid) async {
    _store[bandId]?.removeWhere((m) => m.uid == uid);
    _emit(bandId);
  }
}
