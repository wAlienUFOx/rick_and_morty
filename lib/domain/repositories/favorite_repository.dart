import 'package:rick_and_morty/data/models/character_model.dart';

abstract class FavoriteRepository {
  List<Character> getFavoriteCharacters();
  void setFavorites(List<Character> characters);
}