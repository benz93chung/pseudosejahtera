import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/elastic_scrollable_widget.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/models/check_in.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';
import 'package:pseudosejahtera/screens/status_page/components/bottom_section.dart';
import 'package:pseudosejahtera/screens/status_page/components/check_out_reminder_card.dart';
import 'package:pseudosejahtera/screens/status_page/components/last_check_in_card.dart';
import 'package:pseudosejahtera/screens/status_page/components/name_and_ic_number_section.dart';
import 'package:pseudosejahtera/screens/status_page/components/risk_status_card.dart';
import 'package:pseudosejahtera/screens/status_page/components/vaccination_status_card.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PseudoScaffold(
      body: ElasticScrollableWidget(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerChildren: false,
        physics: const ClampingScrollPhysics(),
        children: [
          const NameAndICNumberSection(
            name: 'Ryan Thomas Gosling',
            icNumber: '123123121234',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingSmall, vertical: spacingXSmall),
            child: RiskStatusCard(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingSmall, vertical: spacingXSmall),
            child: VaccinationStatusCard(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingSmall, vertical: spacingXSmall),
            child: CheckOutReminderCard(historyCount: 5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacingSmall, vertical: spacingXSmall),
            child: LastCheckInCard(
              lastCheckInHistory: CheckInHistory.create(
                id: '6d314ed3-6ff0-49f7-bd93-963e10fd8bc4',
                checkIn: CheckIn.create(
                    id: 'ae564ca1-e7ef-4850-bf07-365f10598026', name: 'MORBITES Burger (formerly SixtyBites)'),
                checkInStatus: CheckInStatus.checkedIn,
                createdAt: DateTime.fromMillisecondsSinceEpoch(1638016947000),
                modifiedAt: DateTime.fromMillisecondsSinceEpoch(1638024147000),
              ),
            ),
          ),
        ],
        stickyBottomWidget: const BottomSection(),
      ),
    );
  }
}
