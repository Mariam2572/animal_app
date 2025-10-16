// core/api_manager/api_result.dart

import 'package:animal_app/Core/Error/error_handler.dart';

sealed class ApiResult<T> {
  const ApiResult();

  // Helper methods
  bool get isSuccess => this is ApiSuccess<T>;
  bool get isError => this is ApiError<T>;

  T? get data => switch (this) {
    ApiSuccess(data: final d) => d,
    _ => null,
  };

  String? get errorMessage => switch (this) {
    ApiError(failure: final f) => f?.errorMessage,
    _ => null,
  };

  // When method for pattern matching
  R when<R>({
    required R Function(T? data) success,
    required R Function(Failure failure) error,
  }) {
    return switch (this) {
      ApiSuccess(data: final d) => success(d),
      ApiError(failure: final f) => error(f ?? const ServerFailure(errorMessage: 'Unknown error')),
    };
  }

  // Map method
  ApiResult<R> map<R>(R Function(T data) transform) {
    return switch (this) {
      ApiSuccess(data: final d) => ApiSuccess(data: d != null ? transform(d) : null),
      ApiError(failure: final f, message: final m) => ApiError(failure: f, message: m),
    };
  }
}

class ApiSuccess<T> extends ApiResult<T> {
  final T? data;
  const ApiSuccess({this.data});
}

class ApiError<T> extends ApiResult<T> {
  final String? message;
  final Failure? failure;
  const ApiError({this.message, this.failure});
}