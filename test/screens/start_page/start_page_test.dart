import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/screens/start_page/start_page.dart';
import 'package:pseudosejahtera/screens/start_page/start_page_app_bar.dart';
import 'package:pseudosejahtera/screens/status_page/status_page.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets('StartPage is rendered correctly', (tester) async {
    await _pumpPage(tester: tester);

    expect(find.byType(StartPageAppBar), findsOneWidget);
    expect(find.byType(StatusPage), findsOneWidget);
  });
}

Future<void> _pumpPage({required WidgetTester tester}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: const StartPage(),
  );
}
