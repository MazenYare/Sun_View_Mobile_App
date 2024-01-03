import 'dart:convert';
import 'package:project/core/utils/typedef.dart';
import 'package:project/src/Authentication/Domain/Entities/User.dart';

class Usermodel extends User {
  const Usermodel({
    required super.id,
    required super.CreatedAt,
    required super.firstname,
    required super.lastname,
  });

  const Usermodel.empty()
      : this(
          firstname: '_empty.firstname',
          lastname: '_empty.lastname',
          id: '1',
          CreatedAt: '_empty.CreatedAt',
        );

  factory Usermodel.fromJson(String source) =>
      Usermodel.fromMap(jsonDecode(source) as DataMap);

  Usermodel.fromMap(DataMap map)
      : this(
          CreatedAt: map['CreatedAt'] as String,
          firstname: map['firstname'] as String,
          lastname: map['lastname'] as String,
          id: map['id'] as String,
        );

  Usermodel copyWith({
    final String? firstname,
    final String? lastname,
    final String? CreatedAt,
    final String? id,
  }) {
    return Usermodel(
      CreatedAt: CreatedAt ?? this.CreatedAt,
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
    );
  }

  DataMap toMap() => {
        'id': id,
        'CreatedAt': CreatedAt,
        'firstname': firstname,
        'lastname': lastname,
      };
  String toJson() => jsonEncode(toMap());
}
