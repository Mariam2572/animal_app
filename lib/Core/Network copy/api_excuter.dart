// core/api_manager/api_executer.dart
import 'dart:developer';
import 'package:animal_app/Core/Error/error_handler.dart';
import 'package:animal_app/Core/Network%20copy/api_result.dart';
import 'package:dio/dio.dart';


Future<ApiResult<T>> apiExecuter<T>({
  required Future<T> Function() apiCall,
  String? endpoint,
}) async {
  try {
    log(' API Call: ${endpoint ?? 'Unknown endpoint'}');
    
    final result = await apiCall.call();
    
    log(' API Success: ${endpoint ?? 'Unknown endpoint'}');
    
    return ApiSuccess(data: result);
  } on DioException catch (e) {
    log(' DioException: ${e.message}');
    log(' Endpoint: ${endpoint ?? 'Unknown'}');
    
    return ApiError(
      failure: ServerFailure.fromDioException(e),
    );
  } catch (e, stackTrace) {
    log(' Unexpected Error: $e');
    log(' Endpoint: ${endpoint ?? 'Unknown'}');
    log('Stack Trace: $stackTrace');
    
    return ApiError(
      failure: ServerFailure(
        errorMessage: 'Unexpected error: ${e.toString()}',
        statusCode: 500,
      ),
    );
  }
}

// Helper for handling API results in UI
extension ApiResultExtension<T> on ApiResult<T> {
  void handle({
    required Function(T? data) onSuccess,
    required Function(String message) onError,
    Function()? onLoading,
  }) {
    when(
      success: (data) => onSuccess(data),
      error: (failure) => onError(failure.errorMessage),
    );
  }
}