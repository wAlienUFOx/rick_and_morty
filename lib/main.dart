import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/navigation/go_router_configuration.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_bloc/favorite_bloc.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_bloc/favorite_event.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_bloc.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_event.dart';
import 'package:rick_and_morty/presentation/screens/settings/settings_bloc/settings_bloc.dart';
import 'package:rick_and_morty/presentation/screens/settings/settings_bloc/settings_event.dart';
import 'package:rick_and_morty/presentation/screens/settings/settings_bloc/settings_state.dart';
import 'package:rick_and_morty/presentation/theme/custom_theme.dart';

import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharacterBloc>(create: (context) => sl()..add(LoadCharacterEvent())),
        BlocProvider<FavoriteBloc>(create: (context) => sl()..add(LoadFavoriteEvent())),
        BlocProvider<SettingsBloc>(create: (context) => sl()..add(LoadSettingsEvent())),
      ],
      child: Provider(
        create: (context) => GoRouterConfiguration(),
        child: Builder(
          builder: (context) {
            return BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return ThemeProvider(
                  appTheme: state.appTheme,
                  child: MaterialApp.router(
                    routerConfig: Provider.of<GoRouterConfiguration>(context).router,
                    debugShowCheckedModeBanner: false,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
