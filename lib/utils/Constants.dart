import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/networkModule/BaseUrl.dart';
import 'package:lazy_loading_listview/sizeConfigModule/SizeConfig.dart';

class Constants {
  static final RouteName routeName = RouteName();
  static final CommonMethod commonMethod = CommonMethod();
  static final EndPoint endPoint = EndPoint();
  static final AppMargin margin = AppMargin();
  static final AppPadding padding = AppPadding();
  static final AppString appString = AppString();
  static final SizeConfig sizeConfig = SizeConfig();
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

class AppString {
  const AppString();
  final appName = "Flutter Implementation";
}

class AppColor {}

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

class AppMargin {
  const AppMargin();
  final double extraSmall = 8.0;
  final double smallMargin = 10.5;
  final double mediumMargin = 15.0;
  final double largeMargin = 20.0;
  final double extraLargeMargin = 25.0;
}

class AppPadding {
  const AppPadding();
  final double smallPadding = 10.0;
}
