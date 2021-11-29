import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pseudosejahtera/components/pseudo_button.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';
import 'package:pseudosejahtera/cubits/history_page_cubit.dart';
import 'package:pseudosejahtera/cubits/history_page_state.dart';
import 'package:pseudosejahtera/screens/history_page/components/history_page_base.dart';
import 'package:pseudosejahtera/screens/history_page/components/history_page_tile.dart';
import 'package:pseudosejahtera/service_locator.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late HistoryPageCubit _historyPageCubit;

  @override
  void initState() {
    super.initState();

    // If registered,
    // it is likely from a widget test that wishes to use the mocked version of the cubit
    _historyPageCubit = sl.isRegistered<HistoryPageCubit>() ? sl.get<HistoryPageCubit>() : HistoryPageCubit.initial();
    _historyPageCubit.loadHistories();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;

        return PseudoScaffold(
          appBar: AppBar(
            title: const Text('History'),
            elevation: 0,
          ),
          body: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: BlocBuilder<HistoryPageCubit, HistoryPageState>(
              bloc: _historyPageCubit,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Material(
                        color: colorScheme.primary,
                        child: TabBar(
                          indicatorColor: colorScheme.onPrimary,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: colorScheme.onPrimary,
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
                          _CheckedInTabPage(
                            tiles: state is HistoryPageInitial
                                ? const []
                                : _historyPageCubit.checkedIns
                                    .map(
                                      (history) => HistoryPageTile(
                                        onPressedTile: () {},
                                        onPressedCheckOut: (_) {},
                                        checkInHistory: history,
                                      ),
                                    )
                                    .toList(),
                          ),
                          _CheckedOutTabPage(
                            tiles: state is HistoryPageInitial
                                ? const []
                                : _historyPageCubit.checkedOuts
                                    .map(
                                      (history) => HistoryPageTile(
                                        onPressedTile: () {},
                                        onPressedCheckOut: (_) {},
                                        checkInHistory: history,
                                      ),
                                    )
                                    .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _CheckedInTabPage extends StatelessWidget {
  final List<HistoryPageTile> tiles;

  const _CheckedInTabPage({
    Key? key,
    required this.tiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: HistoryPageBase(tiles: tiles),
            ),
            Container(
              width: double.infinity,
              color: colorScheme.surface,
              padding: const EdgeInsets.all(spacingMid),
              child: PseudoButton(
                onPressed: () {},
                child: Text(
                  'Check-out all',
                  style: theme.textTheme.button?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CheckedOutTabPage extends StatelessWidget {
  final List<HistoryPageTile> tiles;

  const _CheckedOutTabPage({
    Key? key,
    required this.tiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HistoryPageBase(tiles: tiles);
  }
}
