import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/core/utils/typedef.dart';
import 'package:project/src/Authentication/Data/models/user_model.dart';
import 'package:project/src/Authentication/Domain/Entities/User.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = Usermodel.empty();
  test('should be subclass of user entitiy', () {
    //Assert
    expect(tModel, isA<User>());
  });

  final tjson = fixture('user.json');
  final tMap = jsonDecode(tjson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with right data', () {
      //Act
      final result = Usermodel.fromMap(tMap);
      //Assert
      expect(result, equals(tModel));
    });
  });
  group("fromJson", () {
    test('Should return [UserModel] with Right data', () {
      //Act
      final result = Usermodel.fromJson(tjson);
      //Assert
      expect(result, equals(tModel));
    });
  });
  group('tMap', () {
    test('Should return a [Map] with right data ', () {
      //Act
      final result = tModel.toMap();
      //Assert
      expect(result, equals(tMap));
    });
  });
  group('toJson', () {
    test('Should return a [Json] with right data ', () {
      //Act
      final result = tModel.toJson();
      final tJson = jsonEncode({
        "id": "1",
        "dateOfBirth": "_empty.dateOfBirth",
        "firstname": "_empty.firstname",
        "lastname": "_empty.lastname",
        "gender": "_empty.gender",
        "weight": 1,
        "hight": 1,
        "bloodType": "_empty.bloodType"
      });
      //Assert
      expect(result, tJson);
    });
  });
  group('CopyWith', () {
    test('Should return [UserModel] with a different data', () {
      //Act
      final result = tModel.copyWith(firstname: 'Haneen');
      //Assert
      expect(result.firstname, equals('Haneen'));
    });
  });
}
