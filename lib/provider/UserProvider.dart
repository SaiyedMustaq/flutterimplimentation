import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/blocModule/models/SignInResponse.dart';

class UserProvider with ChangeNotifier {
  SignInResponse _user = new SignInResponse();

  SignInResponse get user => _user;

  void setUser(SignInResponse user) {
    _user = user;
    notifyListeners();
  }
}
