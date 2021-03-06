import 'package:flutter/material.dart';
import 'package:pseudosejahtera/components/elastic_scrollable_widget.dart';
import 'package:pseudosejahtera/components/pseudo_button.dart';
import 'package:pseudosejahtera/components/pseudo_scaffold.dart';
import 'package:pseudosejahtera/constants/dimensions.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';
import 'package:pseudosejahtera/screens/check_in_details_page/components/check_in_details_card.dart';

class CheckInDetailsPage extends StatefulWidget {
  final CheckInHistory checkInHistory;

  const CheckInDetailsPage({
    Key? key,
    required this.checkInHistory,
  }) : super(key: key);

  @override
  _CheckInDetailsPageState createState() => _CheckInDetailsPageState();
}

class _CheckInDetailsPageState extends State<CheckInDetailsPage> {
  late CheckInHistory _checkInHistory;

  void _doCheckOut() {
    setState(() {
      final historyJson = _checkInHistory.toJson();
      historyJson['check_in_status'] = CheckInStatus.checkedOut.index;
      historyJson['modified_at'] = DateTime.now().millisecondsSinceEpoch;
      _checkInHistory = CheckInHistory.fromJson(json: historyJson);
    });
  }

  @override
  void initState() {
    super.initState();
    _checkInHistory = widget.checkInHistory;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);

        return PseudoScaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: theme.colorScheme.primary,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.crop_free_outlined),
                color: theme.colorScheme.onPrimary,
              ),
            ],
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).pop(_checkInHistory);
              },
            ),
          ),
          body: ElasticScrollableWidget(
            backgroundColor: Colors.grey.shade600,
            physics: const ClampingScrollPhysics(),
            children: [
              CheckInDetailsCard(checkInHistory: _checkInHistory),
            ],
            stickyBottomWidget: (_checkInHistory.checkInStatus == CheckInStatus.checkedIn)
                ? Container(
                    width: double.infinity,
                    color: theme.colorScheme.surface,
                    padding: const EdgeInsets.all(spacingMid),
                    child: PseudoButton(
                      onPressed: _doCheckOut,
                      child: Text(
                        'Check-out',
                        style: theme.textTheme.button?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
