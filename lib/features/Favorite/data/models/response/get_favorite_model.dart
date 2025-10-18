
import 'package:json_annotation/json_annotation.dart';
part 'get_favorite_model.g.dart';

@JsonSerializable()
class GetFavoriteModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'image_id')
  String? imageId;
  @JsonKey(name: 'sub_id')
  String? subId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'image')
  Image? image;

  GetFavoriteModel({this.id, this.userId, this.imageId, this.subId, this.createdAt, this.image});

  factory GetFavoriteModel.fromJson(Map<String, dynamic> json) => _$GetFavoriteModelFromJson(json);

  static List<GetFavoriteModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetFavoriteModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$GetFavoriteModelToJson(this);
}

@JsonSerializable()
class Image {
  Image();

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  static List<Image> fromList(List<Map<String, dynamic>> list) {
    return list.map(Image.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}