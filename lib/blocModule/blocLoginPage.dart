import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_loading_listview/blocModule/AuthenticationBloc.dart';
import 'package:lazy_loading_listview/blocModule/LoginBloc.dart';
import 'package:lazy_loading_listview/blocModule/LoginForm.dart';
import 'package:lazy_loading_listview/blocModule/UserRepository.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;
  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: LoginForm(
        authenticationBloc: _authenticationBloc,
        loginBloc: _loginBloc,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
