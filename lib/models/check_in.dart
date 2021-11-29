import 'package:equatable/equatable.dart';

class CheckIn extends Equatable {
  final String id, name;

  const CheckIn._({
    required this.id,
    required this.name,
  });

  factory CheckIn.create({
    required String id,
    required String name,
  }) =>
      CheckIn._(id: id, name: name);

  factory CheckIn.fromJson({
    required Map<String, dynamic> json,
  }) {
    return CheckIn._(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [id, name];
}
