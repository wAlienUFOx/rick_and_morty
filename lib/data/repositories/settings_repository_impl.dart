import 'package:rick_and_morty/presentation/theme/custom_theme.dart';

import '../../domain/repositories/settings_repository.dart';
import '../data_sources/local/shared_prefs.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl();

  @override
  AppTheme getTheme() {
    return SharedPrefs.darkTheme ? AppTheme.dark : AppTheme.light;
  }

  @override
  void setTheme(AppTheme appTheme) {
    SharedPrefs.darkTheme = appTheme == AppTheme.dark;
  }
}
