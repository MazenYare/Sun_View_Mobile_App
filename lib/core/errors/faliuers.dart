import 'package:equatable/equatable.dart';
import 'exception.dart';

// ignore: must_be_immutable
abstract class failure extends Equatable {
  const failure({required this.msg, required this.statecode});

  final int statecode;
  final String msg;

  @override
  List<Object> get props => [msg, statecode];
}

class ApiFaliure extends failure {
  const ApiFaliure({required super.msg, required super.statecode});

  ApiFaliure.fromException(ApiExcption excption)
      : this(msg: excption.massage, statecode: excption.statuscode);
}
