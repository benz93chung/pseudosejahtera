import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_details_field.dart';

import '../../../utils/test_utils.dart';

void main() {
  testWidgets(
    'CheckInDetailsField is rendered correctly',
    (tester) async {
      await _pumpPageWithField(tester: tester);

      expect(find.text('Label'), findsOneWidget);
      expect(find.text('Value'), findsOneWidget);
    },
  );
}

Future<void> _pumpPageWithField({required WidgetTester tester}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: const Center(
      child: CheckInDetailsField(label: 'Label', value: 'Value'),
    ),
  );
}
