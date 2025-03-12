import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/data/models/character_model.dart';
import 'info_model.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel{
  final Info info;
  final List<Character> results;

  ResponseModel(this.info, this.results);

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}