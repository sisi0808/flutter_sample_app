import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tests/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // groupによりテストをグループ化でき、この単位でテストができる
  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      app.main();

      // 描画が終わるまで待つ
      await tester.pumpAndSettle();

      // 開始時にTextが0であることを確認する
      expect(find.text('0'), findsOneWidget);

      //  Incrementをタップする
      final Finder fab = find.byTooltip('Increment');
      await tester.tap(fab);

      // 描画が終わるまで待つ
      await tester.pumpAndSettle();

      // タップ後にTextが1であることを確認する
      expect(find.text('1'), findsOneWidget);
    });
  });
}
