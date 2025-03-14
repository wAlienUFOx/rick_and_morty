import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/data_sources/local/shared_prefs.dart';
import 'package:rick_and_morty/data/data_sources/remote/characters_api_client.dart';
import 'package:rick_and_morty/data/models/response_model.dart';
import 'package:rick_and_morty/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  CharactersRepositoryImpl(this._charactersApiClient);

  final CharactersApiClient _charactersApiClient;

  @override
  Future<ResponseModel> getCharacters(int page) async {
    try {
      final response =  await _charactersApiClient.getCharacters(page);
      SharedPrefs.setCached(page, response);
      return response;
    } on DioException {
      final cachedCharacters = SharedPrefs.getCached(page);
      if (cachedCharacters != null) return cachedCharacters;
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
