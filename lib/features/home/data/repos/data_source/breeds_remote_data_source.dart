import 'package:animal_app/Core/Network%20copy/api_result.dart';
import 'package:animal_app/features/home/data/models/breeds.dart';

abstract interface class BreedsRemoteContract {
  Future<ApiResult<List<Breeds>>> getBreeds({
    required int limit,
    required int page,
  });
    Future<ApiResult<List<Breeds>>> searchBreeds({
    required String query,
  });
}