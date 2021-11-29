import 'package:equatable/equatable.dart';
import 'package:pseudosejahtera/enums/check_in_status.dart';
import 'package:pseudosejahtera/models/check_in.dart';

class CheckInHistory extends Equatable {
  final String id;
  final CheckIn checkIn;
  final DateTime createdAt, modifiedAt;
  final CheckInStatus checkInStatus;

  const CheckInHistory._({
    required this.id,
    required this.checkIn,
    required this.checkInStatus,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory CheckInHistory.create({
    required String id,
    required CheckIn checkIn,
    required CheckInStatus checkInStatus,
    required DateTime createdAt,
    required DateTime modifiedAt,
  }) =>
      CheckInHistory._(
        id: id,
        checkIn: checkIn,
        checkInStatus: checkInStatus,
        createdAt: createdAt,
        modifiedAt: modifiedAt,
      );

  factory CheckInHistory.fromJson({
    required Map<String, dynamic> json,
  }) {
    return CheckInHistory._(
      id: json['id'],
      checkIn: CheckIn.fromJson(json: json['check_in']),
      checkInStatus: CheckInStatus.values[json['check_in_status']],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at']),
      modifiedAt: DateTime.fromMillisecondsSinceEpoch(json['modified_at']),
    );
  }

  @override
  List<Object?> get props => [id, checkIn];
}
