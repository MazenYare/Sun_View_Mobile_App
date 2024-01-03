import 'package:project/core/usecases/usecases.dart';
import 'package:project/core/utils/typedef.dart';
import 'package:project/src/Authentication/Domain/Entities/User.dart';
import 'package:project/src/Authentication/Domain/Repositories/Authentication_Repositores.dart';

class Getusers extends Usecaseswithoutparams<List<User>> {
  const Getusers(this._repositry);
  final AuthenticationRepositories _repositry;

  @override
  ResultFuture<List<User>> call() async => _repositry.getUsers();
}
