import '../../../../data/models/character_model.dart';

abstract class CharacterEvent {
  const CharacterEvent();

  List<Object?> get props => [];
}

class LoadCharacterEvent extends CharacterEvent {
  const LoadCharacterEvent();

  @override
  List<Object?> get props => [];
}

class LoadMoreCharacterEvent extends CharacterEvent {
  const LoadMoreCharacterEvent();

  @override
  List<Object?> get props => [];
}

class LoadedCharacterEvent extends CharacterEvent {
  final List<Character>? characters;

  const LoadedCharacterEvent(this.characters);

  @override
  List<Object?> get props => [characters];
}