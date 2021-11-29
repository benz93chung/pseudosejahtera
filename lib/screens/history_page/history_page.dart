import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/models/check_in.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';
import 'package:pseudosejahtera/screens/history_page/components/history_page_base.dart';
import 'package:pseudosejahtera/screens/history_page/components/history_page_tile.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final theme = Theme.of(context);

      return PseudoScaffold(
        appBar: AppBar(
          title: const Text('History'),
          elevation: 0,
        ),
        body: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.zero,
                child: Material(
                  color: theme.colorScheme.primary,
                  child: TabBar(
                    indicatorColor: theme.colorScheme.onPrimary,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: theme.colorScheme.onPrimary,
                    onTap: (_) {},
                    tabs: ['Checked-in', 'Checked-out']
                        .map(
                          (tab) => Tab(text: tab),
                        )
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    HistoryPageBase(
                      tiles: [
                        HistoryPageTile(
                          onPressedTile: () {},
                          onPressedCheckOut: (_) {},
                          checkInHistory: CheckInHistory.create(
                            id: '6d314ed3-6ff0-49f7-bd93-963e10fd8bc4',
                            checkIn: CheckIn.create(
                                id: 'ae564ca1-e7ef-4850-bf07-365f10598026',
                                name: 'MORBITES Burger (formerly SixtyBites)'),
                            checkInStatus: CheckInStatus.checkedIn,
                            createdAt: DateTime.fromMillisecondsSinceEpoch(1638016947000),
                            modifiedAt: DateTime.fromMillisecondsSinceEpoch(1638024147000),
                          ),
                        ),
                      ],
                    ),
                    HistoryPageBase(
                      tiles: [
                        HistoryPageTile(
                          onPressedTile: () {},
                          onPressedCheckOut: (_) {},
                          checkInHistory: CheckInHistory.create(
                            id: '6d314ed3-6ff0-49f7-bd93-963e10fd8bc4',
                            checkIn: CheckIn.create(
                                id: 'ae564ca1-e7ef-4850-bf07-365f10598026',
                                name: 'MORBITES Burger (formerly SixtyBites)'),
                            checkInStatus: CheckInStatus.checkedOut,
                            createdAt: DateTime.fromMillisecondsSinceEpoch(1638016947000),
                            modifiedAt: DateTime.fromMillisecondsSinceEpoch(1638024147000),
                          ),
                        ),
                        HistoryPageTile(
                          onPressedTile: () {},
                          onPressedCheckOut: (_) {},
                          checkInHistory: CheckInHistory.create(
                            id: '6d314ed3-6ff0-49f7-bd93-963e10fd8bc4',
                            checkIn: CheckIn.create(
                                id: 'ae564ca1-e7ef-4850-bf07-365f10598026',
                                name: 'MORBITES Burger (formerly SixtyBites)'),
                            checkInStatus: CheckInStatus.checkedOut,
                            createdAt: DateTime.fromMillisecondsSinceEpoch(1638016947000),
                            modifiedAt: DateTime.fromMillisecondsSinceEpoch(1638024147000),
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
      );
    });
  }
}
