import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project/src/Authentication/Domain/Repositories/Authentication_Repositores.dart';
import 'package:project/src/Authentication/Domain/usecases/Create_user.dart';

class MockAuthRepository extends Mock implements AuthenticationRepositories {}

void main() {
  late CreateUser usecase;
  late AuthenticationRepositories repository;

  setUpAll(() {
    repository = MockAuthRepository();
    usecase = CreateUser(repository);
  });
  const params = CreateUserParams.empty();
  test('Should call the [AuthenticationRepository.createuser]', () async {
    //Arrange
    when(() => repository.createUsers(
            firstname: any(named: 'firstname'),
            lastname: any(named: 'lastname'),
            CreatedAt: any(named: 'CreatedAt'),))
        .thenAnswer((invocation) async => const Right(null));
    //Act
    final result = await usecase(params);
    //Assesrt
    expect(result, equals(const Right<dynamic, void>(null)));
    verify(() => repository.createUsers(
        firstname: params.firstname,
        lastname: params.lastname,
        CreatedAt: params.CreatedAt,)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
