import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/base_card.dart';
import 'package:pseudosejahtera/components/pseudo_outlined_button.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';
import 'package:pseudosejahtera/screens/history_page/history_page.dart';

class CheckOutReminderCard extends StatelessWidget {
  final int historyCount;

  const CheckOutReminderCard({
    Key? key,
    required this.historyCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return BaseCard(
          child: Container(
            padding: const EdgeInsets.all(spacingLarge),
            color: Colors.red.shade200,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: spacingXSmall, right: spacingXMid),
                      child: Icon(
                        Icons.error_outline,
                        color: colorScheme.onSurface,
                        size: statusPageCardIconSize,
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'You are currently checked-in at $historyCount locations.',
                            style: textTheme.headline6?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.symmetric(vertical: spacingXSmall)),
                          Text(
                            'Please check-out from locations you are no longer present at.',
                            style: textTheme.subtitle1?.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: spacingSmall)),
                SizedBox(
                  width: double.infinity,
                  child: PseudoOutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryPage(),
                        ),
                      );
                    },
                    backgroundColor: Colors.red.shade200,
                    foregroundColor: colorScheme.onSurface,
                    child: Builder(
                      builder: (context) {
                        final theme = Theme.of(context);

                        return Text(
                          'Review Check-in History',
                          style: theme.textTheme.button?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
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
