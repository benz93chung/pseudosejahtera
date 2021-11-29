import 'package:flutter/material.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';
import 'package:pseudosejahtera/screens/history_page/components/history_page_tile.dart';

class HistoryPageBase extends StatelessWidget {
  final List<HistoryPageTile> tiles;

  const HistoryPageBase({
    Key? key,
    required this.tiles,
  }) : super(key: key);

  Padding get endPadding => const Padding(
        padding: EdgeInsets.symmetric(
          vertical: spacingXSmall,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        endPadding,
        ...tiles
            .map(
              (tile) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: spacingSmall,
                  horizontal: spacingMid,
                ),
                child: tile,
              ),
            )
            .toList(),
        endPadding,
      ],
    );
  }
}
