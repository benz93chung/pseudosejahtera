import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:pseudosejahtera/app.dart';
import 'package:pseudosejahtera/service_locator.dart';
import 'package:pseudosejahtera/services/check_in_histories_service.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await _registerDependencies();

      await FlutterStatusbarcolor.setStatusBarColor(
        const Color(0xFF3983FE),
      );

      runApp(const PseudoSejahteraApp());
    },
    (_, __) {},
  );
}

Future<void> _registerDependencies() async {
  sl.registerLazySingleton<CheckInHistoriesService>(
    () => const CheckInHistoriesService(),
  );
}
