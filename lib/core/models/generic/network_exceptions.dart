import 'dart:io';

import 'package:chat_ai/core/models/generic/error_model.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.responseError(ErrorModel error) =
      ResponseError;

  const factory NetworkExceptions.timeOut() = TimeOut;

  const factory NetworkExceptions.unauthorized() = Unauthorized;

  const factory NetworkExceptions.defaultError({
    String? errorCode,
    String? errorMessage,
  }) = DefaultError;

  factory NetworkExceptions.fromException(Object error) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case HttpStatus.badRequest:
                case HttpStatus.notFound:
                  if (error.response?.data != null) {
                    return NetworkExceptions.responseError(
                      ErrorModel.fromJson(
                        Map<String, dynamic>.from(
                          error.response!.data as Map<dynamic, dynamic>,
                        ),
                      ),
                    );
                  }
                  return const NetworkExceptions.defaultError();
                case HttpStatus.unauthorized:
                  return const NetworkExceptions.unauthorized();
                case HttpStatus.requestTimeout:
                  return const NetworkExceptions.timeOut();
                default:
                  return const NetworkExceptions.defaultError();
              }
            case DioExceptionType.receiveTimeout:
              return const NetworkExceptions.timeOut();
            case DioExceptionType.sendTimeout:
              return const NetworkExceptions.timeOut();
            case DioExceptionType.cancel:
              return const NetworkExceptions.defaultError();
            case DioExceptionType.connectionTimeout:
              return const NetworkExceptions.timeOut();
            case DioExceptionType.badCertificate:
            case DioExceptionType.connectionError:
            case DioExceptionType.unknown:
              return const NetworkExceptions.defaultError();
          }
        } else if (error is SocketException) {
          return const NetworkExceptions.timeOut();
        }
      } catch (_) {
        return const NetworkExceptions.defaultError();
      }
    }
    return const NetworkExceptions.defaultError();
  }
}
