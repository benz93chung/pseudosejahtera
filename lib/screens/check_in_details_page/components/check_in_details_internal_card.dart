import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/base_card.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';
import 'package:pseudosejahtera/extensions/date_time_extensions.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_details_field.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_risk_status_card.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_vaccination_status_card.dart';

class CheckInDetailsInternalCard extends StatelessWidget {
  final CheckInHistory checkInHistory;

  const CheckInDetailsInternalCard({
    Key? key,
    required this.checkInHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return BaseCard(
          radius: defaultRadius,
          child: Column(
            children: [
              Container(
                color: colorScheme.primary,
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(vertical: spacingLarge)),
                    Padding(
                      padding: const EdgeInsets.all(spacingXLarge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/icon/icon.png',
                            width: pseudoSejahteraLogoWidth,
                            height: pseudoSejahteraLogoHeight,
                            fit: BoxFit.contain,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Thank you',
                                style: textTheme.headline5?.copyWith(
                                  color: colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'You\'ve successfully registered!',
                                style: textTheme.bodyText1?.copyWith(
                                  color: colorScheme.onPrimary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: colorScheme.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: spacingLarge,
                        left: spacingLarge,
                        right: spacingLarge,
                        bottom: spacingMid,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Check-in Information',
                              style: textTheme.subtitle1,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: spacingLarge),
                          ),
                          CheckInDetailsField(
                            label: 'Location',
                            value: checkInHistory.checkIn.name,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: spacingMid),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Flexible(
                                flex: 3,
                                fit: FlexFit.loose,
                                child: CheckInDetailsField(
                                  label: 'Name',
                                  value: 'Ryan Thomas Gosling',
                                ),
                              ),
                              Spacer(),
                              CheckInDetailsField(
                                alignment: CrossAxisAlignment.end,
                                label: 'Telephone Number',
                                value: '+601117000919',
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: spacingMid),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 3,
                                fit: FlexFit.loose,
                                child: CheckInDetailsField(
                                  label: 'Date',
                                  value: checkInHistory.modifiedAt.getDateOrTimeString(
                                    dateFormat: ddMMMyyyy,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              CheckInDetailsField(
                                label: 'Time',
                                value: checkInHistory.modifiedAt.getDateOrTimeString(
                                  dateFormat: hmmssa,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: spacingMid),
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: CheckInRiskStatusCard(),
                              ),
                              SizedBox(width: 5.0),
                              Expanded(
                                child: CheckInVaccinationStatusCard(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: colorScheme.onSurface.withOpacity(opacityMed),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: spacingLarge,
                        right: spacingLarge,
                        top: spacingMid,
                        bottom: spacingLarge,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Please present this ticket to the personnel of the premise upon request',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
