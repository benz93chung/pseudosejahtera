import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'widget_tester_extensions.dart';

Future<void> pumpWidgetToTest({
  required WidgetTester tester,
  required Widget widgetToTest,
  int timesToPump = 1,
}) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await tester.pumpWidget(
    getTestMaterialAppBoilerplate(
      widgetToTest: widgetToTest,
    ),
  );

  await tester.pumpNTimes(n: timesToPump);
}

Widget getTestMaterialAppBoilerplate({required Widget widgetToTest}) {
  return TestApp(
    widgetToTest: widgetToTest,
  );
}

class TestApp extends StatelessWidget {
  final Widget widgetToTest;

  const TestApp({
    Key? key,
    required this.widgetToTest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PseudoSejahtera',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          background: Colors.white70,
          onBackground: Colors.white,
          primary: const Color(0xFF3983FE),
          primaryVariant: const Color(0xFF2E64BF),
          onPrimary: Colors.white,
          secondary: Colors.green.shade700,
          secondaryVariant: Colors.green.shade900,
          onSecondary: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
          error: Colors.red.shade900,
          onError: Colors.white,
        ),
      ),
      home: widgetToTest,
    );
  }
}
