import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_loading_listview/pagination/blocPattern/bloc/SettingsBloc.dart';
import 'package:lazy_loading_listview/pagination/blocPattern/bloc/blocImpoert.dart';

class BlocPattenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<SettingsBloc>(
        create: (context) => SettingsBloc(),
        child: blocPatternPage(),
      ),
    );
  }
}

class blocPatternPage extends StatelessWidget {
  int counter = 0;
  SettingsBloc settingsBloc;
  void dispose() {
    settingsBloc.close();
  }

  Widget build(BuildContext context) {
    settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        appBar: AppBar(
          title: Text('Bloc Counter Example'),
        ),
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Font Size: ${state.fontSize.toInt()}',
                    style: TextStyle(fontSize: state.fontSize),
                  ),
                ),
                Slider(
                    min: 0.5,
                    value: state.sliderFontSize,
                    onChanged: (newValue) {
                      settingsBloc.add(FontSize(newValue));
                    }),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: state.isBold,
                        onChanged: (newVal) {
                          settingsBloc.add(Bold(newVal));
                        },
                      ),
                      Text(
                        'Bold',
                        style: getStyle(state.isBold, false),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                          value: state.isItalic,
                          onChanged: (newVal) {
                            settingsBloc.add(Italic(newVal));
                          }),
                      Text(
                        'Italic',
                        style: getStyle(false, state.isItalic),
                      ),
                    ],
                  ),
                ),
                Switch(
                    value: state.isOn,
                    onChanged: (value) {
                      settingsBloc.add(SwitchOnOff(value));
                    })
              ],
            );
          },
        ));
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
