import 'dart:convert';
import 'package:rick_and_morty/data/models/character_model.dart';
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
}

class SharedPrefsNames {
  static String favorites = 'favorites';
}
