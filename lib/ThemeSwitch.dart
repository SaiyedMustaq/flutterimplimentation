import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/main.dart';
import 'package:provider/provider.dart';

import 'ThemeNotifier.dart';

class ThemeSwitch extends StatefulWidget {
  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  var _darkTheme = true;

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Switch(
      activeColor: Theme.of(context).accentColor,
      onChanged: (value) {
        setState(() {
          _darkTheme = value;
        });
        onThemeChanged(value, themeNotifier);
      },
      value: _darkTheme,
    );
  }
}
