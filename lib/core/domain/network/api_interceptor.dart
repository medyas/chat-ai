import 'dart:async';

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor();

  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll(
      {
        "API_KEY": "76ac5474-0416-e1b2-37e3-188a2cdfd651",
        "ngrok-skip-browser-warning": "69420",
      },
    );

    return handler.next(options);
  }
}
