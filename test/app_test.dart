import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/app.dart';
import 'package:pseudosejahtera/screens/start_page/start_page.dart';

void main() {
  testWidgets('PseudoSejahteraApp is rendered with expected home page', (tester) async {
    await _pumpApp(tester: tester);

    expect(find.byType(StartPage), findsOneWidget);
  });
}

Future<void> _pumpApp({required WidgetTester tester}) async {
  await tester.pumpWidget(const PseudoSejahteraApp());
  await tester.pump();
}
