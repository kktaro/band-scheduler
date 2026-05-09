import 'package:band_scheduler/data/models/busy_slot.dart';
import 'package:band_scheduler/data/models/member.dart';
import 'package:band_scheduler/domain/common_availability.dart';
import 'package:band_scheduler/ui/providers.dart';
import 'package:band_scheduler/ui/shared/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CommonAvailabilityScreen extends ConsumerWidget {
  const CommonAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membersAsync = ref.watch(membersStreamProvider);
    final busySlotsAsync = ref.watch(busySlotsStreamProvider);

    return AppScaffold(
      currentIndex: 0,
      child: Scaffold(
        appBar: AppBar(title: const Text('共通空き時間')),
        body: switch ((membersAsync, busySlotsAsync)) {
          (AsyncData(value: final members), AsyncData(value: final slots)) =>
            _AvailabilityList(members: members, slots: slots),
          (AsyncError(:final error), _) || (_, AsyncError(:final error)) =>
            Center(child: Text('読み込み失敗: $error')),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }
}

class _AvailabilityList extends StatelessWidget {
  const _AvailabilityList({required this.members, required this.slots});

  final List<Member> members;
  final List<BusySlot> slots;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    final windowStart = DateTime(monday.year, monday.month, monday.day);
    final window = (
      start: windowStart,
      end: windowStart.add(const Duration(days: 7)),
    );

    final slotsByMember = <String, List<AvailabilityInterval>>{};
    for (final slot in slots) {
      slotsByMember
          .putIfAbsent(slot.memberUid, () => [])
          .add((start: slot.startAt, end: slot.endAt));
    }
    final inputtedMembers =
        members.where((m) => slotsByMember.containsKey(m.uid)).toList();
    final unfilledMembers =
        members.where((m) => !slotsByMember.containsKey(m.uid)).toList();

    final intervals = commonAvailability(
      memberBusyIntervals: inputtedMembers
          .map((m) => slotsByMember[m.uid] ?? const <AvailabilityInterval>[])
          .toList(),
      window: window,
    );

    final dateFormat = DateFormat('M/d (EEE) HH:mm', 'ja');

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          '今週 (${DateFormat('M/d').format(window.start)} - '
          '${DateFormat('M/d').format(window.end)}) の共通空き時間',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        if (unfilledMembers.isNotEmpty)
          Card(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                '未入力メンバーあり: '
                '${unfilledMembers.map((m) => m.displayName).join(', ')}',
              ),
            ),
          ),
        const SizedBox(height: 8),
        if (intervals.isEmpty)
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('共通空き時間なしなのだ'),
            ),
          )
        else
          ...intervals.map(
            (interval) => Card(
              child: ListTile(
                leading: const Icon(Icons.event_available),
                title: Text(
                  '${dateFormat.format(interval.start)} → '
                  '${DateFormat('HH:mm').format(interval.end)}',
                ),
                subtitle: Text(
                  '${interval.end.difference(interval.start).inHours} 時間',
                ),
              ),
            ),
          ),
      ],
    );
  }
}
