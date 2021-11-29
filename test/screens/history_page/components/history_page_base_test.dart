import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/screens/history_page/components/history_page_base.dart';
import 'package:pseudosejahtera/screens/history_page/components/history_page_tile.dart';

import '../../../mocks/cubits/mock_history_page_cubit.dart';
import '../../../utils/test_utils.dart';

void main() {
  testWidgets('HistoryPageBase is rendered correctly', (tester) async {
    await _pumpTile(tester: tester);

    expect(find.byType(HistoryPageTile), findsOneWidget);
  });
}

Future<void> _pumpTile({
  required WidgetTester tester,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: HistoryPageBase(
      tiles: [
        HistoryPageTile(
          onPressedTile: () {},
          onPressedCheckOut: (_) {},
          checkInHistory: buildCheckInHistoryFromTemplate(
            id: 'dont_matter',
            checkIn: buildCheckInFromTemplate(id: 'dont_matter', name: 'dont matter'),
            checkInStatus: CheckInStatus.checkedIn,
            createdAt: DateTime.now(),
            modifiedAt: DateTime.now(),
          ),
        ),
      ],
    ),
  );
}
