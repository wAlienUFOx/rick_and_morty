import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_bloc.dart';

import 'data/data_sources/remote/characters_api_client.dart';
import 'data/repositories/characters_repository_impl.dart';
import 'domain/repositories/characters_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  //Dio
  sl.registerSingleton<Dio>(Dio());

  // Clients
  sl.registerSingleton<CharactersApiClient>(CharactersApiClient(sl()));

  // Dependencies
  sl.registerSingleton<CharactersRepository>(CharactersRepositoryImpl(sl()));

  final CharacterBloc characterBloc = CharacterBloc(sl());
  // final FavoritesBloc favoritesBloc = FavoritesBloc();

  //Blocs
  sl.registerFactory<CharacterBloc>(() => characterBloc);
  // sl.registerFactory<FavoritesBloc>(() => favoritesBloc);
}
