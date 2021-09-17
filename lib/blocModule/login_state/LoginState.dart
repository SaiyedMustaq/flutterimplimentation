import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:lazy_loading_listview/blocModule/login_page/blocLoginPage.dart';
import 'package:lazy_loading_listview/blocModule/models/SignInResponse.dart';

// abstract class LoginState extends Equatable {
//    const LoginState();

// }

// class InitialLoginState extends LoginState {
//   @override
// List<dynamic> get props => [];

// }

// class LoginLoading extends LoginState{
// const LoginLoading();
//   @override
// List<dynamic> get props => [];

// }

// class LoginSuccess extends LoginState{
//   final SignInResponse response;
//   const LoginSuccess(this.response);

//   @override
//   List<dynamic> get props => [response];
// }

// class LoginFailed extends LoginState{
//   final String error;
//   const LoginFailed(this.error);

//   @override
//   List<dynamic> get props => [error];
// }

class LoginState extends Equatable {
  final FormzStatus status;
  final Username username;
  final Password password;

  const LoginState(
      {this.status = FormzStatus.pure,
      this.username = const Username.pure(),
      this.password = const Password.pure()});

  @override
  List<Object> get props => [this.status, this.username, this.password];

  LoginState copyWith(
      {FormzStatus status, Username username, Password password}) {
    return LoginState(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password);
  }
}

class LoginInitial extends LoginState {}