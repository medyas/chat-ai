import 'package:chat_ai/core/models/chat_messages.dart';
import 'package:equatable/equatable.dart';

class ChatThread extends Equatable {
  final Message chatAnswer;
  final String threadId;

  const ChatThread({
    required this.chatAnswer,
    required this.threadId,
  });

  factory ChatThread.fromJson(Map<String, dynamic> json) => ChatThread(
        chatAnswer: Message.fromJson(
          Map<String, dynamic>.from(
            json["chat_answer"] as Map,
          ),
        ),
        threadId: json["thread_id"],
      );

  Map<String, dynamic> toJson() => {
        "chat_answer": chatAnswer,
        "thread_id": threadId,
      };

  @override
  List<Object> get props => [chatAnswer, threadId];
}
