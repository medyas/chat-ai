import 'package:auto_route/auto_route.dart';
import 'package:chat_ai/src/navigation/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: ChatRoute.page,
          children: [
            RedirectRoute(path: "", redirectTo: "new"),
            AutoRoute(
              path: "new",
              initial: true,
              page: ChatMessagesRoute.page,
            ),
            AutoRoute(
              path: ":thread_id",
              page: ChatMessagesRoute.page,
            ),
          ],
        ),
      ];
}
