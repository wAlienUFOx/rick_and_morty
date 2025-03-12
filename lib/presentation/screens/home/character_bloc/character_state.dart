import '../../../../data/models/character_model.dart';

abstract class CharacterState {
  List<Object?> get props => [];
}

class InitialCharacterState extends CharacterState {
  @override
  List<Object> get props => [];
}

class LoadingCharacterState extends CharacterState {
  @override
  List<Object> get props => [];
}

class LoadingMoreCharacterState extends CharacterState {
  @override
  List<Object> get props => [];
}

class ErrorCharacterState extends CharacterState {
  @override
  List<Object> get props => [];
}

class ErrorMoreCharacterState extends CharacterState {
  @override
  List<Object> get props => [];
}

class LoadedCharacterState extends CharacterState {
  final List<Character> characters;

  LoadedCharacterState(this.characters);

  @override
  List<Object> get props => [characters];
}
