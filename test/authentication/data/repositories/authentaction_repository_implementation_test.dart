import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project/core/errors/exception.dart';
import 'package:project/core/errors/faliuers.dart';
import 'package:project/src/Authentication/Data/Repositories/Authentaction_repository_implementation.dart';
import 'package:project/src/Authentication/Data/datasources/authentaction_remote_data_source.dart';

class MockAuthentactionRemoteDataSource extends Mock
    implements AuthentactionRemoteDataSource {}

void main() {
  late AuthentactionRemoteDataSource remoteDataSource;
  late AuthentactionRepositoryimplementation repositoryimplementation;
  setUp(() {
    remoteDataSource = MockAuthentactionRemoteDataSource();
    repositoryimplementation =
        AuthentactionRepositoryimplementation(remoteDataSource);
  });

  const tException =
      ApiExcption(massage: 'Unknown Error Ocuerrd', statuscode: 500);
  group('createuser', () {
    const firstname = 'whatever.firstname';
    const lastname = 'whatever.lastname';
    const CreatedAt = 'whatever.CreatedAt';
    test(
        'Should call the [RemoteDataSource.createUser] and Complete'
        'successfully when the call to the remote source is successfully',
        () async {
      //Arrange
      when(() => remoteDataSource.createuser(
          firstname: any(named: 'firstname'),
          lastname: any(named: 'lastname'),
          CreatedAt: any(named: 'CreatedAt'),
          )).thenAnswer((_) async => Future.value());
      //Act

      final result = await repositoryimplementation.createUsers(
          CreatedAt: CreatedAt,
          firstname: firstname,
          lastname: lastname,);
      //Assesrt
      expect(result, equals(const Right(null)));
      verify(() => remoteDataSource.createuser(
            firstname: firstname,
            lastname: lastname,
            CreatedAt: CreatedAt,
          )).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
    test(
        'should return a [ApiFaliure] when the call to the remote source is unsuccessful ',
        () async {
      when(() => remoteDataSource.createuser(
          firstname: any(named: 'firstname'),
          lastname: any(named: 'lastname'),
          CreatedAt: any(named: 'CreatAd'),)).thenThrow(tException);
      final result = await repositoryimplementation.createUsers(
          firstname: firstname,
          lastname: lastname,
          CreatedAt: CreatedAt);
      expect(
          result,
          equals(const Left(
              ApiFaliure(msg: 'Unknown Error Ocuerrd', statecode: 500))));
      verify(() => remoteDataSource.createuser(
          firstname: firstname,
          lastname: lastname,
          CreatedAt: CreatedAt)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
