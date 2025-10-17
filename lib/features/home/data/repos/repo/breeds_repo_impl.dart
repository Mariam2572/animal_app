import 'package:animal_app/Core/Network%20copy/api_result.dart';
import 'package:animal_app/features/home/data/models/breeds.dart';
import 'package:animal_app/features/home/data/repos/data_source/breeds_remote_data_source.dart';
import 'package:animal_app/features/home/data/repos/repo/breeds_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BreedsRepoContract)
class BreedsRepoImpl implements BreedsRepoContract {
  final BreedsRemoteContract _remoteContract;
  BreedsRepoImpl(this._remoteContract);
  @override
  Future<ApiResult<List<Breeds>>> getBreeds({
    required int limit,
    required int page,
  }) async {

      return await _remoteContract.getBreeds(limit: limit, page: page);
  
  }
}