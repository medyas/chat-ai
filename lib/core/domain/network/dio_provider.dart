import 'dart:developer';

import 'package:chat_ai/core/domain/network/api_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioProvider {
  static Dio instance() => Dio(
        BaseOptions(
          connectTimeout: const Duration(minutes: 2),
          receiveTimeout: const Duration(minutes: 2),
          contentType: Headers.jsonContentType,
        ),
      )..interceptors.addAll(
          [
            ApiInterceptor(),
            if (!kReleaseMode)
              LogInterceptor(
                requestBody: true,
                responseBody: true,
                logPrint: (obj) => log("$obj", name: "Dio"),
              ),
          ],
        );
}
