import 'package:dartz/dartz.dart';
import 'package:project/core/errors/exception.dart';
import 'package:project/core/errors/faliuers.dart';
import 'package:project/core/utils/typedef.dart';
import 'package:project/src/Authentication/Data/datasources/authentaction_remote_data_source.dart';
import 'package:project/src/Authentication/Domain/Entities/User.dart';
import 'package:project/src/Authentication/Domain/Repositories/Authentication_Repositores.dart';

class AuthentactionRepositoryimplementation
    implements AuthenticationRepositories {
  const AuthentactionRepositoryimplementation(this._remoteDataSource);

  final AuthentactionRemoteDataSource _remoteDataSource;

  @override
  ResultVoid createUsers(
      {@override required String firstname,
      required String lastname,
      required String CreatedAt}) async {
    try {
      await _remoteDataSource.createuser(
        firstname: firstname,
        lastname: lastname,
        CreatedAt: CreatedAt,
      );
      return const Right(null);
    } on ApiExcption catch (e) {
      return Left(ApiFaliure(msg: e.massage, statecode: e.statuscode));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() {
    throw UnimplementedError();
  }
}
