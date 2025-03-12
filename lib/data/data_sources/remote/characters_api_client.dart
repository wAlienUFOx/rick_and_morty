import 'package:dio/dio.dart';
import '../../models/response_model.dart';

class CharactersApiClient {
  CharactersApiClient(this._dio);

  final Dio _dio;

  final baseUrl = 'https://rickandmortyapi.com/api/character/?page=';

  Future<ResponseModel> getCharacters(int page) async {
    final result = await _dio.get<Map<String, dynamic>>('$baseUrl$page');
    var value = ResponseModel.fromJson(result.data!);
    return value;
  }
}
