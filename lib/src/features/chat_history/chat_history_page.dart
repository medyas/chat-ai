import 'package:auto_route/auto_route.dart';
import 'package:chat_ai/src/features/chat_history/bloc/chat_history_cubit.dart';
import 'package:chat_ai/src/features/chat_messages/chat_messages_page.dart';
import 'package:chat_ai/src/navigation/app_router.gr.dart';
import 'package:chat_ai/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.menuColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          children: [
            Container(
              height: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.textShadowColor,
              ),
              child: const Text(
                "MA",
                style: TextStyle(
                  color: AppColors.surfaceBackgroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(4),
            const Text(
              "Mohamed Amine",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textShadowColor,
              ),
            ),
            const Gap(8),
            const Divider(
              height: 1,
            ),
            const Gap(24),
            TextButton(
              onPressed: () => context.router.replace(
                ChatMessagesRoute(
                  threadId: ChatMessagesPage.defaultId,
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: AppColors.inputBackgroundColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_comment_outlined,
                    color: AppColors.textSecondaryColor,
                  ),
                  Gap(4),
                  Text(
                    "New Chat",
                    style: TextStyle(color: AppColors.textSecondaryColor),
                  ),
                ],
              ),
            ),
            const Gap(24),
            Expanded(
              child: BlocBuilder<ChatHistoryCubit, ChatHistoryState>(
                builder: (context, state) => switch (state) {
                  ChatHistoryInitial() || ChatHistoryLoading() => Center(
                      child: CircularProgressIndicator(),
                    ),
                  ChatHistorySuccess(:final chats) => RawScrollbar(
                      thickness: 8,
                      radius: Radius.circular(8),
                      thumbColor: const Color(0xff424242),
                      padding: EdgeInsets.all(2),
                      child: ListView.builder(
                        itemCount: chats.threadList.length,
                        shrinkWrap: true,
                        itemBuilder: (_, index) => ListTile(
                          onTap: () => context.replaceRoute(
                            ChatMessagesRoute(
                              threadId: chats.threadList[index].id,
                            ),
                          ),
                          hoverColor: AppColors.inputBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                          ),
                          titleTextStyle: TextStyle(
                            color: AppColors.textPrimaryColor,
                            fontSize: 16,
                          ),
                          title: Text(
                            chats.threadList[index].name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            style: IconButton.styleFrom(
                              hoverColor: AppColors.textPrimaryColor,
                            ),
                            icon: Icon(
                              Icons.delete_outline,
                              color: Color(0xfff93a37),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ChatHistoryFailed() => const SizedBox(),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
