import 'package:equatable/equatable.dart';
import 'package:pseudosejahtera/models/check_in.dart';

class CheckInHistory extends Equatable {
  final String id;
  final CheckIn checkIn;
  final DateTime createdAt, modifiedAt;

  const CheckInHistory._({
    required this.id,
    required this.checkIn,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory CheckInHistory.create({
    required String id,
    required CheckIn checkIn,
    required DateTime createdAt,
    required DateTime modifiedAt,
  }) =>
      CheckInHistory._(
        id: id,
        checkIn: checkIn,
        createdAt: createdAt,
        modifiedAt: modifiedAt,
      );

  @override
  List<Object?> get props => [id, checkIn];
}
