import 'package:animal_app/Core/Network%20copy/api_result.dart';
import 'package:animal_app/features/Favorite/data/models/request/fav_request.dart';
import 'package:animal_app/features/Favorite/data/models/response/favorite_model.dart';
import 'package:animal_app/features/Favorite/data/models/response/get_favorite_model.dart';
import 'package:animal_app/features/Favorite/data/repos/data_source/fav_remote_contract.dart';
import 'package:animal_app/features/Favorite/data/repos/repo/fav_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: FavRepo)
class FavRepoImpl implements FavRepo {
final  FavRemoteContract _favRemoteContract;
  FavRepoImpl(this._favRemoteContract);
  @override
  Future<ApiResult<FavoriteModel>> addToFavorite(String apiKey, FavRequest favRequest) async {
    return await _favRemoteContract.addToFavorite(apiKey, favRequest);
  }

  @override
  Future<ApiResult<List<GetFavoriteModel>>> getFavorites(String apiKey) async {
    return await  _favRemoteContract.getFavorites(apiKey);
  }
}