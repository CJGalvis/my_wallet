import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/screens.dart';
import 'routes.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final key = ref.watch(navigatorKeyProvider);

  return GoRouter(
    navigatorKey: key,
    initialLocation: WellcomeScreen.routeName,
    routes: [
      GoRoute(
        path: WellcomeScreen.routeName,
        name: WellcomeScreen.routeName,
        builder: (context, _) =>
            AuthRoutes.getWellcomeScreen(context),
      ),
      GoRoute(
        path: LoginScreen.routeName,
        name: LoginScreen.routeName,
        builder: (context, _) => AuthRoutes.getLoginScreen(context),
      ),
      GoRoute(
        path: RegisterScreen.routeName,
        name: RegisterScreen.routeName,
        builder: (context, _) =>
            AuthRoutes.getRegisterScreen(context),
      ),
      GoRoute(
        path: HomeScreen.routeName,
        name: HomeScreen.routeName,
        builder: (context, _) => HomeScreen(),
      ),
    ],
  );
}

@riverpod
GlobalKey<NavigatorState> navigatorKey(Ref ref) =>
    GlobalKey<NavigatorState>();
