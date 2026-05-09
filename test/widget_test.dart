import 'package:band_scheduler/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('ja');
  });

  testWidgets('アプリが起動して共通空き時間タブが表示される', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: BandSchedulerApp()),
    );
    await tester.pump();

    expect(find.text('共通空き時間'), findsOneWidget);
  });
}
