import 'package:animal_app/Core/Network%20copy/api_excuter.dart';
import 'package:animal_app/Core/Network%20copy/api_result.dart';
import 'package:animal_app/Core/Network%20copy/api_services.dart';
import 'package:animal_app/features/Favorite/data/models/request/fav_request.dart';
import 'package:animal_app/features/Favorite/data/models/response/favorite_model.dart';
import 'package:animal_app/features/Favorite/data/models/response/get_favorite_model.dart';
import 'package:animal_app/features/Favorite/data/repos/data_source/fav_remote_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavRemoteContract)
class FavRemoteImpl implements FavRemoteContract {
  final ApiService _apiService;
  FavRemoteImpl(this._apiService);
  @override
  Future<ApiResult<FavoriteModel>> addToFavorite(
    String apiKey,
    FavRequest favRequest,
  ) {
    return apiExecuter(
      endpoint: 'Add to favorite call',
      apiCall: () async {
        return await _apiService.addToFavorite(apiKey, favRequest);
      },
    );
  }

  @override
  Future<ApiResult<List<GetFavoriteModel>>> getFavorites(String apiKey) {
    return apiExecuter(
      endpoint: 'Get favorites call',
      apiCall: () async {
        return await _apiService.getFavorites(apiKey);
      },
    );
  }
}
