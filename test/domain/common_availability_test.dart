import 'package:band_scheduler/domain/common_availability.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('commonAvailability', () {
    final window = (
      start: DateTime(2026, 5, 11),
      end: DateTime(2026, 5, 11, 24),
    );

    test('単一メンバーの不可時間を引いた残りが空き時間になる', () {
      final result = commonAvailability(
        memberBusyIntervals: [
          [
            (
              start: DateTime(2026, 5, 11, 13),
              end: DateTime(2026, 5, 11, 17),
            ),
          ],
        ],
        window: window,
      );

      expect(result, [
        (start: DateTime(2026, 5, 11), end: DateTime(2026, 5, 11, 13)),
        (start: DateTime(2026, 5, 11, 17), end: DateTime(2026, 5, 11, 24)),
      ]);
    });

    test('2 メンバーで不可時間に重なりがあれば共通空きが存在する', () {
      final result = commonAvailability(
        memberBusyIntervals: [
          [
            (
              start: DateTime(2026, 5, 11, 9),
              end: DateTime(2026, 5, 11, 12),
            ),
          ],
          [
            (
              start: DateTime(2026, 5, 11, 10),
              end: DateTime(2026, 5, 11, 13),
            ),
          ],
        ],
        window: window,
      );

      expect(result, [
        (start: DateTime(2026, 5, 11), end: DateTime(2026, 5, 11, 9)),
        (start: DateTime(2026, 5, 11, 13), end: DateTime(2026, 5, 11, 24)),
      ]);
    });

    test('全期間を埋めるメンバーがいる場合は共通空きなし', () {
      final result = commonAvailability(
        memberBusyIntervals: [
          [(start: window.start, end: window.end)],
        ],
        window: window,
      );

      expect(result, isEmpty);
    });

    test('busy リストが空のメンバーのみなら window 全体が空き', () {
      final result = commonAvailability(
        memberBusyIntervals: const [[]],
        window: window,
      );

      expect(result, [window]);
    });

    test('memberBusyIntervals 自体が空（誰も入力なし）なら ArgumentError', () {
      expect(
        () => commonAvailability(
          memberBusyIntervals: const [],
          window: window,
        ),
        throwsArgumentError,
      );
    });
  });
}
