import 'dart:async';

import 'package:band_scheduler/data/models/practice.dart';
import 'package:band_scheduler/ui/providers.dart';
import 'package:band_scheduler/ui/shared/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class PracticesScreen extends ConsumerWidget {
  const PracticesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final practicesAsync = ref.watch(practicesStreamProvider);
    final user = ref.watch(currentUserProvider).value;
    final bandId = ref.watch(bandIdProvider);
    final dateFormat = DateFormat('M/d (EEE) HH:mm', 'ja');

    return AppScaffold(
      currentIndex: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('練習予定')),
        body: switch (practicesAsync) {
          AsyncData(value: final practices) when practices.isEmpty =>
            const Center(child: Text('練習予定はまだないのだ')),
          AsyncData(value: final practices) => ListView.builder(
              itemCount: practices.length,
              itemBuilder: (context, index) {
                final practice = practices[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.music_note),
                    title: Text(practice.studioName),
                    subtitle: Text(
                      '${dateFormat.format(practice.startAt)} → '
                      '${DateFormat('HH:mm').format(practice.endAt)}\n'
                      '${practice.memo}',
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        unawaited(
                          ref
                              .read(practicesRepositoryProvider)
                              .delete(bandId, practice.id),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          AsyncError(:final error) => Center(child: Text('読み込み失敗: $error')),
          _ => const Center(child: CircularProgressIndicator()),
        },
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text('練習予定を登録'),
          onPressed: user == null
              ? null
              : () => _showAddDialog(context, ref, bandId, user.uid),
        ),
      ),
    );
  }

  Future<void> _showAddDialog(
    BuildContext context,
    WidgetRef ref,
    String bandId,
    String createdBy,
  ) async {
    final studioController = TextEditingController(text: 'スタジオ未定');
    final memoController = TextEditingController();
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('練習予定を登録 (スタブ)'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: studioController,
              decoration: const InputDecoration(labelText: 'スタジオ名'),
            ),
            TextField(
              controller: memoController,
              decoration: const InputDecoration(labelText: 'メモ'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('キャンセル'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('登録'),
          ),
        ],
      ),
    );
    if (result ?? false) {
      final start = DateTime.now().add(const Duration(days: 1));
      final end = start.add(const Duration(hours: 2));
      final now = DateTime.now();
      await ref.read(practicesRepositoryProvider).add(
            bandId,
            Practice(
              id: '',
              startAt: start,
              endAt: end,
              studioName: studioController.text,
              memo: memoController.text,
              createdBy: createdBy,
              createdAt: now,
            ),
          );
    }
  }
}
