import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/home/domain/models/pocket_model.dart';
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
        builder: (context, _) => HomeRoutes.getHomeScreen(context),
      ),
      GoRoute(
        path: ProfileScreen.routeName,
        name: ProfileScreen.routeName,
        builder: (context, _) => ProfileScreen(),
      ),
      GoRoute(
        path: SettingsScreen.routeName,
        name: SettingsScreen.routeName,
        builder: (context, _) => SettingsScreen(),
      ),
      GoRoute(
        path: NewPocketScreen.routeName,
        name: NewPocketScreen.routeName,
        builder: (context, _) => NewPocketScreen(),
      ),
      GoRoute(
        path: NewRecordScreen.routeName,
        name: NewRecordScreen.routeName,
        builder: (context, _) => NewRecordScreen(),
      ),
      GoRoute(
        path: PocketScreen.routeName,
        name: PocketScreen.routeName,
        builder: (context, state) => PocketScreen(
          pocket: state.extra as Pocket,
        ),
      ),
      GoRoute(
        path: RecordsScreen.routeName,
        name: RecordsScreen.routeName,
        builder: (context, _) => RecordsScreen(),
      ),
       GoRoute(
        path: SummaryIncomesScreen.routeName,
        name: SummaryIncomesScreen.routeName,
        builder: (context, _) => SummaryIncomesScreen(),
      ),
       GoRoute(
        path: SummaryExpensesScreen.routeName,
        name: SummaryExpensesScreen.routeName,
        builder: (context, _) => SummaryExpensesScreen(),
      ),
    ],
  );
}

@riverpod
GlobalKey<NavigatorState> navigatorKey(Ref ref) =>
    GlobalKey<NavigatorState>();
