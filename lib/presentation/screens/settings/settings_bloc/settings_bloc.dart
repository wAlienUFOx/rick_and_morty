import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/domain/repositories/settings_repository.dart';
import 'package:rick_and_morty/presentation/screens/settings/settings_bloc/settings_event.dart';
import 'package:rick_and_morty/presentation/screens/settings/settings_bloc/settings_state.dart';
import 'package:rick_and_morty/presentation/theme/custom_theme.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _settingsRepository;

  SettingsBloc(this._settingsRepository) : super(InitialSettingsState()) {
    on<LoadSettingsEvent>((event, emitter) {
      _getSettings(emitter);
    });
    on<ChangeThemeSettingsEvent>((event, emitter) {
      _changeTheme(event.darkTheme, emitter);
    });
  }

  _getSettings(Emitter<SettingsState> emit) {
    try {
      final appTheme = _settingsRepository.getTheme();
      emit(LoadedSettingsState(appTheme));
    } catch (e) {
      emit(LoadedSettingsState(AppTheme.light));
    }
  }

  _changeTheme(bool darkTheme, Emitter<SettingsState> emit) {
    final AppTheme appTheme = darkTheme ? AppTheme.dark : AppTheme.light;
    try {
      _settingsRepository.setTheme(appTheme);
      emit(LoadedSettingsState(appTheme));
    } catch (e) {
      emit(LoadedSettingsState(appTheme));
    }
  }
}
