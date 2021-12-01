import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/base_card.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';

class CheckInRiskStatusCard extends StatelessWidget {
  const CheckInRiskStatusCard({Key? key}) : super(key: key);

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
            color: Colors.green.shade800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Risk Status',
                  style: textTheme.bodyText1?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: spacingXSmall,
                  ),
                ),
                Text(
                  'Low',
                  style: textTheme.subtitle1?.copyWith(
                    color: colorScheme.onPrimary,
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
