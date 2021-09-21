import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String password;

  const User({this.name, this.password});

  static const empty = User(name: "", password: "");

  @override
  List<Object> get props => [this.name, this.password];
}
