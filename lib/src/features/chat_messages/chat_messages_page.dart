import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_ai/core/models/chat_messages.dart';
import 'package:chat_ai/src/features/chat_history/bloc/chat_history_cubit.dart';
import 'package:chat_ai/src/features/chat_messages/bloc/chat_messages_cubit.dart';
import 'package:chat_ai/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:gap/gap.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class ChatMessagesPage extends StatelessWidget implements AutoRouteWrapper {
  const ChatMessagesPage({
    super.key,
    @PathParam("thread_id") this.threadId,
  });

  final String? threadId;

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        key: ValueKey(threadId ?? defaultId),
        create: (_) => ChatMessagesCubit()
          ..getChatThreadHistory(
            threadId: threadId,
          ),
        child: this,
      );

  static const defaultId = "new";

  FormGroup get _form => FormGroup(
        {
          "message": FormControl<String>(),
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBackgroundColor,
      appBar: AppBar(
        title: const Text("Chat AI Demo"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: const TextStyle(
          color: AppColors.textPrimaryColor,
        ),
        leading: ResponsiveBuilder(
          builder: (_, sizingInformation) {
            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
              return IconButton(
                onPressed: ZoomDrawer.of(context)?.toggle,
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.textPrimaryColor,
                ),
              );
            }
            return const SizedBox();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_outlined,
              color: AppColors.textPrimaryColor,
            ),
          )
        ],
      ),
      body: BlocListener<ChatMessagesCubit, ChatMessagesState>(
        listener: (context, state) {
          switch (state) {
            case ChatMessagesSuccess(:final refreshThreads) when refreshThreads:
              context.read<ChatHistoryCubit>().getUserChats();
            case _:
              break;
          }
        },
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatMessagesCubit, ChatMessagesState>(
                builder: (context, state) => switch (state) {
                  ChatMessagesInitial() || ChatMessagesFailed() => Center(
                      child: Icon(
                        Icons.assistant_outlined,
                        size: 64,
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                  ChatMessagesLoading() => Center(
                      child: CircularProgressIndicator(),
                    ),
                  ChatMessagesSuccess(:final chatMessages) => RawScrollbar(
                      thickness: 8,
                      radius: Radius.circular(8),
                      thumbColor: const Color(0xff424242),
                      padding: EdgeInsets.all(2),
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                        itemCount: chatMessages.messages.length,
                        itemBuilder: (_, index) =>
                            chatMessages.messages[index].isUser
                                ? _UserChatMessageItem(
                                    message: chatMessages.messages[index],
                                    onRetry: () => context
                                        .read<ChatMessagesCubit>()
                                        .submitNewMessage(
                                          message: chatMessages.messages[index],
                                          threadId: threadId,
                                        ),
                                  )
                                : _AssistantChatMessageItem(
                                    message: chatMessages.messages[index],
                                    onImagePressed: (index) =>
                                        _showMessageImagesGallery(
                                      context,
                                      imageUrls: chatMessages
                                          .messages[index].imageUrls,
                                      initialIndex: index,
                                    ),
                                  ),
                        separatorBuilder: (_, __) => SizedBox(
                          height: 20,
                        ),
                      ),
                    ),
                },
              ),
            ),
            ReactiveFormBuilder(
              form: () => _form,
              builder: (context, form, _) => Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 24,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 12,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.inputBackgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(56),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: const Icon(
                        Icons.attach_file,
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                    Expanded(
                      child: ReactiveTextField<String>(
                        formControlName: "message",
                        onTapOutside: (_) => form.unfocus(),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          hintText: "Message Chat AI",
                          hintStyle: TextStyle(
                            color: AppColors.textShadowColor,
                          ),
                        ),
                        style: TextStyle(
                          color: AppColors.textPrimaryColor,
                        ),
                        cursorColor: AppColors.textPrimaryColor,
                        onSubmitted: (control) {
                          if (control.value != null) {
                            context.read<ChatMessagesCubit>().submitNewMessage(
                                  messageContent: control.value!,
                                  threadId: threadId,
                                );
                            control.reset();
                          }
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<ChatMessagesCubit>().submitNewMessage(
                              messageContent:
                                  form.control("message").value as String,
                              threadId: threadId,
                            );
                        form.control("message").reset();
                      },
                      icon: const Icon(
                        Icons.send_outlined,
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              "Chat AI app for demo only",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textShadowColor,
              ),
            ),
            const Gap(2),
          ],
        ),
      ),
    );
  }

  void _showMessageImagesGallery(
    BuildContext context, {
    required List<String> imageUrls,
    int initialIndex = 0,
  }) =>
      showDialog(
        context: context,
        barrierColor: Color(0x38000000),
        builder: (_) => PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          itemCount: imageUrls.length,
          pageController: PageController(initialPage: initialIndex),
          builder: (BuildContext context, int index) =>
              PhotoViewGalleryPageOptions(
            imageProvider: CachedNetworkImageProvider(
              imageUrls[index],
            ),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            heroAttributes: PhotoViewHeroAttributes(
              tag: imageUrls[index],
            ),
          ),
          loadingBuilder: (context, event) => Center(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded /
                        (event.expectedTotalBytes ?? 0),
              ),
            ),
          ),
        ),
      );
}

