import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:formz/formz.dart';
import 'package:lazy_loading_listview/blocModule/loginSuccess.dart';
import 'package:lazy_loading_listview/blocModule/login_bloc/LoginBloc.dart';
import 'package:lazy_loading_listview/blocModule/login_bloc/LoginEvent.dart';
import 'package:lazy_loading_listview/blocModule/login_page/LoginForm.dart';
import 'package:lazy_loading_listview/blocModule/login_bloc/LoginState.dart';
import 'package:lazy_loading_listview/blocModule/repository/UserRepository.dart';
import 'package:lazy_loading_listview/blocModule/singInCall/SignInRequest.dart';
import 'package:lazy_loading_listview/utils/Constants.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;
  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;

  UserRepository _repository = UserRepository();
  LoginBloc signInBloc;
  TextEditingController userNameController = new TextEditingController();
  TextEditingController userPasswordController = new TextEditingController();

  @override
  void initState() {
    signInBloc = new LoginBloc(_repository);

    if (kDebugMode) {
      userNameController.text = 'admin@gmail.com';
      userPasswordController.text = '12345678';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    signInBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              EasyLoading.show(status: 'loading...');
            } else if (state is LoginFailed) {
              EasyLoading.dismiss();
              Constants.commonMethod.showSnack(
                  context: context, message: state.error, actionText: '');
            } else if (state is LoginSuccess) {
              EasyLoading.dismiss();
              Constants.commonMethod.showSnack(
                  context: context,
                  message: state.response.message,
                  actionText: '');
            }
          },
          child: LoginBlocForm(
              userNameController: userNameController,
              userPasswordController: userPasswordController,
              signInBloc: signInBloc),
        ));
  }

  @override
  void dispose() {
    super.dispose();

    signInBloc.close();
  }
}





enum UsernameValidationError { empty }
enum PasswordValidationError { empty }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty([String value = '']) : super.dirty(value);

  @override
  UsernameValidationError validator(String value) {
    return value?.isNotEmpty == true ? null : UsernameValidationError.empty;
  }
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError validator(String value) {
    return value?.isNotEmpty == true ? null : PasswordValidationError.empty;
  }
}

class MyLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.1,
      child: Container(),
    );
  }
}
