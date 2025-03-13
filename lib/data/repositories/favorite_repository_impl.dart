import 'package:rick_and_morty/data/data_sources/local/shared_prefs.dart';
import 'package:rick_and_morty/data/models/character_model.dart';
import '../../domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl();

  @override
  List<Character> getFavoriteCharacters() {
    return SharedPrefs.favorites;
  }

  @override
  void setFavorites(List<Character> characters) {
    SharedPrefs.favorites = characters;
  }
}
