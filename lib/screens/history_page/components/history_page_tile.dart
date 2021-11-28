import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/base_card.dart';
import 'package:pseudosejahtera/components/pseudo_button.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/extensions/check_in_history_extensions.dart';
import 'package:pseudosejahtera/extensions/date_time_extensions.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';

class HistoryPageTile extends StatelessWidget {
  final CheckInHistory checkInHistory;
  final void Function(CheckInHistory) onPressedCheckOut;
  final GestureTapCallback onPressedTile;

  const HistoryPageTile({
    Key? key,
    required this.checkInHistory,
    required this.onPressedCheckOut,
    required this.onPressedTile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        final isCheckedIn = checkInHistory.checkInStatus == CheckInStatus.checkedIn;

        return GestureDetector(
          onTap: onPressedTile,
          child: BaseCard(
            child: Container(
              padding: const EdgeInsets.all(spacingLarge),
              color: colorScheme.surface,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: spacingXSmall, right: spacingXMid),
                    child: Icon(
                      Icons.place,
                      color: Colors.indigo.shade400,
                      size: checkinHistoryIconSize,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          checkInHistory.description,
                          style: textTheme.bodyText1?.copyWith(color: colorScheme.onSurface),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: spacingXSmall)),
                        Text(
                          checkInHistory.modifiedAt.getDateOrTimeString(),
                          style: textTheme.caption?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isCheckedIn)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: spacingSmall),
                    ),
                  if (isCheckedIn)
                    PseudoButton(
                      onPressed: () {
                        onPressedCheckOut.call(checkInHistory);
                      },
                      child: Text(
                        'Check-out',
                        style: textTheme.button?.copyWith(
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
