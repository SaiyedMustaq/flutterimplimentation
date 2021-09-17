import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:lazy_loading_listview/blocModule/loginSuccess.dart';
import 'package:lazy_loading_listview/blocModule/login_bloc/LoginBloc.dart';
import 'package:lazy_loading_listview/blocModule/login_event/LoginEvent.dart';
import 'package:lazy_loading_listview/blocModule/login_page/LoginForm.dart';
import 'package:lazy_loading_listview/blocModule/login_state/LoginState.dart';
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
  double _scale;
  AnimationController _controller;
  bool isLoading = false;

  UserRepository _repository = UserRepository();
  LoginBloc signInBloc;
  TextEditingController userNameController = new TextEditingController();
  TextEditingController userPasswordController = new TextEditingController();

  @override
  void initState() {
    signInBloc = new LoginBloc(authenticationRepository: _repository);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    if (kDebugMode) {
      userNameController.text = 'admin@gmail.com';
      userPasswordController.text = '1234567';
    }
    super.initState();
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    signInBloc = BlocProvider.of<LoginBloc>(context);
    _scale = 1 - _controller.value;
    return Scaffold(appBar: AppBar(), body: LoginForm(signInBloc: signInBloc));
  }

  Widget _animatedButton() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0883F7),
              Color(0xFFFF0808),
            ],
          )),
      child: Center(
        child: Text(
          'Login',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
