import 'package:chat_ai/core/domain/network/api_client.dart';
import 'package:chat_ai/core/models/chat_messages.dart';
import 'package:chat_ai/core/models/chat_thread.dart';
import 'package:chat_ai/core/models/chats.dart';
import 'package:chat_ai/core/models/generic/result.dart';

class ChatRepository {
  final ApiClient client;

  ChatRepository(this.client);

  Future<Result<Chats>> getUserChats() => ApiClient.validateResponses(
        callback: client.getUserChats,
      );

  Future<Result<ChatMessages>> getUserChatHistory({
    required String threadId,
  }) =>
      ApiClient.validateResponses(
        callback: () => client.getUserChatHistory(
          {
            "thread_id": threadId,
          },
        ),
      );

  Future<Result<ChatThread>> sendNewChatMessage({
    // required String assistantId,
    required String message,
    String? threadId,
  }) =>
      ApiClient.validateResponses(
        callback: () => client.sendNewChatMessage(
          {
            "assistant_id": "asst_WRLtAz4n7ZMfbGMw3R1YKXcT",
            "message": message,
            if (threadId != null) "thread_id": threadId,
          },
        ),
      );
}
