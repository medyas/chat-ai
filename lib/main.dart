import 'package:chat_ai/core/domain/network/api_client.dart';
import 'package:chat_ai/core/domain/network/dio_provider.dart';
import 'package:chat_ai/core/domain/repository/chat_repository.dart';
import 'package:chat_ai/src/navigation/app_router.dart';
import 'package:chat_ai/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  final getIt = GetIt.I;
  getIt
    ..registerLazySingleton(
      () => ApiClient(
        DioProvider.instance(),
        baseUrl: dotenv.env['BASE_URL'],
      ),
    )
    ..registerLazySingleton(
      () => ChatRepository(
        getIt<ApiClient>(),
      ),
    );

  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chat AI Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
      ),
    );
  }
}
