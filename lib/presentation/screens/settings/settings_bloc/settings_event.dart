abstract class SettingsEvent {
  const SettingsEvent();
}

class LoadSettingsEvent extends SettingsEvent {
  const LoadSettingsEvent();
}

class ChangeThemeSettingsEvent extends SettingsEvent {
  const ChangeThemeSettingsEvent(this.darkTheme);
  final bool darkTheme;
}