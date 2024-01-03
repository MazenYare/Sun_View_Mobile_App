import 'package:equatable/equatable.dart';

class ApiExcption extends Equatable implements Exception {
  const ApiExcption({required this.massage, required this.statuscode});

  final String massage;
  final int statuscode;

  @override
  List<Object?> get props => [massage, statuscode];
}
