// core/utils/error/failure.dart
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;
  final int? statusCode;
  final dynamic data;

  const Failure({
    required this.errorMessage,
    this.statusCode,
    this.data,
  });

  @override
  List<Object?> get props => [errorMessage, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.errorMessage,
    super.statusCode,
    super.data,
  });

  factory ServerFailure.fromDioException(DioException dioExcep) {
    switch (dioExcep.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(
          errorMessage: 'Connection timeout with server',
          statusCode: 408,
        );

      case DioExceptionType.sendTimeout:
        return const ServerFailure(
          errorMessage: 'Send timeout with server',
          statusCode: 408,
        );

      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
          errorMessage: 'Receive timeout with server',
          statusCode: 408,
        );

      case DioExceptionType.badCertificate:
        return const ServerFailure(
          errorMessage: 'Bad SSL certificate error',
          statusCode: 495,
        );

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioExcep.response?.statusCode ?? 500,
          dioExcep.response?.data,
        );

      case DioExceptionType.cancel:
        return const ServerFailure(
          errorMessage: 'Request cancelled',
          statusCode: 499,
        );

      case DioExceptionType.connectionError:
        return const ServerFailure(
          errorMessage: 'No internet connection',
          statusCode: 503,
        );

      case DioExceptionType.unknown:
        if (dioExcep.error.toString().contains('SocketException')) {
          return const ServerFailure(
            errorMessage: 'No internet connection',
            statusCode: 503,
          );
        }
        return ServerFailure(
          errorMessage: dioExcep.message ?? 'Unexpected error occurred',
          statusCode: 500,
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    // Extract error message from different response formats
    String extractErrorMessage() {
      if (response == null) return 'Unknown error occurred';

      // Try different error message formats
      if (response is Map) {
        // Try: message, error, errors, data.message, etc.
        final possibleKeys = ['message', 'error', 'errors', 'msg', 'detail'];
        for (final key in possibleKeys) {
          if (response[key] != null) {
            if (response[key] is List) {
              return (response[key] as List).join(', ');
            }
            return response[key].toString();
          }
        }

        // Try nested data
        if (response['data'] is Map && response['data']['message'] != null) {
          return response['data']['message'].toString();
        }
      }

      return response.toString();
    }

    final errorMessage = extractErrorMessage();

    // Custom error handling based on status code
    switch (statusCode) {
      case 400:
        return ServerFailure(
          errorMessage: errorMessage,
          statusCode: statusCode,
          data: response,
        );

      case 401:
        return ServerFailure(
          errorMessage: errorMessage.isEmpty ? 'Unauthorized access' : errorMessage,
          statusCode: statusCode,
          data: response,
        );

      case 403:
        return ServerFailure(
          errorMessage: errorMessage.isEmpty ? 'Access forbidden' : errorMessage,
          statusCode: statusCode,
          data: response,
        );

      case 404:
        return ServerFailure(
          errorMessage: errorMessage.isEmpty ? 'Resource not found' : errorMessage,
          statusCode: statusCode,
          data: response,
        );

      case 409:
        return ServerFailure(
          errorMessage: errorMessage.isEmpty ? 'Conflict error' : errorMessage,
          statusCode: statusCode,
          data: response,
        );

      case 422:
        return ServerFailure(
          errorMessage: errorMessage.isEmpty ? 'Validation error' : errorMessage,
          statusCode: statusCode,
          data: response,
        );

      case 429:
        return const ServerFailure(
          errorMessage: 'Too many requests. Please try again later',
          statusCode: 429,
        );

      case 500:
        return const ServerFailure(
          errorMessage: 'Internal server error. Please try again later',
          statusCode: 500,
        );

      case 502:
        return const ServerFailure(
          errorMessage: 'Bad gateway. Please try again later',
          statusCode: 502,
        );

      case 503:
        return const ServerFailure(
          errorMessage: 'Service unavailable. Please try again later',
          statusCode: 503,
        );

      default:
        return ServerFailure(
          errorMessage: errorMessage.isEmpty
              ? 'Unexpected error. Status Code: $statusCode'
              : errorMessage,
          statusCode: statusCode,
          data: response,
        );
    }
  }
}

class CacheFailure extends Failure {
  const CacheFailure({required super.errorMessage});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.errorMessage});
}