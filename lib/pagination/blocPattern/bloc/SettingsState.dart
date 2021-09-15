abstract class SettingsState {
  final double sliderFontSize;
  final bool isBold;
  final bool isItalic;
  final bool isOn;

  SettingsState({this.sliderFontSize, this.isBold, this.isItalic, this.isOn});

  double get fontSize => sliderFontSize * 30;
}

class InitialSettingsState extends SettingsState {
  InitialSettingsState()
      : super(sliderFontSize: 0.5, isBold: false, isItalic: false, isOn: false);
}

class NewSettingState extends SettingsState {
  NewSettingState.fromOldSettingState(SettingsState oldState,
      {double sliderFontSize, bool isBold, bool isItalic, bool isOn})
      : super(
            sliderFontSize: sliderFontSize ?? oldState.sliderFontSize,
            isBold: isBold ?? oldState.isBold,
            isItalic: isItalic ?? oldState.isItalic,
            isOn: isOn ?? oldState.isOn);
}
