import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/base_card.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';

class CheckInVaccinationStatusCard extends StatelessWidget {
  const CheckInVaccinationStatusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return BaseCard(
          radius: defaultRadius,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: spacingXMid,
            ),
            color: const Color(0XFFFDD774),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vaccination Status',
                  style: textTheme.bodyText1?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: spacingXSmall,
                  ),
                ),
                Text(
                  'Fully Vaccinated',
                  style: textTheme.subtitle1?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
