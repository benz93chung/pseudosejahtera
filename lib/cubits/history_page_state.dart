import 'package:equatable/equatable.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';

abstract class HistoryPageState extends Equatable {
  final List<CheckInHistory> checkInHistories;

  const HistoryPageState({required this.checkInHistories});

  @override
  List<Object?> get props => [checkInHistories];
}

class HistoryPageInitial extends HistoryPageState {
  const HistoryPageInitial()
      : super(
          checkInHistories: const [],
        );
}

class HistoryPageHistoriesLoaded extends HistoryPageState {
  const HistoryPageHistoriesLoaded({
    required List<CheckInHistory> checkInHistories,
  }) : super(
          checkInHistories: checkInHistories,
        );
}

class HistoryPageHistoriesUpdating extends HistoryPageState {
  const HistoryPageHistoriesUpdating({
    required List<CheckInHistory> checkInHistories,
  }) : super(
          checkInHistories: checkInHistories,
        );
}

class HistoryPageHistoriesUpdated extends HistoryPageState {
  const HistoryPageHistoriesUpdated({
    required List<CheckInHistory> checkInHistories,
  }) : super(
          checkInHistories: checkInHistories,
        );
}

class HistoryPageError extends HistoryPageState {
  final Object errorObj;

  const HistoryPageError({
    required this.errorObj,
    required List<CheckInHistory> checkInHistories,
  }) : super(
          checkInHistories: checkInHistories,
        );

  @override
  List<Object?> get props => super.props..addAll([errorObj]);
}
