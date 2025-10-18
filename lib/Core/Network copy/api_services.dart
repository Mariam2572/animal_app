import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'package:animal_app/Core/constants/constants.dart';
import 'package:animal_app/features/Favorite/data/models/request/fav_request.dart';
import 'package:animal_app/features/Favorite/data/models/response/favorite_model.dart';
import 'package:animal_app/features/Favorite/data/models/response/get_favorite_model.dart';
import 'package:animal_app/features/home/data/models/breeds.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio , {String baseUrl}) = _ApiService;
  @GET(Constants.breedsEndpoint)
  Future<List<Breeds>> getBreeds({
  @Query('limit') required int limit,
  @Query('page') required int page,
});
  @POST(Constants.favoritesEndpoint)
  Future<FavoriteModel> addToFavorite(
   @Header('x-api-key') String apiKey,
   @Body() FavRequest favRequest
  );
  @GET(Constants.favoritesEndpoint)
  Future<List<GetFavoriteModel>> getFavorites(
   @Header('x-api-key') String apiKey,
  );
  @GET(Constants.searchEndpoint)
  Future<List<Breeds>> searchBreeds({
   @Query('q') required String q,
    @Query('attach_image') int attachImage = 1,
  });
}
