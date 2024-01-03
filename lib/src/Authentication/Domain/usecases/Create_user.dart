import 'package:equatable/equatable.dart';
import 'package:project/core/usecases/usecases.dart';
import 'package:project/core/utils/typedef.dart';
import 'package:project/src/Authentication/Domain/Repositories/Authentication_Repositores.dart';

class CreateUser extends usecaseswithparams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepositories _repository;

  @override
  ResultVoid call(CreateUserParams params) async => _repository.createUsers(
        firstname: params.firstname,
        CreatedAt: params.CreatedAt,
        lastname: params.lastname,
      );
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.CreatedAt,
    required this.firstname,
    required this.lastname,
  });
  const CreateUserParams.empty()
      : this(
            CreatedAt: '_.empty.CreatedAt',
            firstname: '_empty.firstname',
            lastname: '_empty.lastname');

  final String firstname;
  final String CreatedAt;
  final String lastname;

  @override
  List<Object?> get props => [firstname, lastname, CreatedAt];
}
