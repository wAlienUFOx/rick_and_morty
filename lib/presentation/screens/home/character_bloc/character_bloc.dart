import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_event.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_state.dart';

import '../../../../data/models/character_model.dart';
import '../../../../domain/repositories/characters_repository.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharactersRepository _charactersRepository;

  int pageIndex = 0;
  bool hasMore = false;
  List<Character> characters = [];

  CharacterBloc(this._charactersRepository) : super(InitialCharacterState()) {
    on<LoadCharacterEvent>((event, emitter) async {
      emitter(LoadingCharacterState());
      await _getCharacters(emitter);
    });
    on<LoadMoreCharacterEvent>((event, emitter) async {
      if (hasMore) {
        emitter(LoadingMoreCharacterState(characters));
        await _getCharacters(emitter);
      }
    });
  }

  Future<void> _getCharacters(Emitter<CharacterState> emit) async {
    try {
      final loadedCharacters = await _charactersRepository.getCharacters(pageIndex + 1);
      hasMore = loadedCharacters.info.next != null;
      pageIndex++;
      characters.addAll(loadedCharacters.results);
      emit(LoadedCharacterState(characters));
    } on DioException catch (e) {
      if (pageIndex == 0) {
        emit(
          ErrorCharacterState(
            (e.message ?? '').contains('Failed host lookup')
                ? 'Нет сети'
                : e.response?.data['message'] ?? 'Неопознанная ошибка',
          ),
        );
      } else {
        emit(ErrorMoreCharacterState(characters));
      }
    } catch (e) {
      if (pageIndex == 0) {
        emit(ErrorCharacterState('Что-то пошло не так. Обновите страницу'));
      } else {
        emit(ErrorMoreCharacterState(characters));
      }
    }
  }
}
