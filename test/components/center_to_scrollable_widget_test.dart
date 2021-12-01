import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/components/center_to_scrollable_widget.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';

import '../utils/test_utils.dart';

void main() {
  testWidgets(
    'CenterToScrollableWidget is rendered with expected elements',
    (tester) async {
      await _pumpCenterToScrollableWidget(
        tester: tester,
        children: [
          const Text(
            'Alpha',
            style: TextStyle(fontSize: 120.0),
          ),
          const Text(
            'Bravo',
            style: TextStyle(fontSize: 120.0),
          ),
        ],
        stickyBottomWidget: const Text(
          'Charlie',
          style: TextStyle(fontSize: 120.0),
        ),
      );

      expect(find.text('Alpha'), findsOneWidget);
      expect(find.text('Bravo'), findsOneWidget);
      expect(find.text('Charlie'), findsOneWidget);
    },
  );
}

Future<void> _pumpCenterToScrollableWidget({
  required WidgetTester tester,
  required List<Widget> children,
  required Widget stickyBottomWidget,
}) async {
  await pumpWidgetToTest(
    tester: tester,
    widgetToTest: PseudoScaffold(
      body: CenterToScrollableWidget(
        children: children,
        physics: const ClampingScrollPhysics(),
        stickyBottomWidget: stickyBottomWidget,
      ),
    ),
  );
}
