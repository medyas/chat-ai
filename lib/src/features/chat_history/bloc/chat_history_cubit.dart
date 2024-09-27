import 'package:chat_ai/core/domain/repository/chat_repository.dart';
import 'package:chat_ai/core/models/chats.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'chat_history_state.dart';

class ChatHistoryCubit extends Cubit<ChatHistoryState> {
  ChatHistoryCubit() : super(ChatHistoryInitial());

  Future<void> getUserChats() async {
    emit(ChatHistoryLoading());

    final result = await _repo.getUserChats();

    result.when(
      (chats) => emit(
        ChatHistorySuccess(chats: chats),
      ),
      error: (_) => emit(
        ChatHistoryFailed(),
      ),
    );
  }

  final _repo = GetIt.I<ChatRepository>();
}
