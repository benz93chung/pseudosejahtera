import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/base_card.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';

class BaseStatusCard extends StatelessWidget {
  final Color backgroundColor, foregroundColor;
  final IconData icon;
  final String label, text;

  const BaseStatusCard({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.label,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Container(
        padding: const EdgeInsets.all(spacingLarge),
        color: backgroundColor,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: spacingXSmall, right: spacingXMid),
              child: Icon(
                icon,
                color: foregroundColor,
                size: statusPageCardIconSize,
              ),
            ),
            Flexible(
              child: Builder(
                builder: (context) {
                  final textTheme = Theme.of(context).textTheme;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        label,
                        style: textTheme.subtitle2?.copyWith(
                          color: foregroundColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: spacingXSmall)),
                      Text(
                        text,
                        style: textTheme.headline6?.copyWith(color: foregroundColor),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
