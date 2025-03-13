import 'package:rick_and_morty/data/data_sources/remote/characters_api_client.dart';
import 'package:rick_and_morty/data/models/response_model.dart';
import 'package:rick_and_morty/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  CharactersRepositoryImpl(this._charactersApiClient);

  final CharactersApiClient _charactersApiClient;

  @override
  Future<ResponseModel> getCharacters(int page) async {
    return await _charactersApiClient.getCharacters(page);
  }
}
