import 'package:pseudosejahtera/enums/check_in_status.dart';

extension CheckInStatusExtensions on CheckInStatus {
  String get name {
    switch (this) {
      case CheckInStatus.checkedIn:
        return 'Check-in';
      case CheckInStatus.checkedOut:
        return 'Check-out';
    }
  }
}
