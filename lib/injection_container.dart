import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  //Dio
  sl.registerSingleton<Dio>(Dio());

  // Clients
  // sl.registerSingleton<CharactersApiClient>(CharactersApiClient.create(characterApiUrl: apiUrl, dio: sl()));

  // Dependencies
  // sl.registerSingleton<CharactersRepository>(CharactersRepositoryImpl(sl(), sl()));

  // final CharacterBloc routesBloc = CharacterBloc(sl());
  // final FavoritesBloc favoritesBloc = FavoritesBloc();

  //Blocs
  // sl.registerFactory<FavoritesBloc>(() => favoritesBloc);
}
