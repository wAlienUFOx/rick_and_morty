import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/data/repositories/favorite_repository_impl.dart';
import 'package:rick_and_morty/domain/repositories/favorite_repository.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_bloc/favorite_bloc.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/data_sources/local/shared_prefs.dart';
import 'data/data_sources/remote/characters_api_client.dart';
import 'data/repositories/characters_repository_impl.dart';
import 'domain/repositories/characters_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  //Dio
  sl.registerSingleton<Dio>(Dio());

  //SharedPreferences
  SharedPrefs.sharedPreferences = await SharedPreferences.getInstance();

  // Clients
  sl.registerSingleton<CharactersApiClient>(CharactersApiClient(sl()));

  // Dependencies
  sl.registerSingleton<CharactersRepository>(CharactersRepositoryImpl(sl()));
  sl.registerSingleton<FavoriteRepository>(FavoriteRepositoryImpl());

  final CharacterBloc characterBloc = CharacterBloc(sl());
  final FavoriteBloc favoriteBloc = FavoriteBloc(sl());

  //Blocs
  sl.registerFactory<CharacterBloc>(() => characterBloc);
  sl.registerFactory<FavoriteBloc>(() => favoriteBloc);
}
