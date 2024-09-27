part of 'chat_history_cubit.dart';

sealed class ChatHistoryState extends Equatable {
  const ChatHistoryState();

  @override
  List<Object> get props => [];
}

final class ChatHistoryInitial extends ChatHistoryState {}

final class ChatHistoryLoading extends ChatHistoryState {}

final class ChatHistorySuccess extends ChatHistoryState {
  final Chats chats;

  const ChatHistorySuccess({required this.chats});

  @override
  List<Object> get props => [chats];
}

final class ChatHistoryFailed extends ChatHistoryState {}
