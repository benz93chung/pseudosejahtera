import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtensions on WidgetTester {
  /// Helper method to pump N number of times, instead of calling tester.pump() x times
  Future<void> pumpNTimes({
    int n = 1,
  }) async {
    for (var i = 1; i <= n; i++) {
      await pump();
    }
  }
}
