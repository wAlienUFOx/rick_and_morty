import 'dart:convert';
import 'package:rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty/data/models/response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences sharedPreferences;

  /// избранные персонажи
  static List<Character> get favorites =>
      (sharedPreferences.getStringList(SharedPrefsNames.favorites) ?? [])
          .map((e) => Character.fromJson(json.decode(e)))
          .toList();

  static set favorites(List<Character> value) =>
      sharedPreferences.setStringList(SharedPrefsNames.favorites, value.map((e) => json.encode(e.toJson())).toList());

  /// тёмная тема
  static bool get darkTheme => sharedPreferences.getBool(SharedPrefsNames.darkTheme) ?? false;

  static set darkTheme(bool darkTheme) => sharedPreferences.setBool(SharedPrefsNames.darkTheme, darkTheme);

  /// сохранённые персонажи
  static ResponseModel? getCached(int page) {
    final String? cachedString = sharedPreferences.getString('SharedPrefsNames.cachedCharacters$page');
    if (cachedString == null) return null;
    return ResponseModel.fromJson(json.decode(cachedString));
  }

  static setCached(int page, ResponseModel value) =>
      sharedPreferences.setString('SharedPrefsNames.cachedCharacters$page', json.encode(value.toJson()));
}

class SharedPrefsNames {
  static String favorites = 'favorites';
  static String darkTheme = 'darkTheme';
  static String cachedCharacters = 'cachedCharacters_';
}
