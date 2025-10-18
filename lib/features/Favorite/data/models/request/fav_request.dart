
import 'package:json_annotation/json_annotation.dart';
part 'fav_request.g.dart';

@JsonSerializable()
class FavRequest {
  @JsonKey(name: 'image_id')
  String? imageId;
  @JsonKey(name: 'sub_id')
  String? subId;

  FavRequest({this.imageId, this.subId});

  factory FavRequest.fromJson(Map<String, dynamic> json) => _$FavRequestFromJson(json);

  static List<FavRequest> fromList(List<Map<String, dynamic>> list) {
    return list.map(FavRequest.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$FavRequestToJson(this);
}