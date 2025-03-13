import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_event.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_state.dart';

import '../../../../data/models/character_model.dart';
import '../../../../domain/repositories/characters_repository.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharactersRepository _charactersRepository;

  int _pageIndex = 0;
  bool _hasMore = false;
  final List<Character> _characters = [];

  CharacterBloc(this._charactersRepository) : super(InitialCharacterState()) {
    on<LoadCharacterEvent>((event, emitter) async {
      emitter(LoadingCharacterState());
      await _getCharacters(emitter);
    });
    on<LoadMoreCharacterEvent>((event, emitter) async {
      if (_hasMore) {
        emitter(LoadingMoreCharacterState(_characters));
        await _getCharacters(emitter);
      }
    });
  }

  Future<void> _getCharacters(Emitter<CharacterState> emit) async {
    try {
      final loadedCharacters = await _charactersRepository.getCharacters(_pageIndex + 1);
      _hasMore = loadedCharacters.info.next != null;
      _pageIndex++;
      _characters.addAll(loadedCharacters.results);
      emit(LoadedCharacterState(_characters));
    } on DioException catch (e) {
      if (_pageIndex == 0) {
        emit(
          ErrorCharacterState(
            (e.message ?? '').contains('Failed host lookup')
                ? 'Нет сети'
                : e.response?.data['message'] ?? 'Неопознанная ошибка',
          ),
        );
      } else {
        emit(
          ErrorMoreCharacterState(
            _characters,
            (e.message ?? '').contains('Failed host lookup')
                ? 'Нет сети'
                : e.response?.data['message'] ?? 'Неопознанная ошибка',
          ),
        );
      }
    } catch (e) {
      if (_pageIndex == 0) {
        emit(ErrorCharacterState('Что-то пошло не так. Обновите страницу'));
      } else {
        emit(ErrorMoreCharacterState(_characters, 'Что-то пошло не так'));
      }
    }
  }
}
