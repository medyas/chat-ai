import 'package:chat_ai/core/domain/repository/chat_repository.dart';
import 'package:chat_ai/core/models/chat_messages.dart';
import 'package:chat_ai/src/features/chat_messages/chat_messages_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/v4.dart';

part 'chat_messages_state.dart';

class ChatMessagesCubit extends Cubit<ChatMessagesState> {
  ChatMessagesCubit() : super(ChatMessagesInitial());

  Future<void> getChatThreadHistory({
    String? threadId,
  }) async {
    if (threadId != null && threadId != ChatMessagesPage.defaultId) {
      emit(ChatMessagesLoading());

      final result = await _repo.getUserChatHistory(threadId: threadId);

      result.when(
        (chatMessages) => emit(
          ChatMessagesSuccess(chatMessages: chatMessages),
        ),
        error: (_) => emit(
          ChatMessagesFailed(),
        ),
      );
    }
  }

  Future<void> submitNewMessage({
    Message? message,
    String? messageContent,
    String? threadId,
  }) async {
    if ((messageContent?.isNotEmpty ?? false) || message != null) {
      final messageId = message?.messageId ?? UuidV4().generate();

      final newMessage = message?.copyWith(
            status: MessageStatus.sending,
          ) ??
          Message.newMessage(messageContent!, messageId);

      emit(
        ChatMessagesSuccess(
          chatMessages: ChatMessages(
            messages: [
              ...(state is ChatMessagesSuccess
                  ? ((state as ChatMessagesSuccess).chatMessages.messages
                    ..removeWhere((message) => message.messageId == messageId))
                  : []),
              newMessage,
            ],
          ),
        ),
      );

      final result = await _repo.sendNewChatMessage(
        message: newMessage.messageContent,
        threadId: _threadId ?? ((threadId != null && threadId != ChatMessagesPage.defaultId)
            ? threadId
            : ""),
      );

      result.when(
        (thread) {
          _threadId = thread.threadId;
          final messages =
              [...(state as ChatMessagesSuccess).chatMessages.messages]
                  .map(
                    (message) => message.messageId == messageId
                        ? message.copyWith(
                            status: MessageStatus.sent,
                          )
                        : message,
                  )
                  .toList();
          emit(
            ChatMessagesSuccess(
              chatMessages: ChatMessages(
                messages: [
                  ...messages,
                  thread.chatAnswer,
                ],
              ),
              refreshThreads: threadId == null,
            ),
          );
        },
        error: (_) {
          final messages =
              [...(state as ChatMessagesSuccess).chatMessages.messages]
                  .map(
                    (message) => message.messageId == messageId
                        ? message.copyWith(
                            status: MessageStatus.error,
                          )
                        : message,
                  )
                  .toList();
          emit(
            ChatMessagesSuccess(
              chatMessages: ChatMessages(
                messages: messages,
              ),
            ),
          );
        },
      );
    }
  }

  final _repo = GetIt.I<ChatRepository>();
  String? _threadId;
}
