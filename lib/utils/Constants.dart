import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/networkModule/BaseUrl.dart';

class Constants {
  static final RouteName routeName = RouteName();
  static final CommonMethod commonMethod = CommonMethod();
  static final EndPoint endPoint = EndPoint();
}

class RouteName {
  const RouteName();

  final homePage = '/';
  final pageOne = '/onePage';
  final pageTwo = '/pageTwo';
  final pageThree = '/pageThree';
  final pageFour = '/pageFour';
  final pageFive = '/pageFive';
}

class CommonMethod {
  const CommonMethod();

  void showSnack({
    @required BuildContext context,
    @required String message,
    @required String actionText,
    Function doAction,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: actionText,
        textColor: Colors.white,
        onPressed: () {
          doAction();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
