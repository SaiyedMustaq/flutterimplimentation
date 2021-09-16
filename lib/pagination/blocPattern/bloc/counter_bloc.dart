import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:lazy_loading_listview/pagination/blocPattern/bloc/blocImpoert.dart';



class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(SettingsState initialState) : super(null);

  @override
  SettingsState get initialState => InitialSettingsState();

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is FontSize) {
      yield NewSettingState.fromOldSettingState(state,
          sliderFontSize: event.payload);
    } else if (event is Bold) {
      yield NewSettingState.fromOldSettingState(state, isBold: event.payload);
    } else if (event is Italic) {
      yield NewSettingState.fromOldSettingState(state, isItalic: event.payload);
    }
  }
}
