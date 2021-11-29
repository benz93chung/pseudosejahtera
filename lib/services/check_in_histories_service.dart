import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:pseudosejahtera/models/check_in_history.dart';

class CheckInHistoriesService {
  const CheckInHistoriesService();

  Future<List<CheckInHistory>> getCheckInHistories() async {
    final jsonBody = await _getLocalJson();
    Iterable histories = json.decode(jsonBody);

    return List<CheckInHistory>.from(
      histories.map(
        (json) => CheckInHistory.fromJson(
          json: json,
        ),
      ),
    );
  }

  Future<String> _getLocalJson() async {
    return await rootBundle.loadString(
      'assets/json/check_in_histories.json',
    );
  }
}
