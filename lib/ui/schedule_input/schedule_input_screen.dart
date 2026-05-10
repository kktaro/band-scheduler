import 'dart:async';

import 'package:band_scheduler/data/models/busy_slot.dart';
import 'package:band_scheduler/data/models/input_mode.dart';
import 'package:band_scheduler/ui/providers.dart';
import 'package:band_scheduler/ui/shared/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ScheduleInputScreen extends ConsumerStatefulWidget {
  const ScheduleInputScreen({super.key});

  @override
  ConsumerState<ScheduleInputScreen> createState() =>
      _ScheduleInputScreenState();
}

class _ScheduleInputScreenState extends ConsumerState<ScheduleInputScreen> {
  InputMode _mode = InputMode.unavailable;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider).value;
    final bandId = ref.watch(bandIdProvider);
    final slotsAsync = ref.watch(busySlotsStreamProvider);
    final dateFormat = DateFormat('M/d (EEE) HH:mm', 'ja');

    final myUid = user?.uid;
    final mySlots = slotsAsync.value
            ?.where((slot) => slot.memberUid == myUid)
            .toList() ??
        const <BusySlot>[];

    return AppScaffold(
      currentIndex: 1,
      child: Scaffold(
        appBar: AppBar(title: const Text('予定入力')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SegmentedButton<InputMode>(
                segments: const [
                  ButtonSegment(
                    value: InputMode.unavailable,
                    label: Text('不可時間'),
                    icon: Icon(Icons.block),
                  ),
                  ButtonSegment(
                    value: InputMode.available,
                    label: Text('空き時間'),
                    icon: Icon(Icons.check_circle_outline),
                  ),
                ],
                selected: {_mode},
                onSelectionChanged: (selected) {
                  setState(() => _mode = selected.first);
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: mySlots.isEmpty
                    ? const Center(child: Text('まだ登録された予定はないのだ'))
                    : ListView.builder(
                        itemCount: mySlots.length,
                        itemBuilder: (context, index) {
                          final slot = mySlots[index];
                          return Card(
                            child: ListTile(
                              leading: Icon(
                                slot.sourceInputMode == InputMode.unavailable
                                    ? Icons.block
                                    : Icons.check_circle_outline,
                              ),
                              title: Text(
                                '${dateFormat.format(slot.startAt)} → '
                                '${DateFormat('HH:mm').format(slot.endAt)}',
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () {
                                  unawaited(
                                    ref
                                        .read(busySlotsRepositoryProvider)
                                        .delete(bandId, slot.id),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: Text(_mode == InputMode.unavailable ? '不可を追加' : '空きを追加'),
          onPressed: myUid == null
              ? null
              : () => _addSampleSlot(bandId: bandId, memberUid: myUid),
        ),
      ),
    );
  }

  Future<void> _addSampleSlot({
    required String bandId,
    required String memberUid,
  }) async {
    final today = DateTime.now();
    final base = DateTime(today.year, today.month, today.day, 19);
    final start = base.add(const Duration(days: 1));
    final end = start.add(const Duration(hours: 2));
    final now = DateTime.now();
    await ref.read(busySlotsRepositoryProvider).add(
          bandId,
          BusySlot(
            id: '',
            memberUid: memberUid,
            startAt: start,
            endAt: end,
            sourceInputMode: _mode,
            createdAt: now,
            updatedAt: now,
          ),
        );
  }
}
