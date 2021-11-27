import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/screens/risk_status_card.dart';
import 'package:pseudosejahtera/screens/vaccination_status_card.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return PseudoScaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: colorScheme.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Image.asset(
                        'assets/icon/icon.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 4.0,
                      ),
                      child: Text(
                        'RYAN THOMAS GOSLING',
                        key: const ValueKey('username'),
                        style: textTheme.headline5?.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4.0,
                        bottom: 16.0,
                      ),
                      child: Text(
                        '123123121234',
                        key: const ValueKey('ic_number'),
                        style: textTheme.subtitle2?.copyWith(
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              const RiskStatusCard(),
              const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
              const VaccinationStatusCard(),
              const Spacer(),
              Container(
                color: colorScheme.surface,
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: MaterialButton(
                  onPressed: () {},
                  color: colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Check-in',
                      key: const ValueKey('check_in_button'),
                      style: textTheme.button?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  minWidth: double.infinity,
                  elevation: 0,
                  padding: const EdgeInsets.all(4.0),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
