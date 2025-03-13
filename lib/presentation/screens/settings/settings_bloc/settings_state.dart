import 'package:rick_and_morty/presentation/theme/custom_theme.dart';

abstract class SettingsState {
  AppTheme get appTheme => AppTheme.light;
}

class InitialSettingsState extends SettingsState {
  @override
  AppTheme get appTheme => AppTheme.light;
}

class LoadedSettingsState extends SettingsState {
  final AppTheme _appTheme;
  LoadedSettingsState(this._appTheme);

  @override
  AppTheme get appTheme => _appTheme;
}
