import 'package:flutter/material.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:tuple/tuple.dart';

extension CheckInStatusExtensions on CheckInStatus {
  String get name {
    switch (this) {
      case CheckInStatus.checkedIn:
        return 'Check-in';
      case CheckInStatus.checkedOut:
        return 'Check-out';
    }
  }

  Tuple2<String, IconData> get arrow {
    switch (this) {
      case CheckInStatus.checkedIn:
        return const Tuple2<String, IconData>(
          'IN',
          Icons.arrow_forward_sharp,
        );
      case CheckInStatus.checkedOut:
        return const Tuple2<String, IconData>(
          'OUT',
          Icons.arrow_back_sharp,
        );
    }
  }
}
