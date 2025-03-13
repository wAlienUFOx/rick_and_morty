import 'package:rick_and_morty/presentation/theme/custom_theme.dart';

abstract class SettingsRepository {
  AppTheme getTheme();
  void setTheme(AppTheme appTheme);
}