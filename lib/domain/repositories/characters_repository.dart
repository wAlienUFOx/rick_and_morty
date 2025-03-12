import 'package:rick_and_morty/data/models/response_model.dart';

abstract class CharactersRepository {
  Future<ResponseModel> getCharacters(int page);
}
