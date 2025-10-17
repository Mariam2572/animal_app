import 'package:animal_app/Core/constants/constants.dart';
import 'package:animal_app/features/home/data/models/breeds.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  @GET(Constants.breedsEndpoint)
  Future<List<Breeds>> getBreeds(
    {
  @Query('limit') required int limit,
  @Query('page') required int page,
}
  );
}
