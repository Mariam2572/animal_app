// core/api_manager/dio_module.dart
import 'package:animal_app/Core/Network%20copy/api_services.dart';
import 'package:animal_app/Core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @lazySingleton
  PrettyDioLogger providePrettyLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );
  }

  @Singleton()
  Dio provideDio(
    PrettyDioLogger prettyLogger,
  ) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        baseUrl: Constants.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          // 'Accept': 'application/json',
        },
      ),
    );
dio.options.headers['Accept'] = 'application/json';
    // Auth Interceptor
    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) async {
    //          final token = await readSecureData(Constants.userToken);
    //     if (token != null) {
    //       options.headers['Authorization'] = 'Bearer $token';
    //     }
    //     return handler.next(options);
    //   },
  // ));
      
    

    // Pretty Logger (only in debug mode)
    if (Constants.isDebugMode) {
      dio.interceptors.add(prettyLogger);
    }

    return dio;
  }

  @Singleton()
  ApiService provideApiService(Dio dio) {
    return ApiService(dio);
  }
}