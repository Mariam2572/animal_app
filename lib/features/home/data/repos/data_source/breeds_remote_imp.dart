import 'package:animal_app/Core/Network%20copy/api_excuter.dart';
import 'package:animal_app/Core/Network%20copy/api_result.dart';
import 'package:animal_app/Core/Network%20copy/api_services.dart';
import 'package:animal_app/features/home/data/models/breeds.dart';
import 'package:animal_app/features/home/data/repos/data_source/breeds_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BreedsRemoteContract)
class BreedsRemoteImp implements BreedsRemoteContract {
  final ApiService _apiService;
  BreedsRemoteImp(this._apiService);
  @override
  Future<ApiResult<List<Breeds>>> getBreeds({
    required int limit,
    required int page,
  }) {
    return apiExecuter(
      endpoint: 'Get breeds call',
      apiCall: () {
        return _apiService.getBreeds(limit: limit, page: page);
      },
    );
  }

  @override
  Future<ApiResult<List<Breeds>>> searchBreeds({required String query}) {
  return apiExecuter(
    endpoint: 'Search breeds call',
    apiCall: () async {
      return await _apiService.searchBreeds(q: query);
    },
  );
  }
}
