
import 'package:json_annotation/json_annotation.dart';
part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'id')
  int? id;

  FavoriteModel({this.message, this.id});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => _$FavoriteModelFromJson(json);

  static List<FavoriteModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(FavoriteModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);
}