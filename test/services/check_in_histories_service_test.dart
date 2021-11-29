import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/services/check_in_histories_service.dart';

void main() {
  // Using testWidgets to access rootBundle within service
  testWidgets('getCheckInHistories() returns a list of histories', (_) async {
    const service = CheckInHistoriesService();
    final histories = await service.getCheckInHistories();

    expect(histories, isNotEmpty);
  });
}
