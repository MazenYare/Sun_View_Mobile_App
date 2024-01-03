import 'package:project/core/utils/typedef.dart';
import 'package:project/src/Authentication/Domain/Entities/User.dart';

abstract class AuthenticationRepositories {
  const AuthenticationRepositories();
  ResultVoid createUsers({
    required String firstname,
    required String lastname,
    required String CreatedAt,
  });
  ResultFuture<List<User>> getUsers();
}
