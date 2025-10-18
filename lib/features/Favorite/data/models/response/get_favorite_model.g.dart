// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavoriteModel _$GetFavoriteModelFromJson(Map<String, dynamic> json) =>
    GetFavoriteModel(
      id: (json['id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      imageId: json['image_id'] as String?,
      subId: json['sub_id'] as String?,
      createdAt: json['created_at'] as String?,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetFavoriteModelToJson(GetFavoriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'image_id': instance.imageId,
      'sub_id': instance.subId,
      'created_at': instance.createdAt,
      'image': instance.image,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image();

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{};
