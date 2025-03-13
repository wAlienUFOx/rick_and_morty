import '../../../../data/models/character_model.dart';

abstract class CharacterState {
  List<Character> get characters => [];
}

class InitialCharacterState extends CharacterState {
  @override
  List<Character> get characters => [];
}

class LoadingCharacterState extends CharacterState {
  @override
  List<Character> get characters => [];
}

class LoadingMoreCharacterState extends CharacterState {
  final List<Character> _characters;
  LoadingMoreCharacterState(this._characters);

  @override
  List<Character> get characters => _characters;
}

class ErrorCharacterState extends CharacterState {
  final String _msg;
  ErrorCharacterState(this._msg);
  @override
  List<Character> get characters => [];
  String get message => _msg;
}

class ErrorMoreCharacterState extends CharacterState {
  final List<Character> _characters;
  final String _message;
  ErrorMoreCharacterState(this._characters, this._message);

  @override
  List<Character> get characters => _characters;
  String get message => _message;
}

class LoadedCharacterState extends CharacterState {
  final List<Character> _characters;

  LoadedCharacterState(this._characters);

  @override
  List<Character> get characters => _characters;
}
