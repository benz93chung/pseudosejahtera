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

  Future<void> checkOut({required CheckInHistory checkInHistory}) async {
    emit(HistoryPageHistoriesUpdating(checkInHistories: state.checkInHistories));

    try {
      emit(
        HistoryPageHistoriesUpdated(
          checkInHistories: _checkOutHistories(historiesToCheckOut: [checkInHistory]),
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

  Future<void> checkOutAll() async {
    emit(HistoryPageHistoriesUpdating(checkInHistories: state.checkInHistories));

    try {
      emit(
        HistoryPageHistoriesUpdated(
          checkInHistories: _checkOutHistories(historiesToCheckOut: checkedIns),
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

  List<CheckInHistory> _filterHistoriesByCheckInStatus({
    required List<CheckInHistory> histories,
    required CheckInStatus status,
  }) =>
      histories.where((history) => history.checkInStatus == status).toList();

  List<CheckInHistory> _checkOutHistories({
    required List<CheckInHistory> historiesToCheckOut,
  }) {
    final updatedHistories = state.checkInHistories;

    for (var history in historiesToCheckOut) {
      final index = state.checkInHistories.indexOf(history);
      updatedHistories[index] = _checkOutHistory(checkInHistory: history);
    }

    updatedHistories.sort(_sortByModifiedAt);
    return updatedHistories;
  }

  int _sortByModifiedAt(CheckInHistory first, CheckInHistory second) {
    if (first.modifiedAt.millisecondsSinceEpoch > second.modifiedAt.millisecondsSinceEpoch) return -1;
    if (first.modifiedAt.millisecondsSinceEpoch < second.modifiedAt.millisecondsSinceEpoch) return 1;
    return 0;
  }

  CheckInHistory _checkOutHistory({required CheckInHistory checkInHistory}) {
    final newHistoryJson = checkInHistory.toJson();
    newHistoryJson['check_in_status'] = CheckInStatus.checkedOut.index;
    newHistoryJson['modified_at'] = DateTime.now().millisecondsSinceEpoch;

    return CheckInHistory.fromJson(json: newHistoryJson);
  }
}
