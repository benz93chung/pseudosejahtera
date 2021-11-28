import 'package:flutter/material.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';
import 'package:pseudosejahtera/screens/status_page/status_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;

      return MaterialApp(
        title: 'PseudoSejahtera',
        theme: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              primary: colorScheme.primary,
              side: BorderSide(
                color: colorScheme.primary,
                width: outlineBtnWidth,
              ),
              textStyle: theme.textTheme.button,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(smallRadius),
              ),
            ),
          ),
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            background: Colors.grey.shade300,
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
        home: const StatusPage(),
      );
    });
  }
}
