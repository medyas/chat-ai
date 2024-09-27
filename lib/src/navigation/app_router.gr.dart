// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:chat_ai/src/features/chat/chat_screen.dart' as _i2;
import 'package:chat_ai/src/features/chat_messages/chat_messages_page.dart'
    as _i1;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.ChatMessagesPage]
class ChatMessagesRoute extends _i3.PageRouteInfo<ChatMessagesRouteArgs> {
  ChatMessagesRoute({
    _i4.Key? key,
    String? threadId,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ChatMessagesRoute.name,
          args: ChatMessagesRouteArgs(
            key: key,
            threadId: threadId,
          ),
          rawPathParams: {'thread_id': threadId},
          initialChildren: children,
        );

  static const String name = 'ChatMessagesRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ChatMessagesRouteArgs>(
          orElse: () => ChatMessagesRouteArgs(
              threadId: pathParams.optString('thread_id')));
      return _i3.WrappedRoute(
          child: _i1.ChatMessagesPage(
        key: args.key,
        threadId: args.threadId,
      ));
    },
  );
}

class ChatMessagesRouteArgs {
  const ChatMessagesRouteArgs({
    this.key,
    this.threadId,
  });

  final _i4.Key? key;

  final String? threadId;

  @override
  String toString() {
    return 'ChatMessagesRouteArgs{key: $key, threadId: $threadId}';
  }
}

/// generated route for
/// [_i2.ChatScreen]
class ChatRoute extends _i3.PageRouteInfo<void> {
  const ChatRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i3.WrappedRoute(child: const _i2.ChatScreen());
    },
  );
}
