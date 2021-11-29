import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pseudosejahtera/cubits/history_page_cubit.dart';
import 'package:pseudosejahtera/cubits/history_page_state.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/models/check_in.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';

import 'mock_history_page_cubit.mocks.dart';

@GenerateMocks([HistoryPageCubit])
void main() {}

MockHistoryPageCubit getMockHistoryPageCubit({
  HistoryPageState? state,
  Stream<HistoryPageState>? stream,
}) {
  final _cubit = MockHistoryPageCubit();

  final _state = state ??
      HistoryPageHistoriesLoaded(
        checkInHistories: [
          buildCheckInHistoryFromTemplate(),
        ],
      );

  final _stream = stream?.asBroadcastStream() ??
      Stream.fromFuture(
        Future.value(_state),
      ).asBroadcastStream();

  when(_cubit.stream).thenAnswer((_) => _stream);
  when(_cubit.state).thenReturn(_state);

  when(_cubit.checkedIns).thenReturn(
    _state.checkInHistories
        .where(
          (history) => history.checkInStatus == CheckInStatus.checkedIn,
        )
        .toList(),
  );

  when(_cubit.checkedOuts).thenReturn(
    _state.checkInHistories
        .where(
          (history) => history.checkInStatus == CheckInStatus.checkedOut,
        )
        .toList(),
  );

  return _cubit;
}

CheckInHistory buildCheckInHistoryFromTemplate({
  String id = 'checkin_history_id_1',
  CheckIn? checkIn,
  CheckInStatus checkInStatus = CheckInStatus.checkedIn,
  DateTime? createdAt,
  DateTime? modifiedAt,
}) =>
    CheckInHistory.create(
      id: id,
      checkIn: checkIn ?? buildCheckInFromTemplate(),
      checkInStatus: checkInStatus,
      createdAt: createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1637930117000),
      modifiedAt: modifiedAt ?? DateTime.fromMicrosecondsSinceEpoch(1637930117000),
    );

CheckIn buildCheckInFromTemplate({
  String id = 'checkin_id_1',
  String name = 'Test Checkin Name',
}) =>
    CheckIn.create(id: id, name: name);
