import 'package:project/src/Authentication/Data/models/user_model.dart';

abstract class AuthentactionRemoteDataSource {
  Future<void> createuser(
      {required String firstname,
      required String lastname,
      required String CreatedAt});

  Future<List<Usermodel>> getUsers();
}

class AuthentactionRemoteDataSourceImplementation
    implements AuthentactionRemoteDataSource {
  @override
  Future<void> createuser({
    required String firstname,
    required String lastname,
    required String CreatedAt,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Usermodel>> getUsers() {
    throw UnimplementedError();
  }
}
