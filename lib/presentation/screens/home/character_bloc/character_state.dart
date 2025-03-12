import '../../../../data/models/character_model.dart';

abstract class CharacterState {
  List<Character> get props => [];
}

class InitialCharacterState extends CharacterState {
  @override
  List<Character> get props => [];
}

class LoadingCharacterState extends CharacterState {
  @override
  List<Character> get props => [];
}

class LoadingMoreCharacterState extends CharacterState {
  final List<Character> characters;
  LoadingMoreCharacterState(this.characters);

  @override
  List<Character> get props => characters;
}

class ErrorCharacterState extends CharacterState {
  final String msg;
  ErrorCharacterState(this.msg);
  @override
  List<Character> get props => [];
  String get message => msg;
}

class ErrorMoreCharacterState extends CharacterState {
  final List<Character> characters;
  final String msg;
  ErrorMoreCharacterState(this.characters, this.msg);

  @override
  List<Character> get props => characters;
  String get message => msg;
}

class LoadedCharacterState extends CharacterState {
  final List<Character> characters;

  LoadedCharacterState(this.characters);

  @override
  List<Character> get props => characters;
}
