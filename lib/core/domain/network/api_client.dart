import 'package:chat_ai/core/models/chat_messages.dart';
import 'package:chat_ai/core/models/chat_thread.dart';
import 'package:chat_ai/core/models/chats.dart';
import 'package:chat_ai/core/models/generic/network_exceptions.dart';
import 'package:chat_ai/core/models/generic/result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

typedef ApiResponse<T> = Future<T> Function();

@RestApi()
abstract class ApiClient {
  factory ApiClient(
    Dio dio, {
    String? baseUrl,
  }) = _ApiClient;

  static final baseUrl = "https://9e3d-196-203-12-144.ngrok-free.app/api/v1";
  
  @GET("/thread_list")
  Future<Chats> getUserChats();

  @POST("/message_list")
  Future<ChatMessages> getUserChatHistory(@Body() Map<String, dynamic> data);

  @POST("/chat")
  Future<ChatThread> sendNewChatMessage(@Body() Map<String, dynamic> data);


  ///
  /// Validate Retrofit response
  ///
  static Future<Result<T>> validateResponses<T>({
    required ApiResponse<T> callback,
  }) async {
    try {
      final result = await callback();
      return Result(result);
    } catch (e, stacktrace) {
      debugPrint("===============> Error: $e");
      debugPrint("$stacktrace");

      return Result.error(
        error: NetworkExceptions.fromException(e),
      );
    }
  }
}
