import 'package:rick_and_morty/data/models/character_model.dart';

abstract class FavoriteEvent {
  const FavoriteEvent();
}

class LoadFavoriteEvent extends FavoriteEvent {
  const LoadFavoriteEvent();
}

class AddRemoveFavoriteEvent extends FavoriteEvent {
  const AddRemoveFavoriteEvent(this.character);
  final Character character;
}