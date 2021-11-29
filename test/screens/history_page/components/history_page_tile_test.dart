import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/pseudo_button.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';
import 'package:pseudosejahtera/screens/history_page/components/history_page_tile.dart';

import '../../../mocks/cubits/mock_history_page_cubit.dart';
import '../../../utils/test_utils.dart';

void main() {
  group('General assertion', () {
    testWidgets('HistoryPageTile is rendered correctly in general', (tester) async {
      await _pumpTile(
        tester: tester,
        checkInHistory: _getHistory(checkInStatus: CheckInStatus.checkedOut),
        onPressedCheckOut: (_) {},
        onPressedTile: () {},
      );

      expect(find.byIcon(Icons.place), findsOneWidget);
    });
  });
  group('Status', () {
    testWidgets('HistoryPageTile is rendered correctly if checked-in', (tester) async {
      await _pumpTile(
        tester: tester,
        checkInHistory: _getHistory(checkInStatus: CheckInStatus.checkedIn),
        onPressedCheckOut: (_) {},
        onPressedTile: () {},
      );

      expect(find.text('Check-in at MORBITES Burger (formerly SixtyBites)'), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(PseudoButton),
          matching: find.text('Check-out'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('HistoryPageTile is rendered correctly if checked-out', (tester) async {
      await _pumpTile(
        tester: tester,
        checkInHistory: _getHistory(checkInStatus: CheckInStatus.checkedOut),
        onPressedCheckOut: (_) {},
        onPressedTile: () {},
      );

      expect(find.text('Check-out at MORBITES Burger (formerly SixtyBites)'), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(PseudoButton),
          matching: find.text('Check-out'),
        ),
        findsNothing,
      );
    });
  });

  group('Callbacks', () {
    testWidgets('onPressedCheckOut returns the exactly the expected history', (tester) async {
      CheckInHistory? returningHistory;
      final history = _getHistory(checkInStatus: CheckInStatus.checkedIn);

      await _pumpTile(
        tester: tester,
        checkInHistory: history,
        onPressedCheckOut: (history) {
          returningHistory = history;
        },
        onPressedTile: () {},
      );

      await tester.tap(
        find.descendant(
          of: find.byType(PseudoButton),
          matching: find.text('Check-out'),
        ),
      );
      await tester.pump();

      expect(returningHistory, equals(history));
    });

    testWidgets('onPressedTile works as expected', (tester) async {
      var pressed = false;

      await _pumpTile(
        tester: tester,
        checkInHistory: _getHistory(checkInStatus: CheckInStatus.checkedIn),
        onPressedCheckOut: (_) {},
        onPressedTile: () {
          pressed = true;
        },
      );

      await tester.tap(find.byIcon(Icons.place));
      await tester.pump();

      expect(pressed, isTrue);
    });
  });
}

Future<void> _pumpTile({
  required WidgetTester tester,
  required CheckInHistory checkInHistory,
  required void Function(CheckInHistory) onPressedCheckOut,
  required GestureTapCallback onPressedTile,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: PseudoScaffold(
      body: Column(
        children: [
          HistoryPageTile(
            checkInHistory: checkInHistory,
            onPressedCheckOut: onPressedCheckOut,
            onPressedTile: onPressedTile,
          ),
        ],
      ),
    ),
  );
}

CheckInHistory _getHistory({required CheckInStatus checkInStatus}) {
  return buildCheckInHistoryFromTemplate(
    id: '6d314ed3-6ff0-49f7-bd93-963e10fd8bc4',
    checkIn: buildCheckInFromTemplate(
      id: 'ae564ca1-e7ef-4850-bf07-365f10598026',
      name: 'MORBITES Burger (formerly SixtyBites)',
    ),
    checkInStatus: checkInStatus,
    createdAt: DateTime.fromMillisecondsSinceEpoch(1638016947000),
    modifiedAt: DateTime.fromMillisecondsSinceEpoch(1638024147000),
  );
}
