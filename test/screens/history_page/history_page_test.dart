import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pseudosejahtera/cubits/history_page_state.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/screens/history_page/components/history_page_tile.dart';
import 'package:pseudosejahtera/screens/history_page/history_page.dart';
import 'package:pseudosejahtera/service_locator.dart';

import '../../mocks/cubits/mock_history_page_cubit.dart';
import '../../mocks/cubits/mock_history_page_cubit.mocks.dart';
import '../../utils/test_utils.dart';

void main() {
  setUp(() async {
    await sl.reset();
  });

  group('General assertion', () {
    testWidgets('HistoryPage is rendered correctly', (tester) async {
      await _pumpPage(tester: tester);

      expect(find.byType(Tab), findsNWidgets(2));
      expect(find.text('Checked-in'), findsOneWidget);
      expect(find.text('Checked-out'), findsOneWidget);
      expect(find.text('Check-out all'), findsOneWidget);
    });
  });

  group('Tabs', () {
    testWidgets('Checked-in tab of HistoryPage shows the right amount of check-ins', (tester) async {
      await _pumpPage(tester: tester);

      expect(find.byType(HistoryPageTile), findsNWidgets(2));
    });

    testWidgets('Checked-out tab of HistoryPage shows the right amount of check-ins', (tester) async {
      await _pumpPage(tester: tester);

      await tester.tap(
        find.descendant(
          of: find.byType(Tab),
          matching: find.text('Checked-out'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(HistoryPageTile), findsOneWidget);
    });
  });

  group('Mass check-out', () {
    testWidgets('Clicking check-out clears all of the check-ins', (tester) async {
      final cubit = getMockHistoryPageCubit(
        state: HistoryPageHistoriesLoaded(
          checkInHistories: [
            buildCheckInHistoryFromTemplate(
              id: '1',
              checkIn: buildCheckInFromTemplate(
                id: '01',
                name: 'Test Check In 1',
              ),
              checkInStatus: CheckInStatus.checkedIn,
            ),
            buildCheckInHistoryFromTemplate(
              id: '2',
              checkIn: buildCheckInFromTemplate(
                id: '02',
                name: 'Test Check In 2',
              ),
              checkInStatus: CheckInStatus.checkedIn,
            ),
            buildCheckInHistoryFromTemplate(
              id: '3',
              checkIn: buildCheckInFromTemplate(
                id: '03',
                name: 'Test Check In 3',
              ),
              checkInStatus: CheckInStatus.checkedOut,
            ),
          ],
        ),
      );

      await _pumpPage(
        tester: tester,
        mockHistoryPageCubit: cubit,
      );

      await tester.tap(find.text('Check-out all'));
      await tester.pump();

      verify(cubit.checkOutAll()).called(1);
    });

    testWidgets('Empty list in Checked-in tab results in showing message', (tester) async {
      await _pumpPage(
        tester: tester,
        state: const HistoryPageHistoriesLoaded(
          checkInHistories: [],
        ),
      );

      expect(find.text('Check-out all'), findsNothing);
      expect(find.byType(HistoryPageTile), findsNothing);

      expect(
        find.text('No active check-ins today.\nLooks like you are staying safe at home!'),
        findsOneWidget,
      );
      expect(
        find.text('Thank you for your efforts in breaking the COVID-19 infection chain!'),
        findsOneWidget,
      );
    });
  });
}

Future<void> _pumpPage({
  required WidgetTester tester,
  HistoryPageState? state,
  MockHistoryPageCubit? mockHistoryPageCubit,
}) async {
  initMockDependencies(
    mockHistoryPageCubit: mockHistoryPageCubit ??
        getMockHistoryPageCubit(
          state: state ??
              HistoryPageHistoriesLoaded(
                checkInHistories: [
                  buildCheckInHistoryFromTemplate(
                    id: '1',
                    checkIn: buildCheckInFromTemplate(
                      id: '01',
                      name: 'Test Check In 1',
                    ),
                    checkInStatus: CheckInStatus.checkedIn,
                  ),
                  buildCheckInHistoryFromTemplate(
                    id: '2',
                    checkIn: buildCheckInFromTemplate(
                      id: '02',
                      name: 'Test Check In 2',
                    ),
                    checkInStatus: CheckInStatus.checkedIn,
                  ),
                  buildCheckInHistoryFromTemplate(
                    id: '3',
                    checkIn: buildCheckInFromTemplate(
                      id: '03',
                      name: 'Test Check In 3',
                    ),
                    checkInStatus: CheckInStatus.checkedOut,
                  ),
                ],
              ),
        ),
  );

  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: const HistoryPage(),
  );
}
