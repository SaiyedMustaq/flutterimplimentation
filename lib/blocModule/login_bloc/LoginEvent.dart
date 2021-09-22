// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class InternetCheckEvent extends LoginEvent {
  final bool checkInternet;
  final String message;
  InternetCheckEvent({this.checkInternet, this.message});
  @override
  List<Object> get props => [checkInternet, message];
}

class LoginButtonClickEvent extends LoginEvent {
  final String email;
  final String password;
  const LoginButtonClickEvent(this.email, this.password);
  @override
  List<dynamic> get props => [email, password];
}

class CheckBoxClickEvent extends LoginEvent {
  final bool checkValue = false;
  @override
  List<Object> get props => [checkValue];
}
