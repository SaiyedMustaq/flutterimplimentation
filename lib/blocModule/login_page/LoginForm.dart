import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_loading_listview/blocModule/login_bloc/LoginBloc.dart';
import 'package:lazy_loading_listview/blocModule/login_bloc/LoginEvent.dart';
import 'package:lazy_loading_listview/blocModule/login_bloc/LoginState.dart';
import 'package:lazy_loading_listview/blocModule/login_page/LoginLogo.dart';

class LoginBlocForm extends StatelessWidget {
  const LoginBlocForm({
    Key key,
    @required this.userNameController,
    @required this.userPasswordController,
    @required this.signInBloc,
  }) : super(key: key);

  final TextEditingController userNameController;
  final TextEditingController userPasswordController;
  final LoginBloc signInBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      cubit: signInBloc,
      builder: (BuildContext context, LoginState state) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                LoginLogo(),
                Padding(padding: EdgeInsets.all(12)),
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                      hintText: 'Enter Email', labelText: 'Email'),
                ),
                Padding(padding: EdgeInsets.all(12)),
                TextFormField(
                  controller: userPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                  ),
                ),
                Padding(padding: EdgeInsets.all(12)),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    signInBloc.add(LoginButtonClickEvent(
                        userNameController.text.trim(),
                        userPasswordController.text.trim()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 15.0),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        signInBloc.add(CheckBoxClickEvent());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Checkbox(
                              value: signInBloc.checkValue,
                              onChanged: (vale) {
                                signInBloc.add(CheckBoxClickEvent());
                              }),
                          Text('Remember me?')
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
