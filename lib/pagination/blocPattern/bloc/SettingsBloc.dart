import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_loading_listview/pagination/blocPattern/bloc/blocImpoert.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(InitialSettingsState());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is FontSize) {
      yield NewSettingState.fromOldSettingState(state,
          sliderFontSize: event.payload);
    } else if (event is Bold) {
      yield NewSettingState.fromOldSettingState(state, isBold: event.payload);
    } else if (event is Italic) {
      yield NewSettingState.fromOldSettingState(state, isItalic: event.payload);
    } else if (event is SwitchOnOff) {
      yield NewSettingState.fromOldSettingState(state, isOn: event.payload);
    }
  }
}
