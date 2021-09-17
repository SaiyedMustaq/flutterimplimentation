import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/blocModule/models/SignInResponse.dart';
import 'package:lazy_loading_listview/blocModule/singInCall/SignInApiProvider.dart';
import 'package:lazy_loading_listview/blocModule/singInCall/SignInRequest.dart';

class UserRepository {
  SignInApiProvider _signInApiProvider = SignInApiProvider();
  Future signIn(
    String username, String password
    //LoginRequest loginRequest,
  ) async {
    return await _signInApiProvider.signIn(
      //loginRequest,
      username,password
    );
  }
}
