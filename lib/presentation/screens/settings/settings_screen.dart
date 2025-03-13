import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/screens/settings/settings_bloc/settings_bloc.dart';
import 'package:rick_and_morty/presentation/screens/settings/settings_bloc/settings_event.dart';
import 'package:rick_and_morty/presentation/screens/settings/settings_bloc/settings_state.dart';
import 'package:rick_and_morty/presentation/theme/custom_theme.dart';
import 'package:rick_and_morty/presentation/widgets/settings/settings_tile.dart';

import '../../theme/colors.dart';
import '../../widgets/main_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.of(context).secondaryBG,
      appBar: const MainAppBar(title: 'Настройки'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return ListView(
              children: [
                SettingsTile(
                  title: 'Тёмная тема',
                  active: state.appTheme == AppTheme.dark,
                  onSwitch: (bool value) => BlocProvider.of<SettingsBloc>(context).add(ChangeThemeSettingsEvent(value)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
