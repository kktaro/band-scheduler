/// 時間区間。`start <= end` であることを呼び出し側で保証する。
typedef AvailabilityInterval = ({DateTime start, DateTime end});

/// 共通空き時間の計算。
///
/// [memberBusyIntervals] には予定入力済みメンバー分のみ渡すこと。
/// 未入力メンバーは呼び出し側で除外し、別途「未入力メンバーあり」ラベルを
/// 表示する想定（PRD §5）。
List<AvailabilityInterval> commonAvailability({
  required List<List<AvailabilityInterval>> memberBusyIntervals,
  required AvailabilityInterval window,
}) {
  if (memberBusyIntervals.isEmpty) {
    return [window];
  }
  final allBusy = <AvailabilityInterval>[];
  for (final list in memberBusyIntervals) {
    for (final raw in list) {
      final clipped = _clip(raw, window);
      if (clipped != null) {
        allBusy.add(clipped);
      }
    }
  }
  final merged = _mergeIntervals(allBusy);
  return _subtract(window, merged);
}

AvailabilityInterval? _clip(AvailabilityInterval interval, AvailabilityInterval window) {
  final start =
      interval.start.isAfter(window.start) ? interval.start : window.start;
  final end =
      interval.end.isBefore(window.end) ? interval.end : window.end;
  if (!start.isBefore(end)) {
    return null;
  }
  return (start: start, end: end);
}

List<AvailabilityInterval> _mergeIntervals(List<AvailabilityInterval> intervals) {
  if (intervals.isEmpty) {
    return [];
  }
  final sorted = [...intervals]..sort((a, b) => a.start.compareTo(b.start));
  final result = <AvailabilityInterval>[];
  var current = sorted.first;
  for (final next in sorted.skip(1)) {
    if (!next.start.isAfter(current.end)) {
      current = (
        start: current.start,
        end: next.end.isAfter(current.end) ? next.end : current.end,
      );
    } else {
      result.add(current);
      current = next;
    }
  }
  result.add(current);
  return result;
}

List<AvailabilityInterval> _subtract(AvailabilityInterval window, List<AvailabilityInterval> busy) {
  final result = <AvailabilityInterval>[];
  var cursor = window.start;
  for (final interval in busy) {
    if (interval.start.isAfter(cursor)) {
      result.add((start: cursor, end: interval.start));
    }
    if (interval.end.isAfter(cursor)) {
      cursor = interval.end;
    }
  }
  if (cursor.isBefore(window.end)) {
    result.add((start: cursor, end: window.end));
  }
  return result;
}
