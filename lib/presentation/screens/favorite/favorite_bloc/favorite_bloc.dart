import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/domain/repositories/favorite_repository.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_bloc/favorite_event.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_bloc/favorite_state.dart';

import '../../../../data/models/character_model.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository _favoriteRepository;

  final List<Character> _favorite = [];

  FavoriteBloc(this._favoriteRepository) : super(InitialFavoriteState()) {
    on<LoadFavoriteEvent>((event, emitter) {
      emitter(LoadingFavoriteState());
      _getFavorite(emitter);
    });
    on<AddRemoveFavoriteEvent>((event, emitter) {
      _addRemoveFavorite(event.character, emitter);
    });
  }

  _getFavorite(Emitter<FavoriteState> emit) {
    try {
      final loadedFavorites = _favoriteRepository.getFavoriteCharacters();
      if (loadedFavorites.isEmpty) {
        emit(EmptyFavoriteState());
      } else {
        _favorite.addAll(loadedFavorites);
        _sort();
        emit(LoadedFavoriteState(_favorite));
      }
    } catch (e) {
      emit(ErrorFavoriteState());
    }
  }

  _addRemoveFavorite(Character character, Emitter<FavoriteState> emit) {
    try {
      if (_inFavorite(character)) {
        _favorite.removeWhere((e) => e.id == character.id);
        _favoriteRepository.setFavorites(_favorite);
      } else {
        _favorite.add(character);
        _sort();
        _favoriteRepository.setFavorites(_favorite);
      }
      if (_favorite.isEmpty) {
        emit(EmptyFavoriteState());
      } else {
        emit(LoadedFavoriteState(_favorite));
      }
    } catch (e) {
      emit(ErrorFavoriteState());
    }
  }

  bool _inFavorite(Character character) => _favorite.any((e) => e.id == character.id);

  ///sort by alphabetical order
  void _sort() {
    _favorite.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }
}
