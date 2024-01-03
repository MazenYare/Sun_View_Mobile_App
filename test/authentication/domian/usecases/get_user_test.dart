import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project/src/Authentication/Domain/Entities/User.dart';
import 'package:project/src/Authentication/Domain/Repositories/Authentication_Repositores.dart';
import 'package:project/src/Authentication/Domain/usecases/Get_users.dart';
import 'create_user_test.dart';

void main() {
  late AuthenticationRepositories repository;
  late Getusers usecase;

  setUp(() {
    repository = MockAuthRepository();
    usecase = Getusers(repository);
  });

  const tResponse = [User.empty()];

  test(
      'should call [AuthenticationReopsitory.getUsers]  and return [list<Users>]',
      () async {
    //Arrange
    when(() => repository.getUsers())
        .thenAnswer((_) async => const Right(tResponse));
    //Act
    final result = await usecase();
    //Assesrt
    expect(result, equals(const Right<dynamic, List<User>>(tResponse)));
    verify(() => repository.getUsers()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
