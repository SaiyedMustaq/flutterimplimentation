abstract class SettingsEvent {
  final dynamic payload;
  SettingsEvent({this.payload});
}

class FontSize extends SettingsEvent {
  FontSize(double payload) : super(payload: payload);
}

class Bold extends SettingsEvent {
  Bold(bool payload) : super(payload: payload);
}

class Italic extends SettingsEvent {
  Italic(bool payload) : super(payload: payload);
}

class SwitchOnOff extends SettingsEvent {
  SwitchOnOff(bool payload) : super(payload: payload);
}
