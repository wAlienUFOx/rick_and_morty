import '../../../../data/models/character_model.dart';

abstract class FavoriteState {
  List<Character> get favorite => [];
}

class InitialFavoriteState extends FavoriteState {
  @override
  List<Character> get favorite => [];
}

class LoadingFavoriteState extends FavoriteState {
  @override
  List<Character> get favorite => [];
}

class ErrorFavoriteState extends FavoriteState {
  @override
  List<Character> get favorite => [];
}

class LoadedFavoriteState extends FavoriteState {
  final List<Character> _favorite;
  LoadedFavoriteState(this._favorite);

  @override
  List<Character> get favorite => _favorite;
}

class EmptyFavoriteState extends FavoriteState {
  @override
  List<Character> get favorite => [];
}
