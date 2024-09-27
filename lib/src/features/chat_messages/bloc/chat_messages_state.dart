part of 'chat_messages_cubit.dart';

sealed class ChatMessagesState extends Equatable {
  const ChatMessagesState();

  @override
  List<Object?> get props => [];
}

final class ChatMessagesInitial extends ChatMessagesState {}

final class ChatMessagesLoading extends ChatMessagesState {}

final class ChatMessagesSuccess extends ChatMessagesState {
  final ChatMessages chatMessages;
  final bool refreshThreads;

  const ChatMessagesSuccess({
    required this.chatMessages,
    this.refreshThreads = false,
  });

  @override
  List<Object?> get props => [
        chatMessages,
        refreshThreads,
      ];

  ChatMessagesSuccess copyWith({
    ChatMessages? chatMessages,
  }) =>
      ChatMessagesSuccess(
        chatMessages: chatMessages ?? this.chatMessages,
      );
}

final class ChatMessagesFailed extends ChatMessagesState {}
