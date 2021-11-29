import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';
import 'package:pseudosejahtera/services/check_in_histories_service.dart';

import '../cubits/mock_history_page_cubit.dart';
import 'mock_check_in_histories_service.mocks.dart';

@GenerateMocks([CheckInHistoriesService])
void main() {}

MockCheckInHistoriesService getMockCheckInHistoriesService({
  List<CheckInHistory>? checkInHistories,
  dynamic error,
}) {
  final mockService = MockCheckInHistoriesService();

  if (error != null) {
    when(mockService.getCheckInHistories()).thenThrow(error);
    return mockService;
  }

  when(mockService.getCheckInHistories()).thenAnswer(
    (_) => Future.value(
      checkInHistories ??
          [
            buildCheckInHistoryFromTemplate(),
          ],
    ),
  );

  return mockService;
}
