import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class Character {
  final int id;
  final String name;
  final String image;
  final String gender;
  final String status;

  Character(this.id, this.name, this.image, this.gender, this.status);

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
