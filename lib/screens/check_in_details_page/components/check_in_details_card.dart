import 'package:flutter/material.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_details_internal_card.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_status_signage.dart';

class CheckInDetailsCard extends StatelessWidget {
  final CheckInHistory checkInHistory;

  const CheckInDetailsCard({
    Key? key,
    required this.checkInHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: spacingMid)),
            Padding(
              padding: const EdgeInsets.all(spacingMid),
              child: CheckInDetailsInternalCard(
                checkInHistory: checkInHistory,
              ),
            ),
          ],
        ),
        CheckInStatusSignage(checkInStatus: checkInHistory.checkInStatus),
      ],
    );
  }
}
