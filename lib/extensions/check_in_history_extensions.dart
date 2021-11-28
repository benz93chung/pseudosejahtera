import 'package:pseudosejahtera/extensions/check_in_status_extensions.dart';
import 'package:pseudosejahtera/models/check_in_history.dart';

extension CheckInHistoryExtensions on CheckInHistory {
  String get description => '${checkInStatus.name} at ${checkIn.name}';
}
