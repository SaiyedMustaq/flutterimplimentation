import 'package:equatable/equatable.dart';
import 'package:lazy_loading_listview/blocModule/models/SignInResponse.dart';
import 'package:lazy_loading_listview/blocModule/singInCall/SignInRequest.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent {
  final String username;
  const LoginUsernameChanged(this.username);

  @override
  List<Object> get props => [this.username];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  const LoginPasswordChanged(this.password);

  @override
  List<Object> get props => [this.password];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}
