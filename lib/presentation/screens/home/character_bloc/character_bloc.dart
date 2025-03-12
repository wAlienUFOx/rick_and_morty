import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_event.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_state.dart';

import '../../../../domain/repositories/characters_repository.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharactersRepository _charactersRepository;

  int pageIndex = 1;
  bool hasMore = false;

  CharacterBloc(this._charactersRepository) : super(InitialCharacterState()) {
    on<LoadedCharacterEvent>((event, emitter) => _onLoaded(event, emitter));
    on<LoadCharacterEvent>((event, emitter) {
      emitter(LoadingCharacterState());
      _getCharacters(emitter);
    });
    on<LoadMoreCharacterEvent>((event, emitter) {
      if (hasMore) {
        pageIndex++;
        emitter(LoadingMoreCharacterState());
        _getCharacters(emitter);
      }
    });
  }

  Future<void> _onLoaded(LoadedCharacterEvent event, Emitter<CharacterState> emit) async {
    if (event.characters != null) {
      emit(LoadedCharacterState(event.characters!));
    } else {
      if (pageIndex == 1) {
        emit(ErrorCharacterState());
      } else {
        emit(ErrorMoreCharacterState());
      }
      _getCharacters(emit);
    }
  }

  Future<void> _getCharacters(Emitter<CharacterState> emit) async {
    _charactersRepository.getCharacters(pageIndex).then((value) {
      hasMore = value.info.next != null;
      add(LoadedCharacterEvent(value.results));
    });
  }
}
