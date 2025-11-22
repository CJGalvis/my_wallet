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
      ShellRoute(
        builder: (context, state, child) => HomeScreen(child: child),
        routes: [
          GoRoute(
            path: DashboardScreen.routeName,
            name: DashboardScreen.routeName,
            builder: (context, _) =>
                HomeRoutes.getDashboardScreen(context),
          ),
          GoRoute(
            path: ReportScreen.routeName,
            name: ReportScreen.routeName,
            builder: (context, _) =>
                HomeRoutes.getReportScreen(context),
          ),
          GoRoute(
            path: SettingsScreen.routeName,
            name: SettingsScreen.routeName,
            builder: (context, _) =>
                HomeRoutes.getSettingsScreen(context),
          ),
        ],
      ),
    ],
  );
}

@riverpod
GlobalKey<NavigatorState> navigatorKey(Ref ref) =>
    GlobalKey<NavigatorState>();