class _UserChatMessageItem extends StatelessWidget {
  const _UserChatMessageItem({
    required this.message,
    required this.onRetry,
  });

  final Message message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.inputBackgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.messageContent,
              style: TextStyle(
                color: AppColors.textPrimaryColor,
              ),
            ),
            if (message.status != MessageStatus.sent) ...[
              Gap(4),
              if (message.status == MessageStatus.sending)
                SizedBox(
                  width: 10,
                  height: 10,
                  child: CircularProgressIndicator(
                    color: AppColors.textPrimaryColor,
                    strokeWidth: 1,
                  ),
                )
              else if (message.status == MessageStatus.error)
                InkWell(
                  onTap: onRetry,
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Color(0xfff93a37),
                        size: 10,
                      ),
                      Gap(4),
                      Text(
                        "Retry",
                        style: TextStyle(
                          color: Color(0xfff93a37),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
            ]
          ],
        ),
      ),
    );
  }
}

class _AssistantChatMessageItem extends StatelessWidget {
  const _AssistantChatMessageItem({
    required this.message,
    required this.onImagePressed,
  });

  final Message message;
  final void Function(int index) onImagePressed;

  @override
  Widget build(BuildContext context) {
    final images = message.imageUrls;
    final subImages = images.sublist(0, min(images.length, 3));
    final child = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.fromBorderSide(
              BorderSide(
                color: AppColors.textPrimaryColor,
                width: 1,
              ),
            ),
          ),
          padding: EdgeInsets.all(6),
          alignment: Alignment.center,
          child: Icon(
            Icons.assistant_outlined,
            size: 18,
            color: AppColors.textPrimaryColor,
          ),
        ),
        Gap(12),
        Flexible(
          child: Text(
            message.messageContent,
            style: TextStyle(
              color: AppColors.textPrimaryColor,
            ),
          ),
        ),
      ],
    );
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        child: images.isEmpty
            ? child
            : Column(
                children: [
                  child,
                  Gap(16),
                  SizedBox.square(
                    dimension: 128,
                    child: Wrap(
                      children: [
                        for (final imageUrl in subImages)
                          _ImageItemPreview(
                            imageUrl: imageUrl,
                            onImagePressed: () => _onImagePressed(imageUrl),
                          ),
                        if (images.length > subImages.length)
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              _ImageItemPreview(
                                imageUrl: images[subImages.length],
                                onImagePressed: () =>
                                    _onImagePressed(images[subImages.length]),
                              ),
                              if (images.length > 4)
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: Color(0x50000000),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        border: Border.fromBorderSide(
                                          BorderSide(
                                            color: Color(0x4DFFFFFF),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "+${images.length - 4}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: AppColors.textPrimaryColor,
                                          letterSpacing: -0.08,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }

  void _onImagePressed(String imageUrl) => onImagePressed(
        imageUrl.indexOf(imageUrl),
      );
}

class _ImageItemPreview extends StatelessWidget {
  const _ImageItemPreview({
    required this.imageUrl,
    required this.onImagePressed,
  });

  final String imageUrl;
  final VoidCallback onImagePressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onImagePressed,
      child: Hero(
        tag: imageUrl,
        child: Container(
          constraints: BoxConstraints.tight(
            Size.square(
              61,
            ),
          ),
          decoration: BoxDecoration(
            color: AppColors.textShadowColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            border: const Border.fromBorderSide(
              BorderSide(
                color: Color(0x4DFFFFFF),
                width: 1,
              ),
            ),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
