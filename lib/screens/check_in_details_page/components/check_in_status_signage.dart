import 'package:flutter/material.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/extensions/check_in_status_extensions.dart';

class CheckInStatusSignage extends StatelessWidget {
  final CheckInStatus checkInStatus;

  const CheckInStatusSignage({
    Key? key,
    required this.checkInStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return Container(
          width: checkInStatusSignageSize,
          height: checkInStatusSignageSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.primary,
            border: Border.all(
              width: checkInStatusSignageBorderWidth,
              color: colorScheme.onPrimary,
            ),
          ),
          child: Builder(
            builder: (context) {
              final arrow = checkInStatus.arrow;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    arrow.item2,
                    color: colorScheme.onPrimary,
                  ),
                  Text(
                    arrow.item1,
                    style: textTheme.subtitle1?.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
