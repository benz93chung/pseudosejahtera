import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:pseudosejahtera/app.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await FlutterStatusbarcolor.setStatusBarColor(const Color(0xFF3983FE));

      runApp(const MyApp());
    },
    (_, __) {},
  );
}
