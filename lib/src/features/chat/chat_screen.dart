import 'package:auto_route/auto_route.dart';
import 'package:chat_ai/src/features/chat_history/bloc/chat_history_cubit.dart';
import 'package:chat_ai/src/features/chat_history/chat_history_page.dart';
import 'package:chat_ai/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class ChatScreen extends StatefulWidget implements AutoRouteWrapper {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => ChatHistoryCubit()..getUserChats(),
        child: this,
      );
}

class _ChatScreenState extends State<ChatScreen> {
  final _routerKey = GlobalKey<AutoRouterState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          final menuScreenWidth =
              (MediaQuery.sizeOf(context).width * .7).roundToDouble();
          return ZoomDrawer(
            menuScreen: ChatHistoryPage(),
            menuBackgroundColor: AppColors.menuColor,
            menuScreenWidth: menuScreenWidth,
            moveMenuScreen: false,
            mainScreen: AutoRouter(
              key: _routerKey,
            ),
            borderRadius: 0.0,
            showShadow: false,
            angle: 0.0,
            mainScreenScale: 0,
            shrinkMainScreen: false,
            mainScreenAbsorbPointer: false,
            drawerShadowsBackgroundColor: Colors.transparent,
            slideWidth: menuScreenWidth,
          );
        }

        return Row(
          children: [
            Flexible(
              flex: 3,
              child: ChatHistoryPage(),
            ),
            Flexible(
              flex: 7,
              child: AutoRouter(
                key: _routerKey,
              ),
            ),
          ],
        );
      },
    );
  }
}
