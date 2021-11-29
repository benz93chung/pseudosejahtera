import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pseudosejahtera/cubits/history_page_state.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';
import 'package:pseudosejahtera/service_locator.dart';
import 'package:pseudosejahtera/services/check_in_histories_service.dart';

class HistoryPageCubit extends Cubit<HistoryPageState> {
  final CheckInHistoriesService _checkInHistoriesService;

  HistoryPageCubit._({required HistoryPageState state})
      : _checkInHistoriesService = sl.get<CheckInHistoriesService>(),
        super(state);

  factory HistoryPageCubit.initial({HistoryPageState? state}) => HistoryPageCubit._(
        state: state ?? const HistoryPageInitial(),
      );

  List<CheckInHistory> get checkedIns => _filterHistoriesByCheckInStatus(
        histories: state.checkInHistories,
        status: CheckInStatus.checkedIn,
      );

  List<CheckInHistory> get checkedOuts => _filterHistoriesByCheckInStatus(
        histories: state.checkInHistories,
        status: CheckInStatus.checkedOut,
      );

  Future<void> loadHistories() async {
    try {
      final histories = await _checkInHistoriesService.getCheckInHistories();

      emit(
        HistoryPageHistoriesLoaded(
          checkInHistories: histories,
        ),
      );
    } catch (e) {
      emit(
        HistoryPageError(
          errorObj: e,
          checkInHistories: state.checkInHistories,
        ),
      );
    }
  }

  Future<void> clearAllCheckedIns() async {
    if (!state.checkInHistories.any(
      (history) => history.checkInStatus == CheckInStatus.checkedIn,
    )) {
      return;
    }

    emit(HistoryPageHistoriesUpdating(checkInHistories: state.checkInHistories));

    var updatedHistories = <CheckInHistory>[...checkedOuts];

    try {
      for (var history in checkedIns) {
        final newHistoryJson = history.toJson();
        newHistoryJson['check_in_status'] = CheckInStatus.checkedOut.index;

        updatedHistories.insert(0, CheckInHistory.fromJson(json: newHistoryJson));

        emit(HistoryPageHistoriesUpdated(checkInHistories: updatedHistories));
      }
    } catch (e) {
      emit(
        HistoryPageError(
          errorObj: e,
          checkInHistories: state.checkInHistories,
        ),
      );
    }
  }

  List<CheckInHistory> _filterHistoriesByCheckInStatus({
    required List<CheckInHistory> histories,
    required CheckInStatus status,
  }) =>
      histories.where((history) => history.checkInStatus == status).toList();
}
