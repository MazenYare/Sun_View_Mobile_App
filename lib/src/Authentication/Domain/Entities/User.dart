import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.CreatedAt,
  });

  const User.empty()
      : this(
            id: '1',
            CreatedAt: '_.empty.CreatedAt',
            firstname: '_empty.firstname',
            lastname: '_empty.lastname');

  final String firstname;
  final String id;
  final String lastname;
  final String CreatedAt;

  @override
  List<Object?> get props => [
        id,
        CreatedAt,
        firstname,
        lastname,
      ];
}

void main() {
  // ignore: unused_local_variable, prefer_const_constructors
  final user1 = User(
    id: '1',
    firstname: 'firstname',
    lastname: 'lastname',
    CreatedAt: 'CreatedAt',
  );
}
