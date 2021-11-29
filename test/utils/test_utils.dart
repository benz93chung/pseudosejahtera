import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pseudosejahtera/cubits/history_page_cubit.dart';
import 'package:pseudosejahtera/service_locator.dart';
import 'package:pseudosejahtera/services/check_in_histories_service.dart';
import '../mocks/cubits/mock_history_page_cubit.dart';
import '../mocks/cubits/mock_history_page_cubit.mocks.dart';
import '../mocks/services/mock_check_in_histories_service.dart';
import '../mocks/services/mock_check_in_histories_service.mocks.dart';
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

void initMockDependencies({
  MockCheckInHistoriesService? mockCheckInHistoriesService,
  MockHistoryPageCubit? mockHistoryPageCubit,
}) {
  sl.registerLazySingleton<CheckInHistoriesService>(
    () => mockCheckInHistoriesService ?? getMockCheckInHistoriesService(),
  );

  sl.registerLazySingleton<HistoryPageCubit>(
    () => mockHistoryPageCubit ?? getMockHistoryPageCubit(),
  );
}
