import 'package:intl/intl.dart';

final yyyyMMdd = DateFormat('yyyy-MM-dd');
final ddMMMyyyy = DateFormat('dd MMM yyyy');
final ddMMMyyyyHHmmss = DateFormat('yyyy-MM-dd jm');
final dMMMyyyyhmma = DateFormat('d MMM yyyy, h:mm a');
final yyyyMMddkkmm = DateFormat('yyyy-MM-dd kk:mm');
final hmmssa = DateFormat('h:mm:ss a');

extension DateTimeExtension on DateTime {
  bool isToday() {
    final now = DateTime.now();

    final _today = DateTime(now.year, now.month, now.day);
    final _currentDate = DateTime(year, month, day);

    return _today == _currentDate;
  }

  String getDateOrTimeString({DateFormat? dateFormat}) {
    return (dateFormat ?? dMMMyyyyhmma).format(this);
  }
}
