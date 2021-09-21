

import 'package:equatable/equatable.dart';
import 'package:lazy_loading_listview/blocModule/models/UserLoginResponse.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<dynamic> get props => [];
}

class LoginLoading extends LoginState {
  const LoginLoading();
  @override
  List<dynamic> get props => [];
}

class LoginSuccess extends LoginState {
  final ModelLoginResponse response;
  const LoginSuccess(this.response);
  @override
  List<dynamic> get props => [response];
}

class LoginFailed extends LoginState {
  final String error;
  const LoginFailed(this.error);
  @override
  List<dynamic> get props => [error];
}

class RememberDone extends LoginState {
  final bool remember;
  const RememberDone(this.remember);
  @override
  List<dynamic> get props => [remember];
}

