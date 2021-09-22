// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';
// import 'package:lazy_loading_listview/blocModule/login_bloc/LoginEvent.dart';
// import 'package:lazy_loading_listview/blocModule/login_page/blocLoginPage.dart';
// import 'package:lazy_loading_listview/blocModule/login_bloc/LoginState.dart';
// import 'package:lazy_loading_listview/blocModule/repository/UserRepository.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc({
//     UserRepository authenticationRepository,
//   })  : _authenticationRepository = authenticationRepository,
//         super(const LoginState());

//   UserRepository _authenticationRepository;

//   @override
//   Stream<LoginState> mapEventToState(
//     LoginEvent event,
//   ) async* {
//     if (event is LoginUsernameChanged) {
//       yield _mapUsernameChangedToState(event, state);
//     } else if (event is LoginPasswordChanged) {
//       yield _mapPasswordChangedToState(event, state);
//     } else if (event is LoginSubmitted) {
//       yield* _mapLoginSubmittedToState(event, state);
//     }
//   }

//   LoginState _mapUsernameChangedToState(
//     LoginUsernameChanged event,
//     LoginState state,
//   ) {
//     final username = Username.dirty(event.username);
//     return state.copyWith(
//       username: username,
//       status: Formz.validate([state.password, username]),
//     );
//   }

//   LoginState _mapPasswordChangedToState(
//     LoginPasswordChanged event,
//     LoginState state,
//   ) {
//     final password = Password.dirty(event.password);
//     return state.copyWith(
//       password: password,
//       status: Formz.validate([password, state.username]),
//     );
//   }

//   Stream<LoginState> _mapLoginSubmittedToState(
//     LoginSubmitted event,
//     LoginState state,
//   ) async* {
//     if (state.status.isValidated) {
//       yield state.copyWith(status: FormzStatus.submissionInProgress);
//       try {
//         await _authenticationRepository.signIn(
//           state.username.value,
//           state.password.value,
//         );

//         yield state.copyWith(status: FormzStatus.submissionSuccess);
//       } on Exception catch (_) {
//         yield state.copyWith(status: FormzStatus.submissionFailure);
//       }
//     }
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_loading_listview/blocModule/login_bloc/LoginEvent.dart';
import 'package:lazy_loading_listview/blocModule/login_bloc/LoginState.dart';
import 'package:lazy_loading_listview/blocModule/repository/UserRepository.dart';
import 'package:lazy_loading_listview/utils/Constants.dart';

enum ResponseStatus { SUCCESS, FAILED }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository repository;
  bool checkValue = false;
  bool isInternetAvailable = false;
  LoginBloc(this.repository) : super(null);
  @override
  LoginState get initialState => InitialLoginState();
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      if (event is LoginButtonClickEvent) {
        yield LoginLoading();
        final response = await repository.signIn(event.email, event.password);
        if (response.status == 200) {
          yield LoginSuccess(response);
        } else {
          yield LoginFailed(response.message);
        }
      } else if (event is CheckBoxClickEvent) {
        checkValue = !checkValue;
        yield RememberDone(checkValue);
      }
    } catch (error) {
      yield LoginFailed(error.toString());
    }
  }
}
