import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/cubits/history_page_cubit.dart';
import 'package:pseudosejahtera/cubits/history_page_state.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';
import 'package:pseudosejahtera/service_locator.dart';
import 'package:pseudosejahtera/services/check_in_histories_service.dart';

import '../mocks/cubits/mock_history_page_cubit.dart';
import '../mocks/services/mock_check_in_histories_service.dart';

void main() {
  setUp(() async {
    await sl.reset();
  });

  group('HistoryPageCubit getters', () {
    test(
      'checkedIns returns a list of CheckInHistory where all of them are CheckInStatus.checkedIn in status',
      () async {
        _mockCheckInHistoriesService(
          checkInHistories: [
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedIn),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedIn),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedIn),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedOut),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedOut),
          ],
        );

        final cubit = HistoryPageCubit.initial();
        await cubit.loadHistories();

        expect(cubit.checkedIns.length, equals(3));
      },
    );

    test(
      'checkedOuts returns a list of CheckInHistory where all of them are CheckInStatus.checkedOut in status',
      () async {
        _mockCheckInHistoriesService(
          checkInHistories: [
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedIn),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedIn),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedIn),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedOut),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedOut),
          ],
        );

        final cubit = HistoryPageCubit.initial();
        await cubit.loadHistories();

        expect(cubit.checkedOuts.length, equals(2));
      },
    );
  });

  group('HistoryPageCubit loadHistory', () {
    test(
      'loadHistory loads histories successfully and emits HistoryPageHistoriesLoaded',
      () async {
        _mockCheckInHistoriesService(
          checkInHistories: [
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedIn),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedIn),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedIn),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedOut),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedOut),
          ],
        );

        final cubit = HistoryPageCubit.initial();
        await cubit.loadHistories();

        expect(cubit.state, isA<HistoryPageHistoriesLoaded>());
        expect(cubit.state.checkInHistories.length, equals(5));
      },
    );

    test(
      'loadHistory emits HistoryPageHistoriesLoaded upon HistoryPageError',
      () async {
        _mockCheckInHistoriesService(
          error: Exception('Oh no it went wrong!'),
        );

        final cubit = HistoryPageCubit.initial();

        await cubit.loadHistories();

        expect(cubit.state, isA<HistoryPageError>());
        expect((cubit.state as HistoryPageError).errorObj, isA<Exception>());
      },
    );
  });

  group('HistoryPageCubit clearAllCheckedIns', () {
    test(
      'clearAllCheckedIns checks out all check-ins successfully and emits HistoryPageHistoriesUpdated',
      () async {
        _mockCheckInHistoriesService(
          checkInHistories: [
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedIn),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedIn),
            buildCheckInHistoryFromTemplate(checkInStatus: CheckInStatus.checkedIn),
          ],
        );

        final cubit = HistoryPageCubit.initial();
        await cubit.loadHistories();
        await cubit.clearAllCheckedIns();

        expect(cubit.state, isA<HistoryPageHistoriesUpdated>());
        for (final history in cubit.state.checkInHistories) {
          expect(history.checkInStatus == CheckInStatus.checkedOut, isTrue);
        }
      },
    );
  });
}

void _mockCheckInHistoriesService({
  List<CheckInHistory>? checkInHistories,
  dynamic error,
}) {
  sl.registerLazySingleton<CheckInHistoriesService>(
    () => getMockCheckInHistoriesService(
      checkInHistories: checkInHistories,
      error: error,
    ),
  );
}
