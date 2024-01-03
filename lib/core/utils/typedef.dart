import 'package:dartz/dartz.dart';
import 'package:project/core/errors/faliuers.dart';

typedef ResultFuture<T> = Future<Either<failure, T>>;
typedef ResultVoid<Void> = ResultFuture<void>;
typedef DataMap = Map<String, dynamic>;
