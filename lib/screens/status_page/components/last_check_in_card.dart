import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/base_card.dart';
import 'package:pseudosejahtera/components/pseudo_outlined_button.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';
import 'package:pseudosejahtera/extensions/date_time_extensions.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';

class LastCheckInCard extends StatelessWidget {
  final CheckInHistory lastCheckInHistory;

  const LastCheckInCard({
    Key? key,
    required this.lastCheckInHistory,
  }) : super(key: key);

  String _dateTimeToString({required DateTime dateTime}) {
    return dateTime.getDateOrTimeString();
  }

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: spacingLarge,
          horizontal: spacingXMid,
        ),
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'History',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: spacingSmall, right: spacingLarge),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(spacingMid),
                      child: Icon(
                        Icons.store_mall_directory_outlined,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: checkInCardIconSize,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Builder(
                    builder: (context) {
                      final textTheme = Theme.of(context).textTheme;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last Check-in',
                            style: textTheme.subtitle2?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.symmetric(vertical: spacingXSmall)),
                          Text(
                            lastCheckInHistory.checkIn.name,
                            style: textTheme.headline6?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.symmetric(vertical: spacingXSmall)),
                          Text(
                            _dateTimeToString(dateTime: lastCheckInHistory.modifiedAt),
                            style: textTheme.caption?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(opacityMed),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.symmetric(vertical: spacingSmall)),
                          SizedBox(
                            width: double.infinity,
                            child: PseudoOutlinedButton(
                              onPressed: () {},
                              child: Builder(
                                builder: (context) {
                                  final theme = Theme.of(context);

                                  return Text(
                                    'Check-out',
                                    style: theme.textTheme.button?.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
