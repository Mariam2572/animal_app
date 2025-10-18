import 'package:animal_app/Core/Network%20copy/api_result.dart';
import 'package:animal_app/features/Favorite/data/models/request/fav_request.dart';
import 'package:animal_app/features/Favorite/data/models/response/favorite_model.dart';
import 'package:animal_app/features/Favorite/data/models/response/get_favorite_model.dart';

abstract interface class FavRemoteContract {
  Future<ApiResult<FavoriteModel>> addToFavorite(String apiKey, FavRequest favRequest);
  Future<ApiResult<List<GetFavoriteModel>>> getFavorites(String apiKey);
}