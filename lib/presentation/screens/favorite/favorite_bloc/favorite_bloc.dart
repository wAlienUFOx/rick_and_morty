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
        emit(LoadedFavoriteState(_favorite));
      }
    } catch (e) {
      emit(ErrorFavoriteState());
    }
  }

  Future<void> _addRemoveFavorite(Character character, Emitter<FavoriteState> emit) async {
    try {
      if (inFavorite(character)) {
        _favorite.remove(character);
        _favoriteRepository.setFavorites(_favorite);
      } else {
        _favorite.add(character);
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

  bool inFavorite(Character character) => _favorite.any((e) => e.id == character.id);
}
